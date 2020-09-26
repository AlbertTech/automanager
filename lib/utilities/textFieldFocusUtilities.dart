import 'package:flutter/material.dart';

class TextFieldFocusUtilities {
  bool _textFocus = false;

  bool get textFocus => _textFocus;

  void set textFocus(bool value) {
    _textFocus = value;
  }
  EdgeInsets getMarginEdgeInsetRegardTextFocus(Size mediaSize, String viewState) {
    switch (viewState) {
      case "LoginView":
        if (_textFocus == false) {
          return EdgeInsets.fromLTRB(
              mediaSize.width * .1,
              mediaSize.height * .23,
              mediaSize.width * .1,
              mediaSize.height * .1);
        }
        else {
          return EdgeInsets.fromLTRB(
              mediaSize.width * .1,
              mediaSize.height * .1,
              mediaSize.width * .1,
              mediaSize.height * .23);
        }
        break;
      case "RegisterView":
        if (_textFocus == false) {
          return EdgeInsets.fromLTRB(
              mediaSize.width * .1,
              mediaSize.height * .15,
              mediaSize.width * .1,
              mediaSize.height * .2);
        } else {
          return EdgeInsets.fromLTRB(
              mediaSize.width * .1,
              mediaSize.height * .0,
              mediaSize.width * .1,
              mediaSize.height * .35);
        }
        break;
      case "AddStockView":
        if (_textFocus == false) {
          return EdgeInsets.only(
              left: mediaSize.width * .1,
              right: mediaSize.width * .1,
              top: mediaSize.height * .423,
              bottom: mediaSize.height * .075);
        } else {
          return EdgeInsets.only(
              left: mediaSize.width * .1,
              right: mediaSize.width * .1,
              top: mediaSize.height * .325,
              bottom: mediaSize.height * .075);
        }
        break;
      default:
        break;
    }
  }

  void checkIfKeyboardVisible(bool boolValue) {
    _textFocus = boolValue;
  }
}
