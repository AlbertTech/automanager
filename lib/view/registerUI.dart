import 'package:automanager/utilities/textFieldFocusUtilities.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUI {
  RegisterUI(
    this.context,
    this.myTextUtility,
    this.myColorDeepOrange,
    this.myColorLightOrange,
    this.myLightBlueColor,
    this.myClipper_1,
    this.myClipper_2,
    this.controllerCompleteName,
    this.controllerEmail,
    this.controllerPassword,
    this.controllerConfirmPassword,
    this.formKey,
  );

  final BuildContext context;
  final TextFieldFocusUtilities myTextUtility;
  final Color myColorDeepOrange;
  final Color myColorLightOrange;
  final Color myLightBlueColor;
  final CustomClipper myClipper_1;
  final CustomClipper myClipper_2;

  final TextEditingController controllerCompleteName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerConfirmPassword;

  final GlobalKey<FormState> formKey;

  void _registerEmailPassword(
      String completeName, email, password, confirmPassword) {
    if (password == confirmPassword) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirebaseFirestore.instance.collection("Users").add({
          "Complete name": completeName,
          "Email": email,
          "userId": value.user.uid.toString(),
        }).whenComplete(() => Navigator.pop(context));
      }).timeout(Duration(milliseconds: 5000), onTimeout: () {
        print("Timeout");
      }).catchError((onError) {
        print("erorr acc auth: " + onError.toString());
      });
    } else {}
  }

  Widget getRegisterUI() {
    print("MytextFocus: " + myTextUtility.textFocus.toString());
    final mediaSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          myTextUtility.textFocus = false;
        },
        child: Form(
          key: formKey,
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
                      mediaSize, "RegisterView"),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Center(
                        child: Container(
                            height: mediaSize.height * .25,
                            width: mediaSize.width * .55,
                            child: Image.asset(
                              'assets/images/image_investment_register.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      //Formal name
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
                            controller: controllerCompleteName,
                            onFieldSubmitted: (String value) {
                              myTextUtility.textFocus = false;
                            },
                            onTap: () {
                              myTextUtility.textFocus = true;
                            },
                            decoration: InputDecoration(
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
                                  Icons.person,
                                  color: Colors.black54,
                                ),
                                labelText: "Complete name",
                                filled: true,
                                fillColor: myColorLightOrange),
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                      Spacer(),
                      //Email
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
                            controller: controllerEmail,
                            onFieldSubmitted: (String value) {
                              myTextUtility.textFocus = false;
                            },
                            onTap: () {
                              myTextUtility.textFocus = true;
                            },
                            decoration: InputDecoration(
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
                      Spacer(),
                      //Password
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
                              controller: controllerPassword,
                              onFieldSubmitted: (String value) {
                                myTextUtility.textFocus = false;
                              },
                              onTap: () {
                                myTextUtility.textFocus = true;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13))),
                                  prefixIcon: Icon(
                                    Icons.enhanced_encryption,
                                    color: Colors.black54,
                                  ),
                                  labelText: "password",
                                  filled: true,
                                  fillColor: myColorLightOrange),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )),
                      ),
                      Spacer(),
                      //Confirm Password
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
                              controller: controllerConfirmPassword,
                              onFieldSubmitted: (String value) {
                                myTextUtility.textFocus = false;
                              },
                              onTap: () {
                                myTextUtility.textFocus = true;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13))),
                                  prefixIcon: Icon(
                                    Icons.enhanced_encryption,
                                    color: Colors.black54,
                                  ),
                                  labelText: "Confirm password",
                                  filled: true,
                                  fillColor: myColorLightOrange),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                _registerEmailPassword(
                                    controllerCompleteName.text,
                                    controllerEmail.text,
                                    controllerPassword.text,
                                    controllerConfirmPassword.text);
                              },
                              child: new Container(
                                  constraints: BoxConstraints(
                                      maxWidth: mediaSize.width * .5,
                                      maxHeight: mediaSize.height * .06),
                                  decoration: BoxDecoration(
                                      color: myColorDeepOrange,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
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
                                    child: AutoSizeText(
                                      'Sign up',
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
                                Navigator.pop(context);
                              },
                              child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: mediaSize.width * .25,
                                      maxHeight: mediaSize.height * .06),
                                  decoration: BoxDecoration(
                                      color: myColorDeepOrange,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
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
                                    child: AutoSizeText(
                                      'Cancel',
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
                    ],
                  ),
                ),
                ClipPath(
                  child: Container(
                    color: myLightBlueColor,
                  ),
                  clipper: myClipper_1,
                ),
                Text("\n  Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold)),
                ClipPath(
                  child: Container(
                    color: myLightBlueColor,
                  ),
                  clipper: myClipper_2,
                ),
              ],
            ),
          ),
        ));
  }
}
