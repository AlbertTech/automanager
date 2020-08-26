import 'package:auto_size_text/auto_size_text.dart';
import 'package:automanager/utilities/shadowClipper.dart';
import 'package:flutter/material.dart';

class AddStockUI {
  AddStockUI(this.context, this.myClipPathShadowed, this.myDeepOrangeColor,
      this.myLightDarkColor);

  final BuildContext context;
  final Widget myClipPathShadowed;
  final Color myDeepOrangeColor;
  final Color myLightDarkColor;

  Widget getAddStockUI() {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
      width: mediaSize.width,
      height: mediaSize.height,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          myClipPathShadowed,
          Container(
            width: mediaSize.width * .8,
            height: mediaSize.height * .2,
            margin: EdgeInsets.only(
              left: mediaSize.width * .1,
              right: mediaSize.width * .1,
              top: mediaSize.height * .05,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: mediaSize.width * .37,
                  height: mediaSize.height * .2,
                  child: Image.asset(
                    'assets/images/image_add_image.png',
                    width: mediaSize.width * .37,
                    height: mediaSize.height * .2,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                ),
                Spacer(),
                Container(
                  width: mediaSize.width * .37,
                  height: mediaSize.height * .2,
                  child: ListView.builder(
                      itemCount: 2 + 1,
                      itemBuilder: (BuildContext ctx, int index) {
                        if (index == 0) {
                          return Container(
                            width: mediaSize.width * .35,
                            height: mediaSize.height * .03,
                            child: Row(
                              children: <Widget>[
                                Center(
                                    child: Container(
                                  width: mediaSize.width * .14,
                                  child: AutoSizeText(
                                    "variation",
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 14,
                                    minFontSize: 12,
                                    maxLines: 1,
                                  ),
                                )),
                                Spacer(),
                                Center(
                                    child: Container(
                                  width: mediaSize.width * .1,
                                  child: AutoSizeText(
                                    "value",
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 14,
                                    minFontSize: 12,
                                    maxLines: 1,
                                  ),
                                )),
                                Spacer(),
                                Container(
                                  width: mediaSize.width * .11
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            margin:
                                EdgeInsets.only(top: mediaSize.height * .025),
                            width: mediaSize.width * .35,
                            height: mediaSize.height * .03,
                            child: Row(
                              children: <Widget>[
                                Center(
                                    child: Container(
                                  width: mediaSize.width * .1,
                                  child: AutoSizeText(
                                    "Variation",
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 14,
                                    minFontSize: 12,
                                    maxLines: 1,
                                  ),
                                )),
                                Spacer(),
                                Center(
                                    child: Container(
                                  width: mediaSize.width * .1,
                                  child: AutoSizeText(
                                    "value",
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 14,
                                    minFontSize: 12,
                                    maxLines: 1,
                                  ),
                                )),
                                Spacer(),
                                Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
          Container(
              width: mediaSize.width * .8,
              height: mediaSize.height * .5,
              margin: EdgeInsets.only(
                  left: mediaSize.width * .1,
                  right: mediaSize.width * .1,
                  top: mediaSize.height * .425,
                  bottom: mediaSize.height * .075),
              child: Row(
                children: <Widget>[
                  Container(
                    width: mediaSize.width * .37,
                    height: mediaSize.height * .5,
                    child: Column(
                      children: <Widget>[
                        Align(
                          child: AutoSizeText(
                            "  Date order",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                          height: mediaSize.height * .045,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(0, 3))
                              ]),
                          child: TextFormField(
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
                        Spacer(),
                        Align(
                          child: AutoSizeText(
                            "  Date arrival",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                          height: mediaSize.height * .045,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(0, 3))
                              ]),
                          child: TextFormField(
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
                        Spacer(),
                        Align(
                          child: AutoSizeText(
                            "  Description",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                            height: mediaSize.height * .045,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: mediaSize.height * .05,
                                  width: mediaSize.width * .12,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(0),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintText: "Variation",
                                        hintStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: mediaSize.height * .05,
                                  width: mediaSize.width * .12,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(0),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintText: "value",
                                        hintStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: mediaSize.height * .05,
                                  width: mediaSize.width * .08,
                                  decoration: BoxDecoration(
                                      color: myDeepOrangeColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                        Spacer(),
                        Align(
                          child: AutoSizeText(
                            "  Quantity",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                          height: mediaSize.height * .2,
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaSize.width * .025),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(0, 3))
                              ]),
                          child: Center(
                              child: Row(
                            children: <Widget>[
                              Container(
                                  child: Icon(
                                Icons.remove,
                                size: mediaSize.width * .075,
                              )),
                              Spacer(),
                              Container(
                                  width: mediaSize.width * .125,
                                  height: mediaSize.height * .1,
                                  child: Center(
                                    child: AutoSizeText(
                                      "1",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      maxFontSize: 25,
                                      minFontSize: 15,
                                      maxLines: 2,
                                    ),
                                  )),
                              Spacer(),
                              Container(
                                  child: Icon(
                                Icons.add,
                                size: mediaSize.width * .075,
                              )),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: mediaSize.width * .37,
                    height: mediaSize.height * .5,
                    child: Column(
                      children: <Widget>[
                        Align(
                          child: AutoSizeText(
                            "  Stock name",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                          height: mediaSize.height * .045,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(0, 3))
                              ]),
                          child: TextFormField(
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
                        Spacer(),
                        Align(
                          child: AutoSizeText(
                            "  Category",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                          height: mediaSize.height * .045,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(0, 3))
                              ]),
                          child: TextFormField(
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
                        Spacer(),
                        Align(
                          child: AutoSizeText(
                            "  Distributor",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                          height: mediaSize.height * .045,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(0, 3))
                              ]),
                          child: TextFormField(
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
                        Spacer(),
                        Align(
                          child: AutoSizeText(
                            "  Price",
                            style: TextStyle(color: myLightDarkColor),
                            maxFontSize: 16,
                            minFontSize: 14,
                            maxLines: 1,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        Container(
                          height: mediaSize.height * .2,
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaSize.width * .025),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(0, 3))
                              ]),
                          child: Center(
                              child: Row(
                            children: <Widget>[
                              Container(
                                  child: Icon(
                                Icons.remove,
                                size: mediaSize.width * .075,
                              )),
                              Spacer(),
                              Container(
                                  width: mediaSize.width * .125,
                                  height: mediaSize.height * .1,
                                  child: Center(
                                    child: AutoSizeText(
                                      "0.00",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      maxFontSize: 25,
                                      minFontSize: 15,
                                      maxLines: 2,
                                    ),
                                  )),
                              Spacer(),
                              Container(
                                  child: Icon(
                                Icons.add,
                                size: mediaSize.width * .075,
                              )),
                            ],
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
