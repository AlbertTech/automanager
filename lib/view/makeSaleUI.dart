import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:automanager/view_models/makeSaleViewModel.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

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
      this.myNewSuggestion,
      this.mySelectedItemValues,
      this.myFocus,
      this.isRefreshed);

  final Widget myClipPathShadowed;
  final Function updateMyMaps;
  final Function updateMySelectedItem;
  final BuildContext context;
  final MakeSaleViewModel makeSaleViewModel;
  final Color myLightOrangeColor;
  final Color myLightDarkColor;

  final TextEditingController txtMySearchBar;
  final Map<String, String> mySuggestions;
  final List<String> myNewSuggestion;
  final List<String> mySelectedItemValues;
  final FocusNode myFocus;
  bool isRefreshed;

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
                                      return Container(
                                        child: Text(item),
                                      );
                                    },
                                    textChanged: (String txtSearchValue) async {
                                      await findMyItemSuggestions();
                                    },
                                    focusNode: myFocus,
                                    suggestions: myNewSuggestion,
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
                      margin: EdgeInsets.only(top: mediaSize.height * .0425),
                      width: mediaSize.width * .8,
                      height: mediaSize.height * .475,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text((mySelectedItemValues.length > 0
                                ? (mySelectedItemValues[
                                    makeSaleViewModel.myListIndexStockName])
                                : "Choose an item")),
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
                                    height: mediaSize.height * .05,
                                    width: mediaSize.width * 365,
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
                                      child: Text(
                                          "\t\t" +
                                              (mySelectedItemValues.length > 0
                                                  ? (mySelectedItemValues[
                                                      makeSaleViewModel
                                                          .myListIndexStockCategory])
                                                  : ""),
                                          style: (TextStyle(
                                            color: Colors.black,
                                          ))),
                                      alignment: Alignment.centerLeft,
                                    )),
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
                                            color:
                                                Colors.black.withOpacity(0.18),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 3))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Align(
                                    child: Text(
                                        "\t\t" +
                                            (mySelectedItemValues.length > 0
                                                ? (mySelectedItemValues[
                                                    makeSaleViewModel
                                                        .myListIndexStockQuantity])
                                                : ""),
                                        style: (TextStyle(
                                          color: Colors.black,
                                        ))),
                                    alignment: Alignment.centerLeft,
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
                                      maxHeight: mediaSize.height * .05,
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
                                  child: Align(
                                    child: Text(
                                        "\t\t" +
                                            (mySelectedItemValues.length > 0
                                                ? (mySelectedItemValues[
                                                    makeSaleViewModel
                                                        .myListIndexStockPriceEach])
                                                : ""),
                                        style: (TextStyle(
                                          color: Colors.black,
                                        ))),
                                    alignment: Alignment.centerLeft,
                                  ),
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
      ),
    );
  }

  Future<void> findMyItemSuggestions() async {
    await makeSaleViewModel
        .commandSearchForSuggestions(this.txtMySearchBar.text, this.context,
            this.updateMyMaps, this.mySuggestions, this.myNewSuggestion)
        .then((value) {
      isRefreshed = true;
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
