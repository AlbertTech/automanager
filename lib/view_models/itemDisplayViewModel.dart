import 'package:automanager/models/itemDisplayModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:automanager/utilities/textValidatorUtility.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ItemDisplayViewModel {
  final ItemDisplayModel itemDisplayModel = new ItemDisplayModel();
  final TextValidatorUtility textValidatorUtility = new TextValidatorUtility();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  Map<String, String> mySuggestions = new Map();
  Map<String, String> myCategoriesOfSuggestions = new Map();
  List<String> mySelectedItemValues = new List();
  Map<dynamic, dynamic> myDescription = new Map();
  final int myListIndexStockId = 0,
      myListIndexStockName = 1,
      myListIndexStockCategory = 2,
      myListIndexStockQuantity = 3,
      myListIndexStockPriceEach = 4,
      myListIndexStockImage = 5;

  Future<void> searchMyItems(
      TextEditingController mySearch,
      BuildContext context,
      Function updateMyMaps,
      Map<String, String> mySuggestions,
      List<String> myNewSuggestion) async {
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(mySearch.text) ==
        true) {
      sharedPrefUtil.getIsCurrentDatabaseId().then((myCurrentDatabaseId) async {
        await Future.delayed(const Duration(seconds: 1), () async {
          await sharedPrefUtil
              .getIsCurrentUserLoggedIn()
              .then((isLoggedIn) async {
            if (isLoggedIn == true) {
              print("now finding suggestions");
              await itemDisplayModel
                  .findMySuggestions(true, mySearch.text, myCurrentDatabaseId)
                  .then((isSuccessfulFinding) {
                print("isssuccesful: " + isSuccessfulFinding.toString());
                if (isSuccessfulFinding == true) {
                  mySuggestions.clear();
                  myNewSuggestion.clear();
                  this.mySuggestions.addAll(itemDisplayModel.mySuggestions);
                  this
                      .myCategoriesOfSuggestions
                      .addAll(itemDisplayModel.myCategoriesOfSuggestions);
                  updateMyMaps(
                      mySuggestions, this.mySuggestions, myNewSuggestion);
                  FocusScope.of(context).unfocus();
                  print("success my suggestions" +
                      mySuggestions.values.toList().toString());
                } else {
                  print("failed my suggestions" +
                      mySuggestions.values.toList().toString());
                }
              }).catchError((onError) {
                print("error on getting suggestions: " + onError.toString());
              });
            }
          }).catchError((onError) {
            print("error on getting user loggedIn: " + onError.toString());
          });
        });
      });
    }
  }

  Future<void> anItemSelected(
      String mySelectedText,
      Function updateMySelectedValues,
      List<String> mySelectedItemValues,
      Map<String, dynamic> myDescriptions,
      BuildContext ctx) async {
    FocusScope.of(ctx).unfocus();
    print("item selected");
    print("my suggestions: " + mySuggestions.toString());
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(mySelectedText) ==
        true)
      sharedPrefUtil.getIsCurrentDatabaseId().then((currentDatabaseId) {
        mySuggestions.forEach((stockId_1, myStockName) {
          if (mySelectedText.toLowerCase() == myStockName.toLowerCase()) {
            print("exact keys and values");
            print(
                "categories of suggs: " + myCategoriesOfSuggestions.toString());
            myCategoriesOfSuggestions.forEach((stockId_2, categoryId) async {
              print("doing for each");
              if (stockId_1 == stockId_2) {
                print("my key category and suggestion: " +
                    categoryId +
                    " " +
                    stockId_2);
                await itemDisplayModel
                    .displayItemOnSelection(stockId_2, currentDatabaseId)
                    .then((myFoundList) {
                  if (myFoundList.length > 0) {
                    print("my list: " + myFoundList.toString());
                    this.mySelectedItemValues.clear();
                    this.myDescription.clear();
                    mySelectedItemValues.clear();
                    myDescriptions.clear();
                    this.mySelectedItemValues = myFoundList;
                    myDescription = itemDisplayModel.myDescriptionsFound;
                    updateMySelectedValues(
                        mySelectedItemValues,
                        this.mySelectedItemValues,
                        myDescriptions,
                        this.myDescription);
                    print("view model my selected item values: " +
                        mySelectedItemValues.toString());
                    return;
                  }
                });
              } else {
                print("failed: ");
              }
            });
          }
        });
      });
  }

  Future<void> updateThisItem(List<String> myListToCheck) async {
    Map<String, dynamic> myItemToUpdate = new Map();

    for (int index = 0; index < myListToCheck.length; index++) {
      if (myListToCheck[index] != mySelectedItemValues[index + 2]) {
        switch (index) {
          case 0:
            myItemToUpdate
                .addAll({myDatabaseTags.myStockNameTag: myListToCheck[index]});
            break;
          case 1:
            myItemToUpdate.addAll(
                {myDatabaseTags.myStockCategoryTag: myListToCheck[index]});
            break;
          case 2:
            myItemToUpdate.addAll(
                {myDatabaseTags.myStockQuantityTag: myListToCheck[index]});
            break;
          case 3:
            myItemToUpdate
                .addAll({myDatabaseTags.myStockPriceTag: myListToCheck[index]});
            break;
        }
      }
    }
    myItemToUpdate.addAll({mySelectedItemValues[0]: mySelectedItemValues[1]});
    print("myitem to be updated: " +
        myItemToUpdate.keys.toString() +
        " " +
        myItemToUpdate.values.toString());
    sharedPrefUtil.getIsCurrentDatabaseId().then((value) async {
      await itemDisplayModel
          .updateAnItem(myItemToUpdate, value.toString(),
              mySelectedItemValues[0], mySelectedItemValues[1])
          .then((value) {
        print("is done: was ? $value");
      });
    }).catchError((onError) {
      print("error on getting cbase: " + onError.toString());
    });
  }
}
