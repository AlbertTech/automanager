import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ItemDisplayModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();

  Map<String, String> mySuggestions = new Map();
  Map<String, String> myCategoriesOfSuggestions = new Map();
  List<List<String>> mySuggestionsDescription = new List();
  Map myDescriptionsFound = new Map();
  bool isSuccessful;

  Future<bool> findMySuggestions(
      bool isLoggedIn, String mySearchBar, String currentDatabaseId) async {
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(currentDatabaseId)
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .get()
        .then((myDatabase) {
      if (myDatabase.docs.length > 0) {
        mySuggestions.clear();
        mySuggestionsDescription.clear();
        myDatabase.docs.forEach((element) {
          myCategoriesOfSuggestions
              .addAll({element.id: myDatabaseTags.myStockCategoryTag});
          mySuggestions
              .addAll({element.id: element.get(myDatabaseTags.myStockNameTag)});
          mySuggestionsDescription.add([
            element.id,
            element.get(myDatabaseTags.myStockNameTag),
            element.get(myDatabaseTags.myStockCategoryTag),
            element.get(myDatabaseTags.myStockImageCacheTag)
          ]);
        });

        isSuccessful = true;
        print("my suggestions: " +
            mySuggestions.values.toList().toString() +
            " my categories: ");
      } else {
        isSuccessful = false;
      }
    }).catchError((onError) {
      isSuccessful = false;
      print("error getting this database: " + onError.toString());
    }).timeout(Duration(seconds: 8), onTimeout: () {
      isSuccessful = false;
    });
    return isSuccessful;
  }

  Future<List<dynamic>> displayItemOnSelection(
      String stockId, String currentDatabaseId) async {
    List<String> myList;
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(currentDatabaseId)
        .collection(myDatabaseTags.myDatabaseInventoryTag)
        .doc(stockId)
        .get()
        .then((myStock) {
      myList = [
        stockId,
        myStock.get(myDatabaseTags.myStockNameTag).toString(),
        myStock.get(myDatabaseTags.myStockCategoryTag).toString(),
        myStock.get(myDatabaseTags.myStockQuantityTag).toString(),
        myStock.get(myDatabaseTags.myStockPriceTag).toString(),
        myStock.get(myDatabaseTags.myStockImageCacheTag).toString()
      ];
      myDescriptionsFound =  myStock.get(myDatabaseTags.myStockDescriptionTag);
      print("my list: " + myList.toString());
    }).catchError((onError) {
      print("error on display stocks: " + onError.toString());
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
