import 'dart:async';

import 'package:automanager/models/registerModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/errorTrapTool.dart';
import 'package:automanager/utilities/myNavigatorUtil.dart';
import 'package:automanager/view/homeView.dart';
import 'package:flutter/material.dart';

class RegisterViewModel {
  RegisterModel registerModel = new RegisterModel();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  final MyNavigatorUtil myNavigatorUtil = new MyNavigatorUtil();
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

  Future<void> prepareCreationWithEmailPassword(String completeName,
      String email,
      String password, String confirmPassword, BuildContext ctx) async {
    if (password == confirmPassword) {
      await registerModel
          .createWithEmailPassword(completeName, email, password)
          .then((value) async {
            errorTrapTool.dismissEasyLoading();
        if (value == true) {
          this.myUserId = registerModel.loginUid;
          this.isLoggedIn = true;
          this.myCurrentDatabase = registerModel.myCurrentDatabase;
          this.myDatabaseList = registerModel.myDatabaseList;
          this.myCurrentProfileId = registerModel.myCurrentProfileId;
          this.myCurrentDbName = registerModel.myCurrentDbName;
          await sharedPrefUtil.setCurrentUser(
              myUserId,
              isLoggedIn,
              myCurrentDatabase,
              myDatabaseList,
              myCurrentProfileId,
              myCurrentDbName);
          await myNavigatorUtil.navigateNewPage(ctx, HomeView());
        } else {
          errorTrapTool.displayErrorMessage(registerModel.firebaseAuthException);
          isLoggedIn = false;
        }
      });
    } else {}
  }
}
