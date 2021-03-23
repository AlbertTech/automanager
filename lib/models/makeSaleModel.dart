import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';

class MakeSaleModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();

  Map<String, String> mySuggestions = new Map();
  List<List<String>> mySuggestionsDescription = new List();
  Map<String, String> myMap = new Map();
  String myCurrentStockName = "";
  String myCurrentStockCategory = "";
  int myCurrentStockQuantity = 0;
  int myCurrentPriceEach = 0;
  String myImagePath = "";

  bool isSuccessful = false;
  String myCurrentSelectedStockId,
      myCurrentSelectedStockName,
      myCurrentSelectedStockCategory,
      myCurrentSelectedQuantity,
      myCurrentSelectedPriceEach,
      myCurrentSelectedImageFile;

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
        print(
            "my suggestions: " + mySuggestions.toString() + " my categories: ");
      } else {
        isSuccessful = false;
      }
    }).catchError((onError) {
      isSuccessful = false;
      print("error getting this database: " + onError.toString());
    }).timeout(Duration(seconds: 8), onTimeout: () {
      isSuccessful = false;
    });
  }

  Future<List<String>> displayItemOnSelection(
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
        myStock.get(myDatabaseTags.myStockNameTag),
        myStock.get(myDatabaseTags.myStockCategoryTag),
        myStock.get(myDatabaseTags.myStockQuantityTag).toString(),
        myStock.get(myDatabaseTags.myStockPriceTag).toString(),
        myStock.get(myDatabaseTags.myStockImageCacheTag).toString()
      ];
      print("my list: "+myList.toString());
    }).catchError((onError) {
      print("error on display stocks: " + onError.toString());
      myList = [null];
    });
    return myList;
  }

  Future<Widget> loadImage(
      BuildContext context, String mySelectedItemValue) async {

  }
}
