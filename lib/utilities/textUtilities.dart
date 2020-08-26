import 'package:flutter/material.dart';

class TextUtilities {
  bool _textFocus = false;

  bool get textFocus => _textFocus;

  void set textFocus(bool value) {
    _textFocus = value;
  }

  bool _keyboardOpen = false;
  void disposeAllValues(){
    _textFocus = false;
    _keyboardOpen = false;
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
      default:
        break;
    }
  }

  void checkIfKeyboardVisible(bool boolValue) {
    _textFocus = boolValue;
  }
}
