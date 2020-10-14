import 'package:auto_size_text/auto_size_text.dart';
import 'package:automanager/view_models/makeSaleReceiptViewModel.dart';
import 'package:flutter/material.dart';

class MakeSaleReceiptUI {
  MakeSaleReceiptUI(
      this.makeSaleReceiptViewModel,
      this.context,
      this.myLightOrangeColor,
      this.myLightDarkColor,
      this.txtOrderType,
      this.txtOrderDate,
      this.txtCustomerName,
      this.txtCustomerLocation,
      this.txtQuantity,
      this.txtBalance,
      this.txtAge,
      this.txtGender,
      this.stockId,
      this.categoryId,
      this.stockName,
      this.callBackDropDown,
      this.myDropDownSelectedValue,
      this.myDropDownValues);

  final MakeSaleReceiptViewModel makeSaleReceiptViewModel;
  final BuildContext context;
  final Color myLightOrangeColor;
  final Color myLightDarkColor;
  final TextEditingController txtOrderType;
  final TextEditingController txtOrderDate;
  final TextEditingController txtCustomerName;
  final TextEditingController txtCustomerLocation;
  final TextEditingController txtQuantity;
  final TextEditingController txtBalance;
  final TextEditingController txtAge;
  final TextEditingController txtGender;
  final String categoryId;
  final String stockId;
  final String stockName;
  final Map myDropDownValues;
  int myDropDownSelectedValue;
  final Function callBackDropDown;

  Widget getMakeSaleReceiptUI() {
    final Size mediaSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          controller: txtOrderType,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          controller: txtOrderDate,
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
                                    width: mediaSize.width * .37,
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
                                    child: TextFormField(
                                      controller: txtCustomerName,
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
                                              color: Colors.black
                                                  .withOpacity(0.18),
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
                                        GestureDetector(
                                          onTap: () {
                                            if (txtQuantity.text != null &&
                                                txtQuantity.text.isNotEmpty &&
                                                int.parse(txtQuantity.text) >
                                                    0) {
                                              txtQuantity.text =
                                                  (int.parse(txtQuantity.text) -
                                                          1)
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
                                              textAlign: TextAlign.center,
                                              controller: txtQuantity,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  )),
                                            ))),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            if (txtQuantity.text != null &&
                                                txtQuantity.text.isNotEmpty &&
                                                int.parse(txtQuantity.text) >=
                                                    0) {
                                              txtQuantity.text =
                                                  (int.parse(txtQuantity.text) +
                                                          1)
                                                      .toString();
                                            } else
                                              txtQuantity.text = 1.toString();
                                          },
                                          child: Container(
                                              child: Icon(
                                            Icons.add,
                                            size: mediaSize.width * .075,
                                          )),
                                        ),
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
                                              color: Colors.black
                                                  .withOpacity(0.18),
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
                                        GestureDetector(
                                          onTap: () {
                                            if (txtAge.text != null &&
                                                txtAge.text.isNotEmpty &&
                                                int.parse(txtAge.text) > 0) {
                                              txtAge.text =
                                                  (int.parse(txtAge.text) - 1)
                                                      .toString();
                                            } else
                                              txtAge.text = 0.toString();
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
                                              textAlign: TextAlign.center,
                                              controller: txtAge,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  )),
                                            ))),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            if (txtAge.text != null &&
                                                txtAge.text.isNotEmpty &&
                                                int.parse(txtAge.text) >= 0) {
                                              txtAge.text =
                                                  (int.parse(txtAge.text) + 1)
                                                      .toString();
                                            } else
                                              txtAge.text = 1.toString();
                                          },
                                          child: Container(
                                              child: Icon(
                                            Icons.add,
                                            size: mediaSize.width * .075,
                                          )),
                                        ),
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
                                    width: mediaSize.width * .37,
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
                                    child: TextFormField(
                                      controller: txtCustomerLocation,
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
                                              color: Colors.black
                                                  .withOpacity(0.18),
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
                                        GestureDetector(
                                          onTap: () {
                                            if (txtBalance.text != null &&
                                                txtBalance.text.isNotEmpty &&
                                                int.parse(txtBalance.text) >
                                                    0) {
                                              txtBalance.text =
                                                  (int.parse(txtBalance.text) -
                                                          1)
                                                      .toString();
                                            } else
                                              txtBalance.text = 0.toString();
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
                                              textAlign: TextAlign.center,
                                              controller: txtBalance,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  )),
                                            ))),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            if (txtBalance.text != null &&
                                                txtBalance.text.isNotEmpty &&
                                                int.parse(txtBalance.text) >=
                                                    0) {
                                              txtBalance.text =
                                                  (int.parse(txtBalance.text) +
                                                          1)
                                                      .toString();
                                            } else
                                              txtBalance.text = 1.toString();
                                          },
                                          child: Container(
                                              child: Icon(
                                            Icons.add,
                                            size: mediaSize.width * .075,
                                          )),
                                        ),
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
                                    padding: EdgeInsets.all(0),
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
                                    child: new DropdownButton(
                                        isExpanded: true,
                                        value: myDropDownSelectedValue,
                                        items: myDropDownValues.keys.map((e) {
                                          return DropdownMenuItem(
                                            child: Text("\t\t" +
                                                myDropDownValues.values
                                                    .toList()[e]
                                                    .toString() +
                                                ""),
                                            value: e,
                                          );
                                        }).toList(),
                                        onChanged: (dropDownNewValue) {
                                          myDropDownSelectedValue =
                                              dropDownNewValue;
                                          callBackDropDown();
                                          txtGender.text =
                                              myDropDownValues.values.toList()[
                                                  myDropDownSelectedValue];
                                        }),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () async {
                    await makeSaleReceiptViewModel.performMakeOfSale(
                        stockId,
                        categoryId,
                        stockName,
                        txtOrderType.text,
                        txtOrderDate.text,
                        txtCustomerName.text,
                        txtCustomerLocation.text,
                        txtQuantity.text,
                        txtBalance.text,
                        txtAge.text,
                        txtGender.text);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: mediaSize.width * .125,
                    height: mediaSize.height * .075,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.receipt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
