import 'package:automanager/models/homeModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/textValidatorUtility.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeViewModel {
  final HomeModel homeModel = new HomeModel();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  final TextValidatorUtility textValidatorUtility = new TextValidatorUtility();
  bool isSuccessful = false;
  List<dynamic> myPassingList = new List();

  final String joinDb = "Join";
  final String createDb = "Create";

  Future<bool> createMyOwnDatabase(String myDatabaseName,
      String myDatabasePassword, BuildContext context) async {
    isSuccessful = false;
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(myDatabaseName)) {
      await sharedPrefUtil.getMyCurrentProfileId().then((currentProfId) async {
        await sharedPrefUtil
            .getCurrentUserId()
            .then((currentLoggedIn) async => await homeModel
                    .createDatabase(myDatabaseName, myDatabasePassword,
                        currentLoggedIn, currentProfId)
                    .then((value) async {
                  if (value == true) {
                    isSuccessful = true;
                    print("added database: " + homeModel.myDatabaseId);
                    await sharedPrefUtil
                        .setCurrentDatabaseId(homeModel.myDatabaseId);
                    await sharedPrefUtil
                        .setCurrentDatabaseName(homeModel.myDatabaseName);
                    await sharedPrefUtil.updateCurrentDatabaseList(
                        homeModel.myDatabaseName, homeModel.myDatabaseId);
                    Navigator.of(context).pop();
                  } else {
                    isSuccessful = false;
                  }
                }))
            .catchError((onError) {
          print("error on adding database: " + onError.toString());
          isSuccessful = false;
        });
      }).catchError((onError) {
        print("error on getting prof id: " + onError.toString());
        isSuccessful = false;
      });
      return isSuccessful;
    } else {
      isSuccessful = false;
      return isSuccessful;
    }
  }

  Stream<List> getMyStreamDataSharedPref() async* {
    List<dynamic> toYield = [];
    await sharedPrefUtil.getMyDatabaseList().then((value) {
      print("\n\n\n\n\n\n\n success: " + value.length.toString());
      if (value.length > 0) {
        toYield.add(value);
        toYield.add(value.keys.toList());
      } else {
        toYield.add({});
        toYield.add([]);
      }
    }).catchError((onError) {
      print("dlist nothing: " + onError.toString());
    });
    await sharedPrefUtil.getMyCurrentDbName().then((value) {
      print("\n\n\n\n\n\n\n success: " + value.isNotEmpty.toString());
      if (value.isNotEmpty) {
        toYield.add(value);
      } else {
        toYield.add("");
      }
    }).catchError((onError) {
      print("current db name nothing: " + onError.toString());
    });
    print("my to yield: " + toYield.toString());
    yield toYield;
  }

  Future<bool> joinAnotherDatabase(
      String databaseRef, BuildContext context) async {
    isSuccessful = false;
    if (textValidatorUtility.checkTextIfNotEmptyAndNotNull(databaseRef)) {
      await sharedPrefUtil
          .getMyCurrentProfileId()
          .then((currentProfileId) async => await homeModel
                  .joinAnotherDatabase(databaseRef, currentProfileId)
                  .then((value) async {
                if (value == true) {
                  print("added database: " + value.toString());
                  await sharedPrefUtil
                      .setCurrentDatabaseId(homeModel.myDatabaseId);
                  await sharedPrefUtil
                      .setCurrentDatabaseName(homeModel.myDatabaseName);
                  isSuccessful = true;
                  Navigator.of(context).pop();
                } else {
                  isSuccessful = false;
                }
              }))
          .catchError((onError) {
        print("error on adding database: " + onError.toString());
        isSuccessful = false;
      });
      return isSuccessful;
    } else {
      isSuccessful = false;
      return isSuccessful;
    }
  }
}
