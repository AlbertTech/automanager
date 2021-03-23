import 'dart:async';
import 'package:automanager/models/makeSaleModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/textValidatorUtility.dart';
import 'package:flutter/material.dart';

class MakeSaleViewModel {
  final MakeSaleModel makeSaleModel = new MakeSaleModel();
  final TextValidatorUtility textValidatorUtility = new TextValidatorUtility();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();

  Map<String, String> mySuggestions = new Map();
  List<String> mySelectedItemValues = new List();
  List<List<String>> mySuggestionsDescription = new List();

  final int myListIndexStockId = 0,
      myListIndexStockName = 1,
      myListIndexStockCategory = 2,
      myListIndexStockQuantity = 3,
      myListIndexStockPriceEach = 4,
      myListIndexStockImageFile = 5;

  Future<void> commandSearchForSuggestions(
      String txtSearchBar,
      BuildContext ctx,
      Function myMethod,
      Map<String, String> mySuggestions,
      List<String> mySuggestionListDisplay,
      List<List<String>> mySuggestionsDescription) async {
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(txtSearchBar) ==
        true) {
      await Future.delayed(const Duration(seconds: 1)).then((value) async {
        print("now finding suggestions: " + txtSearchBar);
        await sharedPrefUtil
            .getIsCurrentUserLoggedIn()
            .then((currentUserLoggedIn) async {
          await sharedPrefUtil
              .getIsCurrentDatabaseId()
              .then((currentDatabaseId) async {
            await makeSaleModel
                .findMySuggestions(
                    currentUserLoggedIn, txtSearchBar, currentDatabaseId)
                .then((isSuccessful) {
              if (isSuccessful = true) {
                mySuggestions.clear();
                mySuggestionListDisplay.clear();
                this.mySuggestions.addAll(makeSaleModel.mySuggestions);
                this
                    .mySuggestionsDescription
                    .addAll(makeSaleModel.mySuggestionsDescription);
                myMethod(
                    mySuggestions,
                    this.mySuggestions,
                    mySuggestionListDisplay,
                    mySuggestionsDescription,
                    this.mySuggestionsDescription);
                FocusScope.of(ctx).unfocus();
                print("my suggestions: " + mySuggestions.toString());
              } else {
                print("unsuccesful finding suggestions: ERROR ");
              }
            }).catchError((onError) {
              print("error on finding suggestions: " + onError.toString());
            });
          }).catchError((onError) {
            print("error on getting current database info: " +
                onError.toString());
          });
        }).catchError((onError) {
          print("error on getting user logged in: " + onError.toString());
        });
      });
    }
  }

  Future<void> anItemSelected(
      String mySelectedText,
      TextEditingController txtMySearchBar,
      Function myMethod,
      List<String> mySelectedItemValues,
      BuildContext ctx) async {
    txtMySearchBar.text = mySelectedText;
    FocusScope.of(ctx).unfocus();

    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(mySelectedText) ==
        true) {
      await sharedPrefUtil.getIsCurrentDatabaseId().then((currentDatabaseId) {
        mySuggestions.forEach((stockId, myStockName) async {
          if (myStockName.toLowerCase() == mySelectedText.toLowerCase()) {
            print("chosen value: " + stockId + " " + myStockName);
            await makeSaleModel
                .displayItemOnSelection(stockId, currentDatabaseId)
                .then((myList) {
              if (myList.length > 0) {
                mySelectedItemValues.clear();
                this.mySelectedItemValues.clear();
                this.mySelectedItemValues.addAll(myList);
                myMethod(mySelectedItemValues, this.mySelectedItemValues);
              }
            });
          }
        });
      }).catchError((onError) {
        print("error on finding current databse id: " + onError.toString());
      });
    }
  }

  Future<Widget> prepareToLoadImage(
      BuildContext context, String mySelectedItemValue) async {
    return await makeSaleModel.loadImage(context, mySelectedItemValue);
  }
}
