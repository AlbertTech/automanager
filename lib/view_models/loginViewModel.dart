import 'package:automanager/models/loginModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/errorTrapTool.dart';
import 'package:automanager/utilities/myNavigatorUtil.dart';
import 'package:automanager/view/homeView.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  LoginModel loginModel = new LoginModel();
  UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  MyNavigatorUtil myNavigatorUtil = new MyNavigatorUtil();
  final ErrorTrapTool errorTrapTool = new ErrorTrapTool();
  String _myUserId = "empty";
  bool _isLoggedIn = false;
  String _myCurrentDatabase = "";
  Map<String, dynamic> _myDatabaseList = new Map();
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

  Map<String, dynamic> get myDatabaseList => _myDatabaseList;

  set myDatabaseList(Map<String, dynamic> value) {
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
      errorTrapTool.dismissEasyLoading();
      if (loginModel.isLoginSuccessful == true) {
        myUserId = loginModel.loginUid;
        isLoggedIn = true;
        myCurrentDatabase = loginModel.myCurrentDatabase;
        myDatabaseList = loginModel.myDatabaseList;
        myCurrentProfileId = loginModel.myCurrentProfileId;
        myCurrentDbName = loginModel.myCurrentDbName;
        await sharedPrefUtil.setCurrentUser(
            myUserId,
            isLoggedIn,
            myCurrentDatabase,
            myDatabaseList,
            myCurrentProfileId,
            myCurrentDbName);
        myNavigatorUtil.navigateNewPage(ctx, HomeView());
      } else {
        errorTrapTool.displayErrorMessage(loginModel.errorStatus);
        isLoggedIn = false;
      }
    });
  }

  Future<void> loginWithFacebook(BuildContext ctx) async {
    await loginModel.loginWithFacebook().then((isSuccessful) async {
      errorTrapTool.dismissEasyLoading();
      if (isSuccessful == true) {
        myUserId = loginModel.loginUid;
        isLoggedIn = true;
        myCurrentDatabase = loginModel.myCurrentDatabase;
        myDatabaseList = loginModel.myDatabaseList;
        myCurrentProfileId = loginModel.myCurrentProfileId;
        myCurrentDbName = loginModel.myCurrentDbName;
        await sharedPrefUtil.setCurrentUser(
            myUserId,
            isLoggedIn,
            myCurrentDatabase,
            myDatabaseList,
            myCurrentProfileId,
            myCurrentDbName);
        myNavigatorUtil.navigateNewPage(ctx, HomeView());
      } else {
        errorTrapTool.displayErrorMessage(loginModel.errorStatus);
        isLoggedIn = false;
        FocusScope.of(ctx).unfocus();
      }
    });
  }

  Future<void> loginWithGoogle(BuildContext ctx) async {
    await loginModel.loginWithGoogle().then((isSuccessful) async {
      errorTrapTool.dismissEasyLoading();
      if (isSuccessful == true) {
        myUserId = loginModel.loginUid;
        isLoggedIn = true;
        myCurrentDatabase = loginModel.myCurrentDatabase;
        myDatabaseList = loginModel.myDatabaseList;
        myCurrentProfileId = loginModel.myCurrentProfileId;
        myCurrentDbName = loginModel.myCurrentDbName;
        await sharedPrefUtil.setCurrentUser(
            myUserId,
            isLoggedIn,
            myCurrentDatabase,
            myDatabaseList,
            myCurrentProfileId,
            myCurrentDbName);
        myNavigatorUtil.navigateNewPage(ctx, HomeView());
      } else {
        errorTrapTool.displayErrorMessage(loginModel.errorStatus);
        isLoggedIn = false;
        FocusScope.of(ctx).unfocus();
      }
    });
  }

  Future<void> fireAuthLogOut() {
    return loginModel.logOutEverything();
  }

}
