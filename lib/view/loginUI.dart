import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/errorTrapTool.dart';
import 'package:automanager/utilities/myNavigatorUtil.dart';
import 'package:automanager/utilities/textFieldFocusUtilities.dart';
import 'package:automanager/view/registerView.dart';
import 'package:automanager/view_models/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class LoginUI {
  LoginUI(
      this.sharedPrefUtil,
      this.loginViewModel,
      this.myTextUtility,
      this.myNavigatorUtil,
      this.myClipper,
      this.myBGClipperColor,
      this.myColorLightOrange,
      this.myColorDeepOrange,
      this.txtEmail,
      this.txtPass,
      this.errorTrapTool);

  final UserInfoSharedPref sharedPrefUtil;
  final LoginViewModel loginViewModel;
  final TextFieldFocusUtilities myTextUtility;
  final MyNavigatorUtil myNavigatorUtil;
  final CustomClipper myClipper;
  final Color myBGClipperColor;
  final Color myColorLightOrange;
  final Color myColorDeepOrange;
  final TextEditingController txtEmail;
  final TextEditingController txtPass;
  final ErrorTrapTool errorTrapTool;

  Widget getLoginUIWidget() {
    errorTrapTool.myEasyLoadingInit();
    return Builder(builder: (BuildContext context) {
      final mediaSize = MediaQuery.of(context).size;
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          myTextUtility.textFocus = false;
        },
        child: Container(
          width: mediaSize.width,
          height: mediaSize.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                width: mediaSize.width * .8,
                height: mediaSize.height * .8,
                margin: myTextUtility.getMarginEdgeInsetRegardTextFocus(
                    mediaSize, "LoginView"),
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    //header
                    Container(
                        height: mediaSize.height * .3,
                        width: mediaSize.width * .8,
                        child: Image.asset(
                          'assets/images/image_pushing_cart.png',
                          fit: BoxFit.fill,
                        )),
                    GestureDetector(
                      onDoubleTap: () {
                        FocusScope.of(context).unfocus();
                        myTextUtility.textFocus = false;
                      },
                      child: Container(
                        height: mediaSize.height * .06,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54.withOpacity(0.45),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(3.5, 4))
                            ]),
                        child: TextFormField(
                          controller: txtEmail,
                          onFieldSubmitted: (String value) {
                            myTextUtility.textFocus = false;
                          },
                          onTap: () {
                            myTextUtility.textFocus = true;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              hintStyle: TextStyle(color: Colors.black87),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black54,
                              ),
                              labelText: "Email",
                              filled: true,
                              fillColor: myColorLightOrange),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      onDoubleTap: () {
                        FocusScope.of(context).unfocus();
                        myTextUtility.textFocus = false;
                      },
                      child: Container(
                          height: mediaSize.height * .06,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54.withOpacity(0.45),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(3.5, 4))
                              ]),
                          child: TextFormField(
                            controller: txtPass,
                            onFieldSubmitted: (String value) {
                              myTextUtility.textFocus = false;
                            },
                            onTap: () {
                              myTextUtility.textFocus = true;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                                prefixIcon: Icon(
                                  Icons.enhanced_encryption,
                                  color: Colors.black54,
                                ),
                                labelText: "password",
                                filled: true,
                                fillColor: myColorLightOrange),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                    Spacer(flex: 2),
                    //login Sign-up
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () async {
                              errorTrapTool.showEasyLoading();
                              await loginViewModel.loginWithEmailPassword(
                                  txtEmail.text, txtPass.text, context);
                            },
                            child: new Container(
                                constraints: BoxConstraints(
                                    maxWidth: mediaSize.width * .45,
                                    maxHeight: mediaSize.height * .06),
                                decoration: BoxDecoration(
                                    color: myColorDeepOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              Colors.black54.withOpacity(0.45),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3.5, 4))
                                    ]),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    maxFontSize: 25,
                                    minFontSize: 18,
                                    maxLines: 1,
                                  ),
                                ))),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          RegisterView()));
                            },
                            child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: mediaSize.width * .30,
                                    maxHeight: mediaSize.height * .06),
                                decoration: BoxDecoration(
                                    color: myColorDeepOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              Colors.black54.withOpacity(0.45),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3.5, 4))
                                    ]),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    'Sign up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    maxFontSize: 23,
                                    minFontSize: 18,
                                    maxLines: 1,
                                  ),
                                )))
                      ],
                    ),
                    Spacer(),
                    //forgot password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          print("forgot password clicked");
                        },
                        child: Text(
                          "  Forgot Password?",
                          style: (TextStyle(
                              color: Colors.lightBlue, fontSize: 18)),
                        ),
                      ),
                    ),
                    Spacer(),
                    //fb and google+
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () async {
                                print("Container clicked - facebook");
                                errorTrapTool.showEasyLoading();
                                await loginViewModel.loginWithFacebook(context);
                              },
                              child: new Container(
                                  constraints: BoxConstraints(
                                      maxWidth: mediaSize.width * .1,
                                      maxHeight: mediaSize.height * .05),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.black54
                                                .withOpacity(0.45),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: Offset(3.5, 4))
                                      ]),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "f",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                          Text("\t\t\t"),
                          GestureDetector(
                              onTap: () async {
                                print("google login");
                                errorTrapTool.showEasyLoading();
                                await loginViewModel.loginWithGoogle(context);
                              },
                              child: new Container(
                                  constraints: BoxConstraints(
                                      maxWidth: mediaSize.width * .1,
                                      maxHeight: mediaSize.height * .05),
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.black54
                                                .withOpacity(0.45),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: Offset(3.5, 4))
                                      ]),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "G",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                child: Container(
                  color: myBGClipperColor,
                ),
                clipper: myClipper,
              ),
              Text("\n   Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    });
  }

}
