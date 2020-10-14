import 'package:automanager/models/sharedPrefUtil.dart';
import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class MakeSaleModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  final SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();

  Map<String, String> mySuggestions = new Map();
  Map<String, String> myCategoriesOfSuggestions = new Map();

  String myCurrentStockName = "";
  String myCurrentStockCategory = "";
  int myCurrentStockQuantity = 0;
  int myCurrentPriceEach = 0;
  String myImagePath = "";

  String myCurrentSelectedStockId,
      myCurrentSelectedStockName,
      myCurrentSelectedStockCategory,
      myCurrentSelectedQuantity,
      myCurrentSelectedPriceEach,
      myCurrentSelectedImageFile;

  Future<void> findMySuggestions(String mySearchBar) async {
    await sharedPrefUtil.getIsCurrentUserLoggedIn().then((value) async {
      if (value == true) {
        await firebaseFirestore
            .collection(myDatabaseTags.allDatabaseTag)
            .doc("J82BQucjHo0amaOm5Waz")
            .collection(myDatabaseTags.myDatabaseInventoryTag)
            .get()
            .then((myCategories) async {
          for (int indexCategory = 0;
              indexCategory < myCategories.docs.length;
              indexCategory++) {
            if (mySuggestions.length == 10) {
              break;
            } else {
              await firebaseFirestore
                  .collection(myDatabaseTags.allDatabaseTag)
                  .doc("J82BQucjHo0amaOm5Waz")
                  .collection(myDatabaseTags.myDatabaseInventoryTag)
                  .doc(myCategories.docs.toList()[indexCategory].id)
                  .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
                  .get()
                  .then((QuerySnapshot snapshot) {
                print("im in category: " +
                    myCategories.docs.toList()[indexCategory].get("Category"));
                print("index: " + indexCategory.toString());
                print("awaiting action find search item ");
                print("if found do action " + snapshot.docs.length.toString());
                for (int indexSnapShot = 0;
                    indexSnapShot < snapshot.docs.length;
                    indexSnapShot++) {
                  print("my snapshot: " +
                      snapshot.docs[indexSnapShot]
                          .get(myDatabaseTags.myStockNameTag)
                          .toString()
                          .toLowerCase());
                  if (snapshot.docs[indexSnapShot]
                      .get(myDatabaseTags.myStockNameTag)
                      .toLowerCase()
                      .contains(mySearchBar.toLowerCase())) {
                    mySuggestions.clear();
                    myCategoriesOfSuggestions.clear();
                    print("item found consistory: " +
                        snapshot.docs[indexSnapShot].get("Stock_name"));
                    mySuggestions.addAll({
                      snapshot.docs[indexSnapShot].id:
                          snapshot.docs[indexSnapShot].get("Stock_name")
                    });
                    myCategoriesOfSuggestions.addAll({
                      snapshot.docs[indexSnapShot].id:
                          myCategories.docs.toList()[indexCategory].id
                    });
                  }
                }
              }).catchError((onError) {
                print("error on adding suggestions: " + onError.toString());
              });
            }
          }
        }).catchError((onError) {
          print("error on finding categorie: " + onError.toString());
        });
      }
    }).catchError((onError) {
      print("is current user logged in but error: " + onError.toString());
    });
  }

  Future<List<String>> displayItemOnSelection(
      String categoryId, String stockId) async {
    List<String> myList;
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc("J82BQucjHo0amaOm5Waz")
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .doc(categoryId)
        .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
        .doc(stockId)
        .get()
        .then((myStock) {
      myList = [
        stockId,
        categoryId,
        myStock.get(myDatabaseTags.myStockNameTag),
        myStock.get(myDatabaseTags.myStockCategoryTag),
        myStock.get(myDatabaseTags.myStockQuantityTag).toString(),
        myStock.get(myDatabaseTags.myStockPriceTag).toString(),
        ""
      ];
    }).catchError((onError) {
      print("error on display stocks: " + onError.toString());
      myList = [null];
    });
    return myList;
  }
}
