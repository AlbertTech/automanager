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
    String currentDatabaseId,
    String txtStockName,
    String txtStockCategory,
    int txtStockQuantity,
    int txtStockPriceEach,
    String txtStockDateOrder,
    String txtStockDateArrival,
    String txtStockDistributor,
    Map myMapDesc,
  ) async {
    if (firebaseAuth.currentUser != null &&
        firebaseAuth.currentUser.toString().isNotEmpty) {
      print("====checked firebase current user not null=======");
      if (firebaseAuth.currentUser.uid.isNotEmpty &&
          firebaseAuth.currentUser.uid == sharedPrefId) {
        print("====checked firebase authUID equal to sharedPref UID =======");
        print("my fireAuth uid: " + firebaseAuth.currentUser.uid);
        print("my sharedPref uid: " + sharedPrefId);
        await findMyCategories(txtStockCategory, currentDatabaseId);
        print("====checked finding categories =======  ");
        if (myCategories.length > 0) {
          for (int index = 0; index < myCategories.length; index++) {
            if (myCategories.values.toList()[index].toLowerCase() ==
                txtStockCategory.toLowerCase()) {
              await firebaseFirestore
                  .collection(myDatabaseTags.allDatabaseTag)
                  .doc(currentDatabaseId)
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
              }).then((afterAddingCategoryValue) async {
                await firebaseFirestore
                    .collection(myDatabaseTags.allDatabaseTag)
                    .doc(currentDatabaseId)
                    .collection(myDatabaseTags.myDatabaseInventoryTag)
                    .doc(myCategories.keys.toList()[index])
                    .collection(
                    myDatabaseTags.myDatabaseCategoryMerchandiseTag)
                    .doc(afterAddingCategoryValue.id)
                    .collection(myDatabaseTags.myStockDescriptionTag)
                    .add(myMapDesc)
                    .catchError((onError) {
                  print("error trap adding desc: " + onError.toString());
                });
              }).catchError((onError) {
                print("error trap on adding inventory: " + onError.toString());
              });
              break;
            } else if (myCategories.values.toList()[index].toLowerCase() !=
                    txtStockCategory.toLowerCase() &&
                index ==
                    (myCategories.length == 0 ? 0 : myCategories.length - 1)) {
              await firebaseFirestore
                  .collection(myDatabaseTags.allDatabaseTag)
                  .doc(currentDatabaseId)
                  .collection(myDatabaseTags.myDatabaseInventoryTag)
                  .add({
                myDatabaseTags.myDatabaseCategoryTag: txtStockCategory
              }).then((afterAddingCategoryValue) async {
                await firebaseFirestore
                    .collection(myDatabaseTags.allDatabaseTag)
                    .doc(currentDatabaseId)
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
                  await firebaseFirestore
                      .collection(myDatabaseTags.allDatabaseTag)
                      .doc(currentDatabaseId)
                      .collection(myDatabaseTags.myDatabaseInventoryTag)
                      .doc(afterAddingCategoryValue.id)
                      .collection(
                          myDatabaseTags.myDatabaseCategoryMerchandiseTag)
                      .doc(value.id)
                      .collection(myDatabaseTags.myStockDescriptionTag)
                      .add(myMapDesc)
                      .catchError((onError) {
                    print("error trap adding desc: " + onError.toString());
                  });
                }).catchError((onError) {
                  print(
                      "error trap on adding inventory: " + onError.toString());
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
          print("this length sucks");
          await firebaseFirestore
              .collection(myDatabaseTags.allDatabaseTag)
              .doc(currentDatabaseId)
              .collection(myDatabaseTags.myDatabaseInventoryTag)
              .add({
            myDatabaseTags.myDatabaseCategoryTag: txtStockCategory
          }).then((afterAddingCategoryValue) async {
            await firebaseFirestore
                .collection(myDatabaseTags.allDatabaseTag)
                .doc(currentDatabaseId)
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
              await firebaseFirestore
                  .collection(myDatabaseTags.allDatabaseTag)
                  .doc(currentDatabaseId)
                  .collection(myDatabaseTags.myDatabaseInventoryTag)
                  .doc(afterAddingCategoryValue.id)
                  .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
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
        }
      } else {
        print("current user is logged in, but no uid");
      }
    } else {
      print("current user logged in");
    }
  }

  Future<void> findMyCategories(
      String txtCategory, String currentDatabaseId) async {
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(currentDatabaseId)
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .get()
        .then((QuerySnapshot snapshot) {
      print(snapshot.docs.length);
      for (int i = 0; i < snapshot.docs.length; i++) {
        //if snapshot.docs[i].data().containsKey("ofCategory")
        myCategories.addAll({
          snapshot.docs.toList()[i].id: snapshot.docs
              .toList()[i]
              .get(myDatabaseTags.myDatabaseCategoryTag)
              .toString()
              .toLowerCase()
        });
      }
      print("new list: " + myCategories.toString());
    }).catchError((onError) {
      print("on error getting list of category: " + onError.toString());
    });
  }
}
