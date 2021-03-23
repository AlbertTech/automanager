import 'package:automanager/resources/myColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ErrorTrapTool {
  final MyColors myColors = new MyColors();
  void showEasyLoading() {
    EasyLoading.show(status: "loading");
  }

  void myEasyLoadingInit() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..textStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..maskType = EasyLoadingMaskType.clear
      ..indicatorSize = 50
      ..radius = 10.0
      ..backgroundColor = myColors.colorLightBlue
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..progressColor = Colors.white
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  void dismissEasyLoading() {
    EasyLoading.dismiss();
  }

  void displayErrorMessage(FirebaseAuthException theCode) {
    switch (theCode.code) {
      case "email-already-in-use":
        print("error status: " + theCode.code);
        EasyLoading.showInfo('Email is already registered');
        break;
      case "unknown":
        print("error status: " + theCode.code);
        EasyLoading.showInfo('No Input');
        break;
      case "invalid-email":
        print("error status: " + theCode.code);
        EasyLoading.showInfo('Invalid user/password');
        break;

      case "Timed_out":
        print("error status: " + theCode.code);
        EasyLoading.showInfo('Please check internet connection');
        break;

      default:
        print("error status: " + theCode.code);
        EasyLoading.showError('Failed attempt');
        break;
    }
  }
}
