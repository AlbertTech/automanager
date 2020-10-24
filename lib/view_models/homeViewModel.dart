import 'package:automanager/models/homeModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel {
  final HomeModel homeModel = new HomeModel();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  List<dynamic> myPassingList = new List();

  Future<void> createMyOwnDatabase(String myDatabaseName,
      String myDatabasePassword, BuildContext context) async {
    await sharedPrefUtil
        .getCurrentUserId()
        .then((currentLoggedIn) async => await homeModel
                .addMyOwnDatabase(
                    myDatabaseName, myDatabasePassword, currentLoggedIn)
                .then((value) {
              if (value == true) {
                print("added database: " + value.toString());
                Navigator.of(context).pop();
              } else {}
            }))
        .catchError((onError) =>
            print("error on adding database: " + onError.toString()));
  }

  Stream<String> getMyStreamDataSharedPref() async* {
    String toYield = "";
    await sharedPrefUtil.getMyCurrentDbName().then((value) {
      print("\n\n\n\n\n\n\n success" + value.toLowerCase());
      toYield = value;
    }).catchError((onError) {
      print("nothing: " + onError.toString());
    });
    yield toYield;
  }
}
