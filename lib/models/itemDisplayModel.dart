import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ItemDisplayModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();

  Map<String, String> mySuggestions = new Map();
  Map<String, String> myCategoriesOfSuggestions = new Map();

  bool isSuccessful;

  Future<bool> getMySuggestions(
      String mySearch, String myCurrentDatabaseUid) async {
    isSuccessful = false;
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(myCurrentDatabaseUid)
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .get()
        .then((myFoundCategories) async {
      if (myFoundCategories.docs.isNotEmpty) {
        for (int indexCategory = 0;
            indexCategory < myFoundCategories.docs.length;
            indexCategory++) {
          await firebaseFirestore
              .collection(myDatabaseTags.allDatabaseTag)
              .doc(myCurrentDatabaseUid)
              .collection(myDatabaseTags.myDatabaseInventoryTag)
              .doc(myFoundCategories.docs[indexCategory].id)
              .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
              .get()
              .then((QuerySnapshot foundMerchandise) {
            for (int indexMerchandise = 0;
                indexMerchandise < foundMerchandise.docs.length;
                indexMerchandise++) {
              if (foundMerchandise.docs[indexMerchandise]
                  .get(myDatabaseTags.myStockNameTag)
                  .toString()
                  .toLowerCase()
                  .contains(mySearch.toLowerCase())) {
                print("my found category: " +
                    foundMerchandise.docs[indexMerchandise].get("Stock_name") +
                    " mysearch: " +
                    mySearch);
                mySuggestions.clear();
                myCategoriesOfSuggestions.clear();
                mySuggestions.addAll({
                  foundMerchandise.docs[indexMerchandise].id: foundMerchandise
                      .docs[indexMerchandise]
                      .get(myDatabaseTags.myStockNameTag)
                });
                myCategoriesOfSuggestions.addAll({
                  foundMerchandise.docs[indexMerchandise].id:
                      myFoundCategories.docs[indexCategory].id
                });
                isSuccessful = true;
              }
            }

            print("my suggestions length: " +
                mySuggestions.length.toString() +
                " succesful: " +
                isSuccessful.toString());
            return isSuccessful;
          }).catchError((onError) {
            print("error on finding merchandises: " + onError.toString());
            isSuccessful = false;
          });
        }
      } else {
        isSuccessful = false;
      }
    }).catchError((onError) {
      print("error on getting categories: " + onError.toString());
      isSuccessful = false;
    });

    return isSuccessful;
  }

  Future<List<dynamic>> displayItemOnSelection(
      String categoryId, String stockId, String myCurrentDatabaseUid) async {
    List<dynamic> myList;
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(myCurrentDatabaseUid)
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .doc(categoryId)
        .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
        .doc(stockId)
        .get()
        .then((myStock) async {
      await firebaseFirestore
          .collection(myDatabaseTags.allDatabaseTag)
          .doc(myCurrentDatabaseUid)
          .collection(myDatabaseTags.myDatabaseInventoryTag)
          .doc(categoryId)
          .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
          .doc(stockId)
          .collection(myDatabaseTags.myStockDescriptionTag)
          .get()
          .then((value) {
        return myList = [
          stockId,
          categoryId,
          myStock.get(myDatabaseTags.myStockNameTag),
          myStock.get(myDatabaseTags.myStockCategoryTag),
          myStock.get(myDatabaseTags.myStockQuantityTag).toString(),
          myStock.get(myDatabaseTags.myStockPriceTag).toString(),
          value.docs[0].data()
        ];
      }).catchError((onError) {
        print("error on getting desc info stock: " + onError.toString());
        myList = [null];
      });
    }).catchError((onError) {
      print("error on getting info stock: " + onError.toString());
      myList = [null];
    });
    return myList;
  }

  Future<bool> updateAnItem(Map<String, dynamic> myItemToUpdate,
      String myCurrentDatabaseId, String myStockId, String myCategoryId) async {
    isSuccessful = false;
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(myCurrentDatabaseId)
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .doc(myCategoryId)
        .collection(myDatabaseTags.myDatabaseCategoryMerchandiseTag)
        .doc(myStockId)
        .update(myItemToUpdate)
        .then((value) {
      isSuccessful = true;
    }).catchError((onError) {
      print("error on updating item: " + onError.toString());
      isSuccessful = false;
    }).timeout(Duration(seconds: 5));
    return isSuccessful;
  }
}
