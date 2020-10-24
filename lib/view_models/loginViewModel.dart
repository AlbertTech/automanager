import 'package:automanager/models/loginModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/myNavigatorUtil.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  LoginModel loginModel = new LoginModel();
  UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  MyNavigatorUtil myNavigatorUtil = new MyNavigatorUtil();
  String _myUserId = "empty";
  bool _isLoggedIn = false;
  String _myCurrentDatabase = "";
  List<String> _myDatabaseList = [];
  String _myCurrentProfileId = "";
  String _myCurrentDbName = "";
  String get myUserId => _myUserId;

  set myUserId(String value) {
    _myUserId = value;
  }

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
  }

  String get myCurrentDatabase => _myCurrentDatabase;

  set myCurrentDatabase(String value) {
    _myCurrentDatabase = value;
  }

  List<String> get myDatabaseList => _myDatabaseList;

  set myDatabaseList(List<String> value) {
    _myDatabaseList = value;
  }

  String get myCurrentProfileId => _myCurrentProfileId;

  set myCurrentProfileId(String value) {
    _myCurrentProfileId = value;
  }

  String get myCurrentDbName => _myCurrentDbName;

  set myCurrentDbName(String value) {
    _myCurrentDbName = value;
  }

  Future<void> loginWithEmailPassword(
      String email, password, BuildContext ctx) async {
    await loginModel
        .loginWithEmailPassword(email, password)
        .whenComplete(() async {
      if (loginModel.isLoginSuccessful == true) {
        myUserId = loginModel.loginUid;
        isLoggedIn = true;
        myCurrentDatabase = loginModel.myCurrentDatabase;
        myDatabaseList = loginModel.myDatabaseList;
        myCurrentProfileId = loginModel.myCurrentProfileId;
        myCurrentDbName = loginModel.myCurrentDbName;
        await sharedPrefUtil.setCurrentUser(myUserId, isLoggedIn,
            myCurrentDatabase, myDatabaseList, myCurrentProfileId,myCurrentDbName);
        await myNavigatorUtil.navigateNewPage(ctx);
      } else {
        isLoggedIn = false;
      }
    });
  }

  Future<void> loginWithFacebook(BuildContext ctx) async {
    await loginModel.loginWithFacebook().then((isSuccessful) async {
      if (isSuccessful == true) {
        myUserId = loginModel.loginUid;
        isLoggedIn = true;
        myCurrentDatabase = loginModel.myCurrentDatabase;
        myDatabaseList = loginModel.myDatabaseList;
        myCurrentProfileId = loginModel.myCurrentProfileId;
        myCurrentDbName = loginModel.myCurrentDbName;
        await sharedPrefUtil.setCurrentUser(myUserId, isLoggedIn,
            myCurrentDatabase, myDatabaseList, myCurrentProfileId,myCurrentDbName);
        myNavigatorUtil.navigateNewPage(ctx);
      } else {
        isLoggedIn = false;
        FocusScope.of(ctx).unfocus();
      }
    });
  }

  Future<void> loginWithGoogle(BuildContext ctx) async {
    await loginModel.loginWithGoogle().then((isSuccessful) async {
      if (isSuccessful == true) {
        myUserId = loginModel.loginUid;
        isLoggedIn = true;
        myCurrentDatabase = loginModel.myCurrentDatabase;
        myDatabaseList = loginModel.myDatabaseList;
        myCurrentProfileId = loginModel.myCurrentProfileId;
        myCurrentDbName = loginModel.myCurrentDbName;
        await sharedPrefUtil.setCurrentUser(myUserId, isLoggedIn,
            myCurrentDatabase, myDatabaseList, myCurrentProfileId,myCurrentDbName);
        myNavigatorUtil.navigateNewPage(ctx);
      } else {
        isLoggedIn = false;
        FocusScope.of(ctx).unfocus();
      }
    });
  }

  Future<void> fireAuthLogOut() {
    return loginModel.logOutEverything();
  }
}
