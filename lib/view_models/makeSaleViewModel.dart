import 'dart:async';
import 'package:automanager/models/makeSaleModel.dart';
import 'package:automanager/utilities/textValidatorUtility.dart';
import 'package:flutter/material.dart';

class MakeSaleViewModel {
  final MakeSaleModel makeSaleModel = new MakeSaleModel();
  final TextValidatorUtility textValidatorUtility = new TextValidatorUtility();
  Map<String, String> mySuggestions = new Map();
  Map<String, String> myCategoriesOfSuggestions = new Map();

  Future<void> searchMyItems(
      String txtSearchBar,
      BuildContext ctx,
      Function myMethod,
      Map<String, String> mySuggestions,
      List<String> myNewSuggestion) async {
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(txtSearchBar) ==
        true) {
      await Future.delayed(Duration(seconds: 1)).then((value) async {
        print("now finding suggestions");
        await makeSaleModel.findMySuggestions(txtSearchBar).then((value) {
          mySuggestions.clear();
          myNewSuggestion.clear();
          this.mySuggestions.addAll(makeSaleModel.mySuggestions);
          this
              .myCategoriesOfSuggestions
              .addAll(makeSaleModel.myCategoriesOfSuggestions);
          myMethod(mySuggestions, this.mySuggestions, myNewSuggestion);
          FocusScope.of(ctx).unfocus();
        });
      });
    }
  }

  Future<void> anItemSelected(String mySelectedText,
      TextEditingController txtMySearchBar, BuildContext ctx) async {
    txtMySearchBar.text = mySelectedText;
    FocusScope.of(ctx).unfocus();

    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(mySelectedText) ==
        true) {
      mySuggestions.forEach((stockId_1, myStockName) {
        if (mySelectedText.toLowerCase() == myStockName.toLowerCase()) {
          myCategoriesOfSuggestions.forEach((stockId_2, categoryId) async {
            if (stockId_1 == stockId_2) {
              print("my key category and suggestion: "+categoryId + " "+ stockId_2);
              await makeSaleModel.displayItemOnSelection(
                  categoryId, stockId_2);
            }
          });
        }
      });
    }
  }
}
