import 'package:automanager/models/addStockModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/textValidatorUtility.dart';
import 'dart:io';
import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddStockViewModel {
  AddStockModel addStockModel = new AddStockModel();
  UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  TextValidatorUtility textValidatorUtility = new TextValidatorUtility();
  List<String> mySuggestionCategory = new List();
  bool isUpdated = false;

  Future<void> addStock(
      String stockName,
      String stockCategory,
      String stockQuantity,
      String stockPriceEach,
      String stockDateOrder,
      String stockDateArrival,
      String stockDistributor,
      Map myMapDesc,
      File myImageFile) async {
    await textValidatorUtility.checkIfAllTextNotEmptyAndNotNull([
      stockName,
      stockCategory,
      stockQuantity,
      stockPriceEach,
      myImageFile.path
    ]).then((value) async {
      if (value == true) {
        print("====checked all text is not empty=======");
        await textValidatorUtility.checkAllNumberNotEmpty([
          int.parse(stockQuantity),
          int.parse(stockPriceEach),
        ]).then((value) async {
          print("====checked all numbers is > 0=======");
          await sharedPrefUtil
              .getIsCurrentUserLoggedIn()
              .then((currentUserLoggedIn) async {
            print("====checked sharedpref isUserLoggedIn=======");
            if (currentUserLoggedIn == true) {
              print("====checked current user is logged in=======");
              await sharedPrefUtil
                  .getCurrentUserId()
                  .then((sharedPrefUtilUid) async {
                print("====checked sharedPref getUserId=======");
                await sharedPrefUtil
                    .getIsCurrentDatabaseId()
                    .then((currentDatabaseUid) async {
                  await addStockModel
                      .addStock(
                          sharedPrefUtilUid,
                          currentDatabaseUid,
                          stockName,
                          stockCategory,
                          int.parse(stockQuantity),
                          int.parse(stockPriceEach),
                          stockDateOrder,
                          stockDateArrival,
                          stockDistributor,
                          myMapDesc,
                          myImageFile)
                      .then((value) {
                    return EasyLoading.showInfo("Success");
                  }).catchError((onError) {
                    print("error adding data: " +
                        onError.toString());
                    return EasyLoading.showError("Error, please retry");
                  });
                }).catchError((onError) {
                  print(
                      "error getting current database: " + onError.toString());
                  return EasyLoading.showError("Error, please retry");
                });
              }).catchError((onError) {
                print("error on getting userId shared pref: " +
                    onError.toString());
                return EasyLoading.showError("Error, please retry");
              });
            } else {
              print("====> no userLoggedIn");
              return EasyLoading.showError("Error, please retry");
            }
          }).catchError((onError) {
            print("error on getting isCurrentUserLoggedIn: " +
                onError.toString());
          });
        }).catchError((onError) {
          print("error on checking my numbers: " + onError.toString());
        });
      } else {
        return EasyLoading.showInfo(
            "Please fill\n\n"
            "*stock name\n"
            "*category\n"
            "*quantity\n"
            "*price each\n"
            "*image",
            duration: Duration(seconds: 3));
      }
    });
  }
}
