import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:automanager/view/makeSaleReceiptView.dart';
import 'package:automanager/view_models/makeSaleViewModel.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_image/firebase_image.dart';

class MakeSaleUI {
  MakeSaleUI(
      this.context,
      this.updateMyMaps,
      this.updateMySelectedItem,
      this.makeSaleViewModel,
      this.myClipPathShadowed,
      this.myLightOrangeColor,
      this.myLightDarkColor,
      this.txtMySearchBar,
      this.mySuggestions,
      this.mySuggestionListDisplay,
      this.mySelectedItemValues,
      this.myFocus,
      this.isRefreshed,
      this.mySuggestionsDescription);

  final Widget myClipPathShadowed;
  final Function updateMyMaps;
  final Function updateMySelectedItem;
  final BuildContext context;
  final MakeSaleViewModel makeSaleViewModel;
  final Color myLightOrangeColor;
  final Color myLightDarkColor;

  final TextEditingController txtMySearchBar;
  final Map<String, String> mySuggestions;
  final List<String> mySuggestionListDisplay;
  final List<String> mySelectedItemValues;
  final FocusNode myFocus;
  bool isRefreshed;
  final List<List<String>> mySuggestionsDescription;

  Widget getMakeSaleUI() {
    requestFocusIfRefreshed();
    final mediaSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        tapOutsideOfFocus();
      },
      child: Container(
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
                  //header
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
                                Container(
                                  constraints: BoxConstraints(
                                      maxHeight: mediaSize.height * .05,
                                      maxWidth: mediaSize.width * .65),
                                  child: AutoCompleteTextField(
                                    itemFilter: (item, query) {
                                      return item
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              query.toString().toLowerCase());
                                    },
                                    itemSorter: (a, b) {
                                      return a
                                          .toString()
                                          .toLowerCase()
                                          .compareTo(
                                              b.toString().toLowerCase());
                                    },
                                    itemSubmitted: (value) async =>
                                        await itemSelected(value),
                                    itemBuilder: (context, item) {
                                      return ListTile(
                                        title: Text(item),
                                      );
                                    },
                                    textChanged: (String txtSearchValue) async {
                                      await findMyItemSuggestions();
                                    },
                                    focusNode: myFocus,
                                    suggestions: mySuggestionListDisplay,
                                    controller: txtMySearchBar,
                                    clearOnSubmit: false,
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
                                GestureDetector(
                                  child: Icon(
                                    Icons.search,
                                    color: myLightDarkColor,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: mediaSize.width * .8,
                      height: mediaSize.height * .075,
                      child: Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: mediaSize.height * .0425),
                            width: mediaSize.width * .4,
                            height: mediaSize.height * .1,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text((mySelectedItemValues.length > 0
                                      ? (mySelectedItemValues[makeSaleViewModel
                                          .myListIndexStockName])
                                      : "Choose an item")),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: mediaSize.height * .0425),
                            width: mediaSize.width * .4,
                            height: mediaSize.height * .1,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text((mySelectedItemValues.length > 0
                                      ? (mySelectedItemValues[makeSaleViewModel
                                          .myListIndexStockCategory])
                                      : "")),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //body
                  Center(
                    child: Container(
                        width: mediaSize.width * .8,
                        height: mediaSize.height * .455,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: (mySelectedItemValues.length > 0
                            ? Image(
                                image: FirebaseImage(mySelectedItemValues[
                                    makeSaleViewModel
                                        .myListIndexStockImageFile]),
                                fit: BoxFit.cover,
                                width: mediaSize.width * .8,
                                height: mediaSize.height * .455,
                                filterQuality: FilterQuality.high,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress !=
                                      null)
                                    return Center(
                                      child: CircularProgressIndicator());
                                  else
                                    return child;
                                },
                              )
                            : Text(""))),
                  ),
                  //foot
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
                                      maxHeight: mediaSize.height * .2225,
                                      maxWidth: mediaSize.width * .365),
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
                                    child: AutoSizeText(
                                      (mySelectedItemValues.length > 0
                                          ? (mySelectedItemValues[
                                              makeSaleViewModel
                                                  .myListIndexStockQuantity])
                                          : "0"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: myLightDarkColor,
                                          fontWeight: FontWeight.bold),
                                      maxFontSize: 35,
                                      minFontSize: 30,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: mediaSize.width * .365,
                            height: mediaSize.height * .25,
                            child: Column(
                              children: <Widget>[
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
                                      maxHeight: mediaSize.height * .2225,
                                      maxWidth: mediaSize.width * .365),
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
                                    child: AutoSizeText(
                                      (mySelectedItemValues.length > 0
                                          ? (mySelectedItemValues[
                                              makeSaleViewModel
                                                  .myListIndexStockPriceEach])
                                          : "0"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: myLightDarkColor,
                                          fontWeight: FontWeight.bold),
                                      maxFontSize: 35,
                                      minFontSize: 30,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: () async {
                    await navigateMakeSaleReceiptView();
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        (mediaSize.width + mediaSize.height) * .01),
                    width: mediaSize.width * .125,
                    height: mediaSize.height * .075,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future navigateMakeSaleReceiptView() async {
    if (mySelectedItemValues != null && mySelectedItemValues.isNotEmpty) {
      print("my list is nnull" + mySelectedItemValues.toString());
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MakeSaleReceiptView(
                  mySelectedItemValues[0],
                  mySelectedItemValues[1],
                  mySelectedItemValues[2])));
    } else {
      EasyLoading.showInfo("Please choose an item");
    }
  }

  Future<void> findMyItemSuggestions() async {
    await makeSaleViewModel
        .commandSearchForSuggestions(
            this.txtMySearchBar.text,
            this.context,
            this.updateMyMaps,
            this.mySuggestions,
            this.mySuggestionListDisplay,
            this.mySuggestionsDescription)
        .then((value) {
      isRefreshed = true;
      print("my suggestions desc: " + mySuggestionsDescription.toString());
    });
  }

  Future<void> itemSelected(String mySelectedText) async {
    await makeSaleViewModel
        .anItemSelected(mySelectedText, txtMySearchBar,
            this.updateMySelectedItem, this.mySelectedItemValues, this.context)
        .then((value) {
      isRefreshed = false;
    });
  }

  void requestFocusIfRefreshed() {
    if (isRefreshed == true) {
      myFocus.requestFocus();
    }
  }

  void tapOutsideOfFocus() {
    isRefreshed = false;
    FocusScope.of(context).unfocus();
  }
}
