import 'package:automanager/models/itemDisplayModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/textValidatorUtility.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ItemDisplayViewModel {
  final ItemDisplayModel itemDisplayModel = new ItemDisplayModel();
  final TextValidatorUtility textValidatorUtility = new TextValidatorUtility();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  Map<String, String> mySuggestions = new Map();
  Map<String, String> myCategoriesOfSuggestions = new Map();
  List<String> mySelectedItemValues = new List();

  final int myListIndexStockId = 0,
      myListIndexCategoryId = 1,
      myListIndexStockName = 2,
      myListIndexStockCategory = 3,
      myListIndexStockQuantity = 4,
      myListIndexStockPriceEach = 5,
      myListIndexStockImageFile = 6;

  Future<void> searchMyItems(TextEditingController mySearch,
      BuildContext context,
      Function updateMyMaps,
      Map<String, String> mySuggestions,
      List<String> myNewSuggestion) async {
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(mySearch.text) ==
        true) {
      sharedPrefUtil.getIsCurrentDatabase().then((myCurrentDatabaseId) async {
        await Future.delayed(const Duration(seconds: 1), () async {
          await sharedPrefUtil
              .getIsCurrentUserLoggedIn()
              .then((isLoggedIn) async {
            if (isLoggedIn == true) {
              print("now finding suggestions");
              await itemDisplayModel
                  .getMySuggestions(mySearch.text, myCurrentDatabaseId)
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

  Future<void> anItemSelected(String mySelectedText,
      Function updateMySelectedValues,
      List<String> mySelectedItemValues,
      BuildContext ctx) async {
    FocusScope.of(ctx).unfocus();
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(mySelectedText) ==
        true) sharedPrefUtil.getIsCurrentDatabase().then((currentDatabaseId) {
      mySuggestions.forEach((stockId_1, myStockName) {
        if (mySelectedText.toLowerCase() == myStockName.toLowerCase()) {
          myCategoriesOfSuggestions.forEach((stockId_2, categoryId) async {
            if (stockId_1 == stockId_2) {
              print("my key category and suggestion: " +
                  categoryId +
                  " " +
                  stockId_2);
              await itemDisplayModel
                  .displayItemOnSelection(
                  categoryId, stockId_2, currentDatabaseId)
                  .then((myList) {
                if (myList.length > 0) {
                  mySelectedItemValues.clear();
                  this.mySelectedItemValues.clear();
                  this.mySelectedItemValues.addAll(myList);
                  updateMySelectedValues(
                      mySelectedItemValues, this.mySelectedItemValues);
                  print("view model my selected item values: " +
                      mySelectedItemValues.toString());
                  return;
                }
              });
            }
          });
        }
      });
    });
  }
}
