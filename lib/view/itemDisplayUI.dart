import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ItemDisplayUI {
  ItemDisplayUI(this.context, this.myLightOrangeColor, this.myDeepOrangeColor,
      this.myLightDarkColor);

  final BuildContext context;
  final Color myLightOrangeColor;
  final Color myDeepOrangeColor;
  final Color myLightDarkColor;

  Widget getItemDisplayUI() {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
        width: mediaSize.width,
        height: mediaSize.height,
        color: Colors.white,
        child: Stack(children: <Widget>[
          Container(
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
                      )
                    ],
                  )),
            ),
          ),
          Container(
            width: mediaSize.width * .8,
            height: mediaSize.height * .2,
            margin: EdgeInsets.only(
              left: mediaSize.width * .1,
              right: mediaSize.width * .1,
              top: mediaSize.height * .125,
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
                                Container(width: mediaSize.width * .11)
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
            width: mediaSize.width,
            height: mediaSize.height * .65,
            margin: EdgeInsets.only(top: mediaSize.height * .35),
            decoration: BoxDecoration(
                color: myLightOrangeColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, -3))
                ]),
            child: Container(
              width: mediaSize.width * .9,
              height: mediaSize.height * .55,
              margin: EdgeInsets.symmetric(
                  vertical: mediaSize.height * .05,
                  horizontal: mediaSize.width * .1),
              child: Column(
                children: <Widget>[
                  Container(
                    height: mediaSize.height * .27,
                    width: mediaSize.width * .9,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: mediaSize.height * .27,
                          width: mediaSize.width * .37,
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: AutoSizeText(
                                  "  Stock name",
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
                                    maxWidth: mediaSize.width * .37,
                                    maxHeight: mediaSize.height * .05),
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
                                    maxWidth: mediaSize.width * .37,
                                    maxHeight: mediaSize.height * .05),
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
                                  height: mediaSize.height * .05,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: mediaSize.height * .05,
                                        width: mediaSize.width * .12,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.18),
                                                  spreadRadius: 1,
                                                  blurRadius: 6,
                                                  offset: Offset(0, 3))
                                            ]),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              hintText: "Variation",
                                              hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: mediaSize.height * .05,
                                        width: mediaSize.width * .12,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.18),
                                                  spreadRadius: 1,
                                                  blurRadius: 6,
                                                  offset: Offset(0, 3))
                                            ]),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              hintText: "value",
                                              hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: mediaSize.height * .05,
                                        width: mediaSize.width * .08,
                                        decoration: BoxDecoration(
                                            color: myDeepOrangeColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.18),
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
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: mediaSize.height * .27,
                          width: mediaSize.width * .37,
                          child: Column(children: <Widget>[
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
                                  maxWidth: mediaSize.width * .37,
                                  maxHeight: mediaSize.height * .05),
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
                                  maxWidth: mediaSize.width * .37,
                                  maxHeight: mediaSize.height * .05),
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
                            ),
                            Spacer(),
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth: mediaSize.width * .37,
                                  maxHeight: mediaSize.height * .078),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: mediaSize.height * .25,
                    width: mediaSize.width * .9,
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: mediaSize.width * .9,
                              maxHeight: mediaSize.height * .03),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "  Today",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: myLightDarkColor),
                              maxFontSize: 20,
                              minFontSize: 16,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: mediaSize.width * .9,
                              maxHeight: mediaSize.height * .22),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(0, 3))
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
