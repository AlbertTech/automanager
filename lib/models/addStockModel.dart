import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddStockModel {
  MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  Map<String, String> myCategories = new Map();
  String myDatabaseLocation = "none";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> addStock(
      String sharedPrefId,
      String txtStockName,
      String txtStockCategory,
      int txtStockQuantity,
      int txtStockPriceEach,
      String txtStockDateOrder,
      String txtStockDateArrival,
      String txtStockDistributor,
      Map myMapDesc) async {
    if (firebaseAuth.currentUser != null &&
        firebaseAuth.currentUser.toString().isNotEmpty) {
      print("====checked firebase current user not null=======");
      if (firebaseAuth.currentUser.uid.isNotEmpty &&
          firebaseAuth.currentUser.uid == sharedPrefId) {
        print("====checked firebase authUID equal to sharedPref UID =======");
        print("my fireAuth uid: " + firebaseAuth.currentUser.uid);
        print("my sharedPref uid: " + sharedPrefId);
        await findMyCategories(txtStockCategory);
        print("====checked find categories =======");
        for (int index = 0; index < myCategories.length; index++) {
          if (myCategories.values.toList()[index] ==
              txtStockCategory.toLowerCase()) {
            await firebaseFirestore
                .collection("Database")
                .doc("H2Rx5qFb3bfMxb6oA7ax")
                .collection(myDatabaseTags.myDatabaseInventoryTag)
                .doc(myCategories.keys.toList()[index])
                .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
                .add({
              myDatabaseTags.myStockNameTag: txtStockName,
              myDatabaseTags.myStockCategoryTag: txtStockCategory,
              myDatabaseTags.myStockQuantityTag: txtStockQuantity,
              myDatabaseTags.myStockPriceTag: txtStockPriceEach,
              myDatabaseTags.myStockOrderedDate: txtStockDateOrder,
              myDatabaseTags.myStockDateArrival: txtStockDateArrival,
              myDatabaseTags.myStockBoughtFrom: txtStockDistributor,
            }).then((value) {
              FirebaseFirestore.instance
                  .collection(myDatabaseTags.allDatabaseTag)
                  .doc(value.id)
                  .collection(myDatabaseTags.myStockDescriptionTag)
                  .add(myMapDesc)
                  .catchError((onError) {
                print("error trap adding desc: " + onError.toString());
              });
            }).catchError((onError) {
              print("error trap on adding inventory: " + onError.toString());
            });
            break;
          } else if (myCategories.values.toList()[index] != txtStockCategory &&
              index == myCategories.length - 1) {
            await firebaseFirestore
                .collection(myDatabaseTags.allDatabaseTag)
                .doc("H2Rx5qFb3bfMxb6oA7ax")
                .collection(myDatabaseTags.myDatabaseInventoryTag)
                .add({
              myDatabaseTags.myDatabaseCategoryTag: txtStockCategory
            }).then((afterAddingCategoryValue) async {
              await firebaseFirestore
                  .collection("Database")
                  .doc("H2Rx5qFb3bfMxb6oA7ax")
                  .collection(myDatabaseTags.myDatabaseInventoryTag)
                  .doc(afterAddingCategoryValue.id)
                  .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
                  .add({
                myDatabaseTags.myStockNameTag: txtStockName,
                myDatabaseTags.myStockCategoryTag: txtStockCategory,
                myDatabaseTags.myStockQuantityTag: txtStockQuantity,
                myDatabaseTags.myStockPriceTag: txtStockPriceEach,
                myDatabaseTags.myStockOrderedDate: txtStockDateOrder,
                myDatabaseTags.myStockDateArrival: txtStockDateArrival,
                myDatabaseTags.myStockBoughtFrom: txtStockDistributor,
              }).then((value) async {
                await FirebaseFirestore.instance
                    .collection(myDatabaseTags.allDatabaseTag)
                    .doc(value.id)
                    .collection(myDatabaseTags.myStockDescriptionTag)
                    .add(myMapDesc)
                    .catchError((onError) {
                  print("error trap adding desc: " + onError.toString());
                });
              }).catchError((onError) {
                print("error trap on adding inventory: " + onError.toString());
              });
            }).catchError((onError) {
              print("error on adding category: " + onError.toString());
            });
            break;
          } else {
            continue;
          }
        }
      } else {
        print("current user is logged in, but no uid");
      }
    } else {
      print("current user logged in");
    }
  }

  Future<void> findMyCategories(txtCategory) async {
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc("H2Rx5qFb3bfMxb6oA7ax")
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .get()
        .then((QuerySnapshot snapshot) {
      print(snapshot.docs.length);
      for (int i = 0; i < snapshot.docs.length; i++) {
        myCategories.addAll({
          snapshot.docs.toList()[i].id:
              snapshot.docs.toList()[i].get("Category").toString().toLowerCase()
        });
      }
      print("new list: " + myCategories.toString());
    }).catchError((onError) {
      print("on error getting list of category: " + onError.toString());
    });
  }
}
