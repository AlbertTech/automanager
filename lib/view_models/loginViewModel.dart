import 'package:automanager/models/loginModel.dart';
import 'package:automanager/models/sharedPrefUtil.dart';
import 'package:automanager/utilities/myNavigatorUtil.dart';
import 'package:flutter/material.dart';
class LoginViewModel {
  LoginModel loginModel = new LoginModel();
  SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();
  MyNavigatorUtil myNavigatorUtil = new MyNavigatorUtil();
  String _myUserId = "empty";
  String _myErrorCode = "empty";
  bool _isLoggedIn = false;

  String get myUserId => _myUserId;

  set myUserId(String value) {
    _myUserId = value;
  }

  String get myErrorCode => _myErrorCode;

  set myErrorCode(String value) {
    _myErrorCode = value;
  }

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
  }

  Future<void> loginWithEmailPassword(
      String email, password, BuildContext ctx) async {
    await loginModel
        .loginWithEmailPassword(email, password)
        .whenComplete(() async {
      if (loginModel.isLoginSuccessful == true) {
        myUserId = loginModel.loginReturnValue;
        isLoggedIn = true;
        await sharedPrefUtil.setCurrentUser(myUserId, isLoggedIn);
        await myNavigatorUtil.navigateNewPage(ctx);
      } else {
        myErrorCode = loginModel.loginReturnValue;
        isLoggedIn = false;
      }
    });
  }

  Future<void> loginWithFacebook(BuildContext ctx) async {
    await loginModel.loginWithFacebook().whenComplete(() async {
      if (loginModel.isLoginSuccessful == true) {
        myUserId = loginModel.loginReturnValue;
        isLoggedIn = true;
        await sharedPrefUtil.setCurrentUser(myUserId, isLoggedIn);
        await myNavigatorUtil.navigateNewPage(ctx);
      } else {
        myErrorCode = loginModel.loginReturnValue;
        isLoggedIn = false;
      }
    });
  }

  Future<void> loginWithGoogle(BuildContext ctx) async {
    await loginModel.loginWithGoogle().whenComplete(() async {
      if (loginModel.isLoginSuccessful == true) {
        myUserId = loginModel.loginReturnValue;
        isLoggedIn = true;
        await sharedPrefUtil.setCurrentUser(myUserId, isLoggedIn);
        await myNavigatorUtil.navigateNewPage(ctx);
      } else {
        myErrorCode = loginModel.loginReturnValue;
        isLoggedIn = false;
      }
    });
  }

  Future<void> fireAuthLogOut() {
    return loginModel.logOutEverything();
  }
}
