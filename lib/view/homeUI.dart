import 'package:auto_size_text/auto_size_text.dart';
import 'package:automanager/view/InventoryView.dart';
import 'package:automanager/view/addStockView.dart';
import 'package:automanager/view/itemDisplayView.dart';
import 'package:automanager/view/makeSaleView.dart';
import 'package:automanager/view/rolesView.dart';
import 'package:automanager/view/salesReportView.dart';
import 'package:automanager/view_models/homeViewModel.dart';
import 'package:flutter/material.dart';

class HomeUI {
  HomeUI(
    this.context,
    this._listItem,
    this.myLightBlueColor,
    this.myColorLightOrange,
    this.myColorDeepOrange,
    this.myClipper_1,
    this.myClipper_2,
    this.homeViewModel,
    this.txtControllerCreateDatabaseName,
    this.txtControllerJoinDatabaseName,
    this.myCurrentDatabase,
  );

  final BuildContext context;
  final Color myLightBlueColor;
  final Color myColorLightOrange;
  final Color myColorDeepOrange;
  final CustomClipper myClipper_1;
  final CustomClipper myClipper_2;
  final String myCurrentDatabase;
  final List<String> _listItem;
  final TextEditingController txtControllerCreateDatabaseName;
  final TextEditingController txtControllerJoinDatabaseName;
  final HomeViewModel homeViewModel;

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
                    child: GestureDetector(
                      onTap: () async {
                        await joinCreateDatabase(mediaSize);
                      },
                      child: Text(myCurrentDatabase,textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
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
                                          color:
                                              Colors.black54.withOpacity(0.45),
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
                                          color:
                                              Colors.black54.withOpacity(0.45),
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
                                          color:
                                              Colors.black54.withOpacity(0.45),
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
                                          color:
                                              Colors.black54.withOpacity(0.45),
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
                                          color:
                                              Colors.black54.withOpacity(0.45),
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
                                          color:
                                              Colors.black54.withOpacity(0.45),
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

  joinCreateDatabase(Size mediaSize) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: myColorLightOrange,
          actions: [
            Container(
              width: mediaSize.width * .8,
              height: mediaSize.height * .3,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: mediaSize.width * .35,
                    height: mediaSize.height * .25,
                    child: Column(
                      children: [
                        Container(
                          height: mediaSize.height * .045,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            controller: txtControllerCreateDatabaseName,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              await homeViewModel.createMyOwnDatabase(
                                  txtControllerCreateDatabaseName.text, null, context);
                            },
                            child: new Container(
                                constraints: BoxConstraints(
                                    maxWidth: mediaSize.width * .375,
                                    maxHeight: mediaSize.height * .05),
                                decoration: BoxDecoration(
                                    color: myColorDeepOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    'Create',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    maxFontSize: 25,
                                    minFontSize: 18,
                                    maxLines: 1,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Container(
                    width: mediaSize.width * .35,
                    height: mediaSize.height * .25,
                    child: Column(
                      children: [
                        Container(
                          height: mediaSize.height * .045,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            controller: txtControllerCreateDatabaseName,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {

                            },
                            child: new Container(
                                constraints: BoxConstraints(
                                    maxWidth: mediaSize.width * .375,
                                    maxHeight: mediaSize.height * .05),
                                decoration: BoxDecoration(
                                    color: myColorDeepOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    'Join',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    maxFontSize: 25,
                                    minFontSize: 18,
                                    maxLines: 1,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
