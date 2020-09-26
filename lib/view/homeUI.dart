import 'package:automanager/view/InventoryView.dart';
import 'package:automanager/view/addStockView.dart';
import 'package:automanager/view/itemDisplayView.dart';
import 'package:automanager/view/makeSaleView.dart';
import 'package:automanager/view/rolesView.dart';
import 'package:automanager/view/salesReportView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeUI {
  HomeUI(this.context, this._listItem, this.myLightBlueColor, this.myColorLightOrange,
      this.myClipper_1, this.myClipper_2);

  final BuildContext context;
  final Color myLightBlueColor;
  final Color myColorLightOrange;
  final CustomClipper myClipper_1;
  final CustomClipper myClipper_2;
  final List<String> _listItem;
  FirebaseAuth firebaseAuth;
  Widget getHomeUI() {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
      width: mediaSize.width,
      height: mediaSize.height,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          //Clippers
          ClipPath(
            child: Container(
              color: myLightBlueColor.withOpacity(.8),
            ),
            clipper: myClipper_1,
          ),
          ClipPath(
            child: Container(
              color: myLightBlueColor.withOpacity(.8),
            ),
            clipper: myClipper_2,
          ),
          Center(
            child: Container(
              width: mediaSize.width * .8,
              height: mediaSize.height * .9,
              margin: EdgeInsets.symmetric(
                  vertical: mediaSize.height * .05,
                  horizontal: mediaSize.width * .1),
              child: Column(
                children: <Widget>[
                  Container(
                      height: mediaSize.height * .1,
                      child: Image.asset(
                        'assets/images/image_investing_stocks.png',
                        fit: BoxFit.fill,
                      )),
                  Container(
                    width: mediaSize.width * .9,
                    height: mediaSize.height * .04,
                    child: Text(
                      "National Bookstore",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Spacer(),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: mediaSize.height * .74,
                      maxWidth: mediaSize.width * .8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Spacer(),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AddStockView()));
                              },
                              child: Container(
                                width: mediaSize.width * .35,
                                height: mediaSize.height * .2,
                                decoration: BoxDecoration(
                                    color: myColorLightOrange,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Image.asset(
                                      _listItem[0],
                                      width: mediaSize.width * .25,
                                      height: mediaSize.height * .125,
                                      fit: BoxFit.fill,
                                    ),
                                    Spacer(),
                                    Text(
                                      "placeholder",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MakeSaleView()));
                              },
                              child: Container(
                                width: mediaSize.width * .35,
                                height: mediaSize.height * .2,
                                decoration: BoxDecoration(
                                    color: myColorLightOrange,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Image.asset(
                                      _listItem[1],
                                      width: mediaSize.width * .275,
                                      height: mediaSize.height * .125,
                                      fit: BoxFit.fill,
                                    ),
                                    Spacer(),
                                    Text(
                                      "placeholder",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(flex: 4),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ItemDisplayView()));
                              },
                              child: Container(
                                width: mediaSize.width * .35,
                                height: mediaSize.height * .2,
                                decoration: BoxDecoration(
                                    color: myColorLightOrange,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Image.asset(
                                      _listItem[2],
                                      width: mediaSize.width * .25,
                                      height: mediaSize.height * .125,
                                      fit: BoxFit.fill,
                                    ),
                                    Spacer(),
                                    Text(
                                      "placeholder",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                print("salesreportview");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SalesReportView()));
                              },
                              child: Container(
                                width: mediaSize.width * .35,
                                height: mediaSize.height * .2,
                                decoration: BoxDecoration(
                                    color: myColorLightOrange,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Image.asset(
                                      _listItem[3],
                                      width: mediaSize.width * .275,
                                      height: mediaSize.height * .125,
                                      fit: BoxFit.fill,
                                    ),
                                    Spacer(),
                                    Text(
                                      "placeholder",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(flex: 4),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            InventoryView()));
                              },
                              child: Container(
                                width: mediaSize.width * .35,
                                height: mediaSize.height * .2,
                                decoration: BoxDecoration(
                                    color: myColorLightOrange,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Image.asset(
                                      _listItem[4],
                                      width: mediaSize.width * .25,
                                      height: mediaSize.height * .125,
                                      fit: BoxFit.fill,
                                    ),
                                    Spacer(),
                                    Text(
                                      "placeholder",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            RolesView()));
                              },
                              child: Container(
                                width: mediaSize.width * .35,
                                height: mediaSize.height * .2,
                                decoration: BoxDecoration(
                                    color: myColorLightOrange,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Image.asset(
                                      _listItem[5],
                                      width: mediaSize.width * .275,
                                      height: mediaSize.height * .125,
                                      fit: BoxFit.fill,
                                    ),
                                    Spacer(),
                                    Text(
                                      "placeholder",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
