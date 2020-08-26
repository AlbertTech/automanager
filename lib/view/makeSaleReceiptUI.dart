import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MakeSaleReceiptUI {
  MakeSaleReceiptUI(
      this.context, this.myLightOrangeColor, this.myLightDarkColor);

  final BuildContext context;
  final Color myLightOrangeColor;
  final Color myLightDarkColor;

  Widget getMakeSaleReceiptUI() {
    final Size mediaSize = MediaQuery.of(context).size;
    return Container(
        color: myLightOrangeColor,
        width: mediaSize.width,
        height: mediaSize.height,
        child: Stack(
          children: <Widget>[
            Container(
                width: mediaSize.width * .8,
                height: mediaSize.height * .55,
                margin: EdgeInsets.symmetric(
                    horizontal: mediaSize.width * .1,
                    vertical: mediaSize.height * .05),
                child: Column(
                  children: <Widget>[
                    Align(
                      child: AutoSizeText(
                        " Order type",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: myLightDarkColor),
                        maxFontSize: 19,
                        minFontSize: 16,
                        maxLines: 1,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      width: mediaSize.width * .8,
                      height: mediaSize.height * .05,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black.withOpacity(0.18),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset: Offset(0, 3))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Spacer(),
                    Align(
                      child: AutoSizeText(
                        " Order date",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: myLightDarkColor),
                        maxFontSize: 19,
                        minFontSize: 16,
                        maxLines: 1,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      width: mediaSize.width * .8,
                      height: mediaSize.height * .05,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black.withOpacity(0.18),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset: Offset(0, 3))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Spacer(),
                    Container(
                      width: mediaSize.width * .8,
                      height: mediaSize.height * .375,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: mediaSize.width * .37,
                            height: mediaSize.height * .375,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  child: AutoSizeText(
                                    " Customer name",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 19,
                                    minFontSize: 16,
                                    maxLines: 1,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  width: mediaSize.width * .8,
                                  height: mediaSize.height * .05,
                                  decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                Spacer(),
                                Align(
                                  child: AutoSizeText(
                                    " Quantity",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 19,
                                    minFontSize: 16,
                                    maxLines: 1,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  width: mediaSize.width * .8,
                                  height: mediaSize.height * .175,
                                  decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                      child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Container(
                                          child: Icon(
                                        Icons.remove,
                                        size: mediaSize.width * .075,
                                        color: myLightDarkColor,
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
                                        color: myLightDarkColor,
                                        size: mediaSize.width * .075,
                                      )),
                                      Spacer(),
                                    ],
                                  )),
                                ),
                                Spacer(),
                                Align(
                                  child: AutoSizeText(
                                    " Age",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 19,
                                    minFontSize: 16,
                                    maxLines: 1,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  width: mediaSize.width * .8,
                                  height: mediaSize.height * .05,
                                  decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                      child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Container(
                                          child: Icon(
                                        Icons.remove,
                                        size: mediaSize.width * .075,
                                        color: myLightDarkColor,
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
                                        color: myLightDarkColor,
                                        size: mediaSize.width * .075,
                                      )),
                                      Spacer(),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: mediaSize.width * .37,
                            height: mediaSize.height * .375,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  child: AutoSizeText(
                                    " Customer location",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 19,
                                    minFontSize: 15,
                                    maxLines: 1,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  width: mediaSize.width * .8,
                                  height: mediaSize.height * .05,
                                  decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                Spacer(),
                                Align(
                                  child: AutoSizeText(
                                    " Balance",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 19,
                                    minFontSize: 16,
                                    maxLines: 1,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  width: mediaSize.width * .8,
                                  height: mediaSize.height * .175,
                                  decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                      child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Container(
                                          child: Icon(
                                        Icons.remove,
                                        size: mediaSize.width * .075,
                                        color: myLightDarkColor,
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
                                        color: myLightDarkColor,
                                        size: mediaSize.width * .075,
                                      )),
                                      Spacer(),
                                    ],
                                  )),
                                ),
                                Spacer(),
                                Align(
                                  child: AutoSizeText(
                                    " Gender",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: myLightDarkColor),
                                    maxFontSize: 19,
                                    minFontSize: 16,
                                    maxLines: 1,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                    width: mediaSize.width * .8,
                                    height: mediaSize.height * .05,
                                    decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.18),
                                              spreadRadius: 1,
                                              blurRadius: 6,
                                              offset: Offset(0, 3))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Align(
                                      child: Text("  Choose"),
                                      alignment: Alignment.centerLeft,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
