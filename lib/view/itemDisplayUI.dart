import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:automanager/view_models/itemDisplayViewModel.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ItemDisplayUI {
  ItemDisplayUI(
      this.context,
      this.itemDisplayViewModel,
      this.myLightOrangeColor,
      this.myDeepOrangeColor,
      this.myLightDarkColor,
      this.txtMySearchBar,
      this.txtMyStockName,
      this.txtMyStockCategory,
      this.txtMyStockQuantity,
      this.txtMyStockPriceEach,
      this.txtMyDescriptionName,
      this.txtMyDescriptionValue,
      this.mySuggestions,
      this.myNewSuggestion,
      this.myDescriptions,
      this.mySelectedItemValues,
      this.myFocus,
      this.isRefreshed,
      this.updateMyMaps,
      this.updateMySelectedItem);

  final BuildContext context;
  final ItemDisplayViewModel itemDisplayViewModel;
  final Color myLightOrangeColor;
  final Color myDeepOrangeColor;
  final Color myLightDarkColor;
  final Function updateMyMaps;
  final Function updateMySelectedItem;
  final TextEditingController txtMySearchBar;
  final TextEditingController txtMyStockName;
  final TextEditingController txtMyStockCategory;
  final TextEditingController txtMyDescriptionValue;
  final TextEditingController txtMyStockQuantity;
  final TextEditingController txtMyStockPriceEach;
  final TextEditingController txtMyDescriptionName;
  final Map<String, String> mySuggestions;
  final List<String> myNewSuggestion;
  final Map<String, dynamic> myDescriptions;
  final List<String> mySelectedItemValues;
  final FocusNode myFocus;
  bool isRefreshed;
  bool isChangeMade = false;

  Widget getItemDisplayUI() {
    requestFocusIfRefreshed();
    displayMyChosenSuggestion();
    final mediaSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        tapOutsideOfFocus();
      },
      child: Container(
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
                          child: AutoCompleteTextField(
                            itemFilter: (item, query) {
                              return item
                                  .toString()
                                  .toLowerCase()
                                  .contains(query.toString().toLowerCase());
                            },
                            itemSorter: (a, b) {
                              return a
                                  .toString()
                                  .toLowerCase()
                                  .compareTo(b.toString().toLowerCase());
                            },
                            itemSubmitted: (value) async =>
                                await displaySelectedSuggestion(value),
                            itemBuilder: (context, item) {
                              return Container(
                                child: Text(item),
                              );
                            },
                            textSubmitted: (String value) async {
                              await findMyItemSuggestions();
                            },
                            textChanged: (value) async {
                              await findMyItemSuggestions();
                            },
                            focusNode: myFocus,
                            suggestions: myNewSuggestion,
                            controller: txtMySearchBar,
                            clearOnSubmit: false,
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: (mySelectedItemValues.length > 0
                          ? Image(
                        image: FirebaseImage(mySelectedItemValues[
                        itemDisplayViewModel.myListIndexStockImage]),
                        fit: BoxFit.cover,
                        width: mediaSize.width * .37,
                        height: mediaSize.height * .2,
                        filterQuality: FilterQuality.high,
                        loadingBuilder: (BuildContext context,
                            Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress != null)
                            return Center(
                                child: CircularProgressIndicator());
                          else
                            return child;
                        },
                      )
                          : Center(child: Text("No Image"),))),
                  Spacer(),
                  Container(
                    width: mediaSize.width * .37,
                    height: mediaSize.height * .2,
                    child: ListView.builder(
                        itemCount: ((myDescriptions.length != null &&
                                myDescriptions.length > 0)
                            ? myDescriptions.length + 1
                            : 1),
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
                                      myDescriptions.keys.toList()[index - 1],
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
                                      myDescriptions.values.toList()[index - 1],
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
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: TextFormField(
                                    onChanged: (String changeValue) {
                                      isChangeMade = true;
                                    },
                                    controller: txtMyStockName,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: (mediaSize.width +
                                                    mediaSize.height) *
                                                .01),
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
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: TextFormField(
                                    onChanged: (String changeValue) {
                                      isChangeMade = true;
                                    },
                                    controller: txtMyStockQuantity,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: (mediaSize.width +
                                                    mediaSize.height) *
                                                .01),
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
                                            controller: txtMyDescriptionName,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10))),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
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
                                            controller: txtMyDescriptionValue,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10))),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
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
                                  onChanged: (String changeValue) {
                                    isChangeMade = true;
                                  },
                                  controller: txtMyStockCategory,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: (mediaSize.width +
                                                  mediaSize.height) *
                                              .01),
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
                                  onChanged: (String changeValue) {
                                    isChangeMade = true;
                                  },
                                  controller: txtMyStockPriceEach,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: (mediaSize.width +
                                                  mediaSize.height) *
                                              .01),
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
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: () async {
                    await updateThisItem();
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        (mediaSize.width + mediaSize.height) * .01),
                    width: mediaSize.width * .125,
                    height: mediaSize.height * .075,
                    decoration: BoxDecoration(
                      color: myDeepOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                          (mediaSize.width + mediaSize.height) * .1)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ])),
    );
  }

  Future<void> findMyItemSuggestions() async {
    await itemDisplayViewModel
        .searchMyItems(txtMySearchBar, this.context, this.updateMyMaps,
            this.mySuggestions, this.myNewSuggestion)
        .then((value) {
      isRefreshed = true;
      isChangeMade = false;
    });
  }

  Future<void> displaySelectedSuggestion(String mySelectedText) async {
    await itemDisplayViewModel
        .anItemSelected(mySelectedText, this.updateMySelectedItem,
            this.mySelectedItemValues, this.myDescriptions, this.context)
        .then((value) async {
      isRefreshed = false;
      isChangeMade = false;
    });
  }

  void requestFocusIfRefreshed() {
    if (isRefreshed == true) {
      myFocus.requestFocus();
    }
  }

  void displayMyChosenSuggestion() {
    print("my selected text desc length: " +
        (myDescriptions.length != null && myDescriptions.length > 0
            ? myDescriptions.length.toString()
            : "0"));
    if (mySelectedItemValues.length > 0 && isChangeMade == false) {
      txtMyStockName.text =
          mySelectedItemValues[itemDisplayViewModel.myListIndexStockName];
      txtMyStockCategory.text =
          mySelectedItemValues[itemDisplayViewModel.myListIndexStockCategory];
      txtMyStockPriceEach.text =
          mySelectedItemValues[itemDisplayViewModel.myListIndexStockPriceEach];
      txtMyStockQuantity.text =
          mySelectedItemValues[itemDisplayViewModel.myListIndexStockQuantity];


    }
  }

  void tapOutsideOfFocus() {
    isRefreshed = false;
    FocusScope.of(context).unfocus();
  }

  Future<void> updateThisItem() async {
    if (isChangeMade == true) {
      await itemDisplayViewModel.updateThisItem(
          [txtMyStockName.text,
          txtMyStockCategory.text,
          txtMyStockQuantity.text,
          txtMyStockPriceEach.text]);
      print("there is to update");
    } else {
      print("there is nothing to update");
    }
  }
}
