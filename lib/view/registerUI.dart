import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RegisterUI {
  RegisterUI(this.myColorDeepOrange, this.myColorLightOrange,
      this.myLightBlueColor, this.myClipper_1, this.myClipper_2);

  final Color myColorDeepOrange;
  final Color myColorLightOrange;
  final Color myLightBlueColor;
  final CustomClipper myClipper_1;
  final CustomClipper myClipper_2;

  Widget getRegisterUI() {
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
                  mediaSize.height * .1,
                  mediaSize.width * .1,
                  mediaSize.height * .18),
              color: Colors.transparent,
              child: (Column(
                children: <Widget>[
                  Container(
                      height: mediaSize.height * .25,
                      width: mediaSize.width * .55,
                      child: Image.asset(
                        'assets/images/image_investment_register.png',
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
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          hintStyle: TextStyle(color: Colors.black87),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          labelText: "Formal name",
                          filled: true,
                          fillColor: myColorLightOrange),
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Spacer(),
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
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
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
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Spacer(),
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
                  Spacer(),
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
                            labelText: "Confirm password",
                            filled: true,
                            fillColor: myColorLightOrange),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {},
                          child: new Container(
                              constraints: BoxConstraints(
                                  maxWidth: mediaSize.width * .5,
                                  maxHeight: mediaSize.height * .06),
                              decoration: BoxDecoration(
                                  color: myColorDeepOrange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.5)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black54.withOpacity(0.45),
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
                            print("Container clicked");
                          },
                          child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: mediaSize.width * .25,
                                  maxHeight: mediaSize.height * .06),
                              decoration: BoxDecoration(
                                  color: myColorDeepOrange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.5)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black54.withOpacity(0.45),
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
              )),
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
      );
    });
  }
}
