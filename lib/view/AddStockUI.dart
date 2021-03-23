import 'package:auto_size_text/auto_size_text.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/textFieldFocusUtilities.dart';
import 'package:automanager/view_models/addStockViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class AddStockUI {
  AddStockUI(
      this.context,
      this.addStockViewModel,
      this.textFieldFocusUtilities,
      this.sharedPrefUtil,
      this.myClipPathShadowed,
      this.callBackMapDesc,
      this.callBackImages,
      this.myMapDesc,
      this.myCategorySuggestions,
      this.txtDateOrder,
      this.txtDateArrival,
      this.txtDescriptionName,
      this.txtDescriptionValue,
      this.txtQuantity,
      this.txtStockName,
      this.txtCategory,
      this.txtDistributor,
      this.txtPrice,
      this.myDeepOrangeColor,
      this.myLightDarkColor,
      this.myLightBlueColor,
      this.imageFile);

  final BuildContext context;
  final AddStockViewModel addStockViewModel;
  final TextFieldFocusUtilities textFieldFocusUtilities;
  final UserInfoSharedPref sharedPrefUtil;
  final Widget myClipPathShadowed;
  final Function callBackMapDesc;
  final Function callBackImages;
  final Map<String, String> myMapDesc;
  final TextEditingController txtDateOrder;
  final TextEditingController txtDateArrival;
  final TextEditingController txtDescriptionName;
  final TextEditingController txtDescriptionValue;
  final TextEditingController txtQuantity;
  final TextEditingController txtStockName;
  final TextEditingController txtCategory;
  final TextEditingController txtDistributor;
  final TextEditingController txtPrice;
  final Color myDeepOrangeColor;
  final Color myLightDarkColor;
  final Color myLightBlueColor;
  final List<String> myCategorySuggestions;
  File imageFile;

  Widget getAddStockUI() {
    final mediaSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        textFieldFocusUtilities.textFocus = false;
      },
      child: Container(
        width: mediaSize.width,
        height: mediaSize.height,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            myClipPathShadowed,
            //Head - image
            Container(
              width: mediaSize.width * .8,
              height: mediaSize.height * .2,
              margin: EdgeInsets.only(
                left: mediaSize.width * .1,
                right: mediaSize.width * .1,
                top: mediaSize.height * .05,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print("imaged clicked");
                      openGallery();
                    },
                    child: Container(
                        width: mediaSize.width * .37,
                        height: mediaSize.height * .2,
                        child: myImage(mediaSize)),
                  ),
                  Spacer(),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: mediaSize.height * .2,
                        maxWidth: mediaSize.width * .37),
                    padding: EdgeInsets.all(0),
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: myMapDesc.keys.length + 1,
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
                                      myMapDesc.keys
                                          .toList()[index - 1]
                                          .toString(),
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
                                      myMapDesc.values
                                          .toList()[index - 1]
                                          .toString(),
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
            //Body -Text fields
            Container(
                width: mediaSize.width * .8,
                height: mediaSize.height * .5,
                margin:
                    textFieldFocusUtilities.getMarginEdgeInsetRegardTextFocus(
                        mediaSize, "AddStockView"),
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
                              constraints: (BoxConstraints(
                                  maxHeight: mediaSize.height * .045,
                                  maxWidth: mediaSize.width * .37)),
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime.now())
                                            .then((value) {
                                          txtDateOrder.text =
                                              value.year.toString() +
                                                  "-" +
                                                  value.day.toString() +
                                                  "-" +
                                                  value.month.toString();
                                        });
                                        print("date order click");
                                      },
                                      child: Icon(Icons.date_range,
                                          color: Colors.grey,
                                          size: (mediaSize.width +
                                                  mediaSize.height) *
                                              .015),
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onTap: () {
                                        textFieldFocusUtilities.textFocus =
                                            true;
                                      },
                                      onFieldSubmitted: (value) {
                                        textFieldFocusUtilities.textFocus =
                                            false;
                                      },
                                      controller: txtDateOrder,
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
                                          hintText: "yyrr-dd-mm",
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(.6),
                                              fontSize: 14)),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    flex: 4,
                                  )
                                ],
                              )),
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
                              constraints: (BoxConstraints(
                                  maxHeight: mediaSize.height * .045,
                                  maxWidth: mediaSize.width * .37)),
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime.now())
                                            .then((value) {
                                          txtDateArrival.text =
                                              value.year.toString() +
                                                  "-" +
                                                  value.day.toString() +
                                                  "-" +
                                                  value.month.toString();
                                        });
                                        print("date order click");
                                      },
                                      child: Icon(Icons.date_range,
                                          color: Colors.grey,
                                          size: (mediaSize.width +
                                                  mediaSize.height) *
                                              .015),
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onTap: () {
                                        textFieldFocusUtilities.textFocus =
                                            true;
                                      },
                                      onFieldSubmitted: (value) {
                                        textFieldFocusUtilities.textFocus =
                                            false;
                                      },
                                      controller: txtDateArrival,
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
                                          hintText: "yyrr-dd-mm",
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(.6),
                                              fontSize: 14)),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    flex: 4,
                                  )
                                ],
                              )),
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
                                      onTap: () {
                                        textFieldFocusUtilities.textFocus =
                                            true;
                                      },
                                      onFieldSubmitted: (value) {
                                        textFieldFocusUtilities.textFocus =
                                            false;
                                      },
                                      controller: txtDescriptionName,
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
                                              fontSize: 16,
                                              color: Colors.black
                                                  .withOpacity(.6))),
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
                                      onTap: () {
                                        textFieldFocusUtilities.textFocus =
                                            true;
                                      },
                                      onFieldSubmitted: (value) {
                                        textFieldFocusUtilities.textFocus =
                                            false;
                                      },
                                      controller: txtDescriptionValue,
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
                                              fontSize: 16,
                                              color: Colors.black
                                                  .withOpacity(.7))),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      print("add desc");
                                      callBackMapDesc(
                                          myMapDesc,
                                          txtDescriptionName.text,
                                          txtDescriptionValue.text);
                                      txtDescriptionName.text = "";
                                      txtDescriptionValue.text = "";

                                      print("my values" +
                                          myMapDesc.values.toList().toString());
                                    },
                                    child: Container(
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
                                  )
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
                                GestureDetector(
                                  onTap: () {
                                    if (txtQuantity.text != null &&
                                        txtQuantity.text.isNotEmpty &&
                                        int.parse(txtQuantity.text) > 0) {
                                      txtQuantity.text =
                                          (int.parse(txtQuantity.text) - 1)
                                              .toString();
                                    } else
                                      txtQuantity.text = 0.toString();
                                  },
                                  child: Container(
                                      child: Icon(
                                    Icons.remove,
                                    size: mediaSize.width * .075,
                                  )),
                                ),
                                Spacer(),
                                Container(
                                    width: mediaSize.width * .125,
                                    height: mediaSize.height * .1,
                                    child: Center(
                                        child: TextField(
                                      onTap: () async {
                                        await createAlertDialog(
                                            context, "Quantity");
                                      },
                                      textAlign: TextAlign.center,
                                      controller: txtQuantity,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(0),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          )),
                                    ))),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    if (txtQuantity.text != null &&
                                        txtQuantity.text.isNotEmpty) {
                                      txtQuantity.text =
                                          (int.parse(txtQuantity.text) + 1)
                                              .toString();
                                    } else
                                      txtQuantity.text = 1.toString();
                                  },
                                  child: Container(
                                      child: Icon(
                                    Icons.add,
                                    size: mediaSize.width * .075,
                                  )),
                                )
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
                              onTap: () {
                                textFieldFocusUtilities.textFocus = true;
                              },
                              onFieldSubmitted: (value) {
                                textFieldFocusUtilities.textFocus = false;
                              },
                              controller: txtStockName,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              keyboardType: TextInputType.text,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
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
                                        offset: Offset(0, 3)),
                                  ]),
                              child: TextFormField(
                                onTap: () {
                                  textFieldFocusUtilities.textFocus = true;
                                },
                                onFieldSubmitted: (value) {
                                  textFieldFocusUtilities.textFocus = false;
                                },
                                controller: txtCategory,
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
                              )),
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
                              onTap: () {
                                textFieldFocusUtilities.textFocus = true;
                              },
                              onFieldSubmitted: (value) {
                                textFieldFocusUtilities.textFocus = false;
                              },
                              controller: txtDistributor,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              keyboardType: TextInputType.text,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Spacer(),
                          Align(
                            child: AutoSizeText(
                              "  Price each",
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
                                GestureDetector(
                                  onTap: () {
                                    if (txtPrice.text != null &&
                                        txtPrice.text.isNotEmpty &&
                                        int.parse(txtPrice.text) > 0) {
                                      txtPrice.text =
                                          (int.parse(txtPrice.text) - 1)
                                              .toString();
                                    } else
                                      txtPrice.text = 0.toString();
                                  },
                                  child: Container(
                                      child: Icon(
                                    Icons.remove,
                                    size: mediaSize.width * .075,
                                  )),
                                ),
                                Spacer(),
                                Container(
                                    width: mediaSize.width * .125,
                                    height: mediaSize.height * .1,
                                    child: Center(
                                        child: TextField(
                                      onTap: () async {
                                        await createAlertDialog(
                                            context, "Price");
                                      },
                                      textAlign: TextAlign.center,
                                      controller: txtPrice,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(0),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          )),
                                    ))),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    if (txtPrice.text != null &&
                                        txtPrice.text.isNotEmpty &&
                                        int.parse(txtPrice.text) >= 0) {
                                      txtPrice.text =
                                          (int.parse(txtPrice.text) + 1)
                                              .toString();
                                    } else
                                      txtPrice.text = 1.toString();
                                  },
                                  child: Container(
                                      child: Icon(
                                    Icons.add,
                                    size: mediaSize.width * .075,
                                  )),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            //FAB
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: () async {
                    await addAnItem();
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        (mediaSize.width + mediaSize.height) * .01),
                    width: mediaSize.width * .125,
                    height: mediaSize.height * .075,
                    decoration: BoxDecoration(
                      color: myDeepOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
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

  Future<void> makeDialogChooseImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text("Please Choose!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      print("gallery");
                      openGallery();
                    },
                  ),
                  GestureDetector(
                    child: Text("\nCamera"),
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> openGallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery).then((value) {
      imageFile = new File(value.path);
      this.callBackImages(imageFile);
      return value;
    });
    print('my path: ' + pickedFile.path);
  }

  Widget myImage(Size mediaSize) {
    if (imageFile.path.isNotEmpty && imageFile.path != "") {
      return new Container(
        width: mediaSize.width * .37,
        height: mediaSize.height * .2,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Image.file(
          imageFile,
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
        ),
      );
    } else {
      return new Container(
        width: mediaSize.width * .37,
        height: mediaSize.height * .2,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Image.asset(
          'assets/images/image_add_image.png',
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
        ),
      );
    }
  }

  Future<void> addAnItem() async {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..textStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..maskType = EasyLoadingMaskType.clear
      ..indicatorSize = 50
      ..radius = 10.0
      ..backgroundColor = myLightBlueColor
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..progressColor = Colors.white
      ..userInteractions = false
      ..dismissOnTap = false;

    EasyLoading.show(status: "loading");

    await new AddStockViewModel()
        .addStock(
            txtStockName.text,
            txtCategory.text,
            txtQuantity.text,
            txtPrice.text,
            txtDateOrder.text,
            txtDateArrival.text,
            txtDistributor.text,
            myMapDesc,
            imageFile)
        .then((value) {
      txtStockName.clear();
      txtCategory.clear();
      txtQuantity.clear();
      txtPrice.clear();
      txtDateOrder.clear();
      txtDateArrival.clear();
      txtDistributor.clear();
      txtDescriptionName.clear();
      txtDescriptionValue.clear();
      myCategorySuggestions.clear();
      myMapDesc.clear();
      imageFile = new File("");
      callBackMapDesc(null, null, null);
    });
  }

  Future createAlertDialog(BuildContext context, String whichBox) {
    return showDialog(
        context: context,
        builder: (context) {
          if (whichBox == "Quantity") {
            return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pop();
                },
                child: AlertDialog(
                  title: Text("Input your quantity!"),
                  content: TextField(controller: txtQuantity),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ));
          } else if (whichBox == "Price") {
            return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pop();
                },
                child: AlertDialog(
                  title: Text("Input your price!"),
                  content: TextField(controller: txtPrice),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                      },
                      child: Text("Submit"),
                    )
                  ],
                ));
          } else {
            return AlertDialog(
              title: Text("Error"),
            );
          }
        });
  }
}
