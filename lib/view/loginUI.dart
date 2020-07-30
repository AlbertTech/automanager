import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginUI {
  LoginUI(this.myTextFocus, this.textOnFocus, this.myClipper, this.myBGClipperColor,
      this.myColorLightOrange, this.myColorDeepOrange);

  final FocusNode myTextFocus;
        bool textOnFocus;
  final Color myBGClipperColor;
  final Color myColorLightOrange;
  final Color myColorDeepOrange;
  final CustomClipper myClipper;

  String emailText;
  String passwordText;

  Widget getLoginUIWidget() {
    return Builder(builder: (BuildContext context) {
      final mediaSize = MediaQuery.of(context).size;

        return Container(
          width: mediaSize.width,
          height: mediaSize.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                width: mediaSize.width * .8,
                height: mediaSize.height * .8,
                margin: EdgeInsets.fromLTRB(
                    mediaSize.width * .1,
                    mediaSize.height * .23,
                    mediaSize.width * .1,
                    mediaSize.height * .1),
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
                    Container(
                      height: mediaSize.height * .06,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12.5)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54.withOpacity(0.45),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(3.5, 4))
                          ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5))),
                            hintStyle: TextStyle(color: Colors.black87),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black54,
                            ),
                            labelText: "Email",
                            filled: true,
                            fillColor: myColorLightOrange),
                        keyboardType: TextInputType.emailAddress,
                        focusNode: myTextFocus,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Spacer(flex: 2),
                    Container(
                        height: mediaSize.height * .06,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(12.5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54.withOpacity(0.45),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(3.5, 4))
                            ]),
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.5))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.5))),
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
                    Spacer(flex: 2),
                    //login Sign-up
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {},
                            child: new Container(
                                constraints: BoxConstraints(
                                    maxWidth: mediaSize.width * .45,
                                    maxHeight: mediaSize.height * .06),
                                decoration: BoxDecoration(
                                    color: myColorDeepOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.5)),
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
                              print("Container clicked");
                            },
                            child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: mediaSize.width * .30,
                                    maxHeight: mediaSize.height * .06),
                                decoration: BoxDecoration(
                                    color: myColorDeepOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.5)),
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
                                        fontSize: 20,
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
                              onTap: () {
                                print("Container clicked - fb");
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
                          Text("   "),
                          GestureDetector(
                              onTap: () {
                                print("Container clicked");
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
        );


    });
  }
}
