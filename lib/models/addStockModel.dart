import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'dart:async';

class AddStockModel {
  MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<void> addStock(
    String sharedPrefId,
    String currentDatabaseId,
    String txtStockName,
    String txtStockCategory,
    int txtStockQuantity,
    int txtStockPriceEach,
    String txtStockDateOrder,
    String txtStockDateArrival,
    String txtStockDistributor,
    Map myMapDesc,
    File myImageFile,
  ) async {
    if (firebaseAuth.currentUser != null &&
        firebaseAuth.currentUser.toString().isNotEmpty) {
      print("====checked firebase current user not null=======");
      if (firebaseAuth.currentUser.uid.isNotEmpty &&
          firebaseAuth.currentUser.uid == sharedPrefId) {
        print("====checked firebase authUID equal to sharedPref UID =======");
        print("my fireAuth uid: " + firebaseAuth.currentUser.uid);
        print("my sharedPref uid: " + sharedPrefId);
        print("====checked finding categories =======  ");
        await ifCategoryNewThenUpload(currentDatabaseId, txtStockCategory);
        await uploadImageFile(currentDatabaseId, txtStockName, myImageFile)
            .then((downloadUrl) async {
          if (downloadUrl.isNotEmpty) {
            await firebaseFirestore
                .collection(myDatabaseTags.allDatabaseTag)
                .doc(currentDatabaseId)
                .collection(myDatabaseTags.myDatabaseInventoryTag)
                .add({
              myDatabaseTags.myStockNameTag: txtStockName,
              myDatabaseTags.myStockCategoryTag: txtStockCategory,
              myDatabaseTags.myStockQuantityTag: txtStockQuantity,
              myDatabaseTags.myStockPriceTag: txtStockPriceEach,
              myDatabaseTags.myStockOrderedDate: txtStockDateOrder,
              myDatabaseTags.myStockDateArrival: txtStockDateArrival,
              myDatabaseTags.myStockBoughtFrom: txtStockDistributor,
              myDatabaseTags.myStockImageCacheTag: downloadUrl,
              myDatabaseTags.myStockDescriptionTag: myMapDesc
            }).catchError((onError) {
              print("error trap on adding inventory: " + onError.toString());
            });
          } else {}
        });
      } else {
        print("current user is logged in, but no uid");
      }
    } else {
      print("current user logged in");
    }
  }

  Future<void> ifCategoryNewThenUpload(
      String currentDatabaseId, String txtStockCategory) async {
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(currentDatabaseId)
        .get()
        .then((myDatabase) async {
      List<String> myCategories = new List();
      myCategories = List<String>.from(
          myDatabase.get(myDatabaseTags.myInventoryCategoriesTag));
      myDatabase
          .get(myDatabaseTags.myInventoryCategoriesTag)
          .toString()
          .split(" ")
          .forEach((element) {
        if (element.startsWith("[")) {
          element = element.substring(1);
        }
        if (element.endsWith("]")) {
          element = element.substring(0, element.length - 1);
        }
        if (element.endsWith(",")) {
          element = element.substring(0, element.length - 1);
        }
        element = element.trim();
        myCategories.add(element);
      });
      for (int index = 0; index < myCategories.length; index++) {
        if (myCategories[index].toLowerCase() ==
            txtStockCategory.toLowerCase()) {
          break;
        } else if (myCategories[index].toLowerCase() !=
                txtStockCategory.toLowerCase() &&
            index == myCategories.length - 1) {
          await firebaseFirestore
              .collection(myDatabaseTags.allDatabaseTag)
              .doc(currentDatabaseId)
              .update({
            myDatabaseTags.myInventoryCategoriesTag:
                FieldValue.arrayUnion([txtStockCategory])
          }).catchError((onError) {
            print("error trap on adding category#2: " + onError.toString());
          });
          break;
        } else {
          continue;
        }
      }
    }).catchError((onError) {
      print("error trap on adding category#1: " + onError.toString());
    });
  }

  Future<String> uploadImageFile(
      String dbId, String stockName, File myImageFile) async {
    try {
      TaskSnapshot taskSnapshot = await firebaseStorage
          .ref()
          .child("$dbId/$stockName/Stock_image")
          .putFile(myImageFile);
      String fileLocation =
          "gs://automanager-cb61f.appspot.com/" + taskSnapshot.ref.fullPath;
      print("my url: " + fileLocation);
      return fileLocation;
    } on FirebaseException catch (e) {
      print("error on printing: " + e.toString());
      return null;
    }
  }
}
