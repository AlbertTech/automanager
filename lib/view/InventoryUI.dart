import 'package:flutter/material.dart';

class InventoryUI {
  InventoryUI(this.context, this.myLightOrangeColor, this.myLightBlueColor);

  final BuildContext context;
  final Color myLightOrangeColor;
  final Color myLightBlueColor;

  Widget getInventoryUI() {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
      width: mediaSize.width,
      height: mediaSize.height,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            width: mediaSize.width * .8,
            height: mediaSize.height * .9,
            margin: EdgeInsets.symmetric(
                vertical: mediaSize.height * .05,
                horizontal: mediaSize.width * .1),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                //Top
                Container(
                  width: mediaSize.width * .8,
                  height: mediaSize.height * .33,
                  decoration: BoxDecoration(
                      color: myLightOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54.withOpacity(0.45),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(3.5, 4))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: mediaSize.height * .06,
                          width: mediaSize.width * .8,
                          margin: EdgeInsets.only(
                              left: mediaSize.width * .025,
                              right: mediaSize.width * .025,
                              top: mediaSize.height * .015),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black54,
                                ),
                                labelText: "Category"),
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          left: mediaSize.width * .025,
                          right: mediaSize.width * .025,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: mediaSize.width * .8,
                          maxHeight: mediaSize.height * .2,
                        ),
                        child: GridView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15),
                            itemBuilder: (BuildContext ctx, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))),
                              );
                            }),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Spacer(),
                //Bottom
                Container(
                  width: mediaSize.width * .8,
                  height: mediaSize.height * .52,
                  decoration: BoxDecoration(
                      color: myLightOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54.withOpacity(0.45),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(3.5, 4))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: mediaSize.height * .06,
                          width: mediaSize.width * .8,
                          margin: EdgeInsets.only(
                            left: mediaSize.width * .025,
                            right: mediaSize.width * .025,
                            top: mediaSize.height * .015,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black54,
                                ),
                                labelText: "merchandise"),
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          left: mediaSize.width * .025,
                          right: mediaSize.width * .025,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        constraints: BoxConstraints(
                          maxWidth: mediaSize.width * .8,
                          maxHeight: mediaSize.height * .415,
                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: 10 + 1,
                            itemBuilder: (BuildContext ctx, int index) {
                              if (index == 0) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: mediaSize.width * .1,
                                      right: mediaSize.width * .02),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          width: mediaSize.width * .09,
                                          child: Center(
                                            child: Text(
                                              "name",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                      Container(
                                          width: mediaSize.width * .15,
                                          margin: EdgeInsets.only(
                                              left: mediaSize.width * .1),
                                          child: Center(
                                            child: Text(
                                              "Category",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                      Container(
                                        width: mediaSize.width * .13,
                                        margin: EdgeInsets.only(
                                            left: mediaSize.width * .03),
                                        child: Center(
                                            child: Text(
                                          "quantity",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )),
                                      ),
                                      Container(
                                        width: mediaSize.width * .1,
                                        margin: EdgeInsets.only(
                                            left: mediaSize.width * .03),
                                        child: Center(
                                            child: Text(
                                          "price",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                index -= 1;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaSize.height * .015,
                                      left: mediaSize.width * .1,
                                      right: mediaSize.width * .02),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          width: mediaSize.width * .09,
                                          child: Center(
                                            child: Text(
                                              "name",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                      Container(
                                          width: mediaSize.width * .15,
                                          margin: EdgeInsets.only(
                                              left: mediaSize.width * .1),
                                          child: Center(
                                            child: Text(
                                              "n00b" + index.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                      Container(
                                        width: mediaSize.width * .13,
                                        margin: EdgeInsets.only(
                                            left: mediaSize.width * .03),
                                        child: Center(
                                            child: Text(
                                          index.toString() + "000",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )),
                                      ),
                                      Container(
                                          width: mediaSize.width * .1,
                                          margin: EdgeInsets.only(
                                              left: mediaSize.width * .03),
                                          child: Center(
                                            child: Text(
                                              "" + index.toString() + "000",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              }
                            }),
                      ),
                      Spacer()
                    ],
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
