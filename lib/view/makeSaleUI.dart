import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MakeSaleUI {
  MakeSaleUI(
    this.context,
    this.myClipPathShadowed,
    this.myLightOrangeColor,
    this.myLightDarkColor,
  );

  final Widget myClipPathShadowed;
  final BuildContext context;
  final Color myLightOrangeColor;
  final Color myLightDarkColor;

  Widget getMakeSaleUI() {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
      width: mediaSize.width,
      height: mediaSize.height,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          myClipPathShadowed,
          Container(
            width: mediaSize.width,
            height: mediaSize.height,
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: mediaSize.width,
                    height: mediaSize.height * .1,
                    padding: EdgeInsets.only(top: mediaSize.height * .015),
                    decoration: BoxDecoration(
                        color: myLightOrangeColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(0, 3))
                        ]),
                    child: Center(
                      child: Container(
                          width: mediaSize.width * .825,
                          height: mediaSize.height * .05,
                          padding: EdgeInsets.only(
                              left: mediaSize.width * .05,
                              right: mediaSize.width * .05),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80),
                                bottomRight: Radius.circular(80)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.search,
                                color: myLightDarkColor,
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxHeight: mediaSize.height * .05,
                                    maxWidth: mediaSize.width * .65),
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
                                              Radius.circular(10)))),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: mediaSize.height * .0425),
                    width: mediaSize.width * .8,
                    height: mediaSize.height * .475,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Apples"),
                        ),
                        /*Image.asset(
                          "assets/images/image_add_stock.png",
                          fit: BoxFit.fill,
                          width: mediaSize.width * .8,
                          height: mediaSize.height * .425,
                        )*/
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: mediaSize.width * .8,
                    height: mediaSize.height * .25,
                    margin: EdgeInsets.only(top: mediaSize.height * .075),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: mediaSize.width * .365,
                          height: mediaSize.height * .25,
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: AutoSizeText(
                                  "  Category",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: myLightDarkColor),
                                  maxFontSize: 16,
                                  minFontSize: 14,
                                  maxLines: 1,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxHeight: mediaSize.height * .05,
                                    maxWidth: mediaSize.width * .365),
                                decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.18),
                                          spreadRadius: 1,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              Spacer(),
                              Align(
                                child: AutoSizeText(
                                  "  Quantity",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: myLightDarkColor),
                                  maxFontSize: 16,
                                  minFontSize: 14,
                                  maxLines: 1,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxHeight: mediaSize.height * .05,
                                    maxWidth: mediaSize.width * .365),
                                decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.18),
                                          spreadRadius: 1,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              Spacer(),
                              Align(
                                child: AutoSizeText(
                                  "  Price each",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: myLightDarkColor),
                                  maxFontSize: 16,
                                  minFontSize: 14,
                                  maxLines: 1,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxHeight: mediaSize.height * .05,
                                    maxWidth: mediaSize.width * .365),
                                decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.18),
                                          spreadRadius: 1,
                                          blurRadius: 6,
                                          offset: Offset(0, 3))
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: <Widget>[
                            Spacer(),
                            Container(
                              constraints: BoxConstraints(
                                  maxHeight: mediaSize.height * .2225,
                                  maxWidth: mediaSize.width * .365),
                              decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.18),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: Offset(0, 3))
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
