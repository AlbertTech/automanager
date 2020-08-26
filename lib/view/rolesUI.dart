import 'package:flutter/material.dart';

class RolesUI {
  RolesUI(this.context, this.myLightBlueColor, this.myLightOrangeColor,
      this.myClipper_1, this.myClipper_2);

  final BuildContext context;
  final Color myLightBlueColor;
  final Color myLightOrangeColor;
  final CustomClipper myClipper_1;
  final CustomClipper myClipper_2;

  Widget getRolesUI() {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
      width: mediaSize.width,
      height: mediaSize.height,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: myLightBlueColor.withOpacity(0.5),
            ),
            clipper: myClipper_1,
          ),
          ClipPath(
            child: Container(
              color: myLightBlueColor.withOpacity(0.5),
            ),
            clipper: myClipper_2,
          ),
          Align(
            alignment: Alignment.bottomRight,
            widthFactor: .8,
            heightFactor: .9,
            child: Container(
                height: mediaSize.height * .2,
                width: mediaSize.width * .45,
                child: Image.asset(
                  'assets/images/image_view_roles.png',
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            width: mediaSize.width * .8,
            height: mediaSize.height * .9,
            margin: EdgeInsets.symmetric(
                vertical: mediaSize.height * .05,
                horizontal: mediaSize.width * .1),
            child: Column(
              children: <Widget>[
                Container(
                  width: mediaSize.width * .8,
                  height: mediaSize.height * .39,
                  decoration: BoxDecoration(
                      color: myLightOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: mediaSize.height * .05,
                          width: mediaSize.width * .8,
                          margin: EdgeInsets.only(
                            left: mediaSize.width * .025,
                            right: mediaSize.width * .025,
                            top: mediaSize.height * .015,
                          ),
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
                              labelText: "id, name, email, etc.",
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
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
                          maxHeight: mediaSize.height * .3,
                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: 10 + 1,
                            itemBuilder: (BuildContext ctx, int index) {
                              if (index == 0) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: mediaSize.width * .23,
                                      right: mediaSize.width * .02),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          width: mediaSize.width * .09,
                                          child: Center(
                                            child: Text(
                                              "id",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                      Container(
                                          width: mediaSize.width * .15,
                                          margin: EdgeInsets.only(
                                              left: mediaSize.width * .15),
                                          child: Center(
                                            child: Text(
                                              "name",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              } else {
                                index -= 1;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaSize.height * .02,
                                      left: mediaSize.width * .23,
                                      right: mediaSize.width * .02),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          width: mediaSize.width * .09,
                                          child: Center(
                                            child: Text(
                                              "id" + index.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                      Container(
                                          width: mediaSize.width * .15,
                                          margin: EdgeInsets.only(
                                              left: mediaSize.width * .15),
                                          child: Center(
                                            child: Text(
                                              "name",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              }
                            }),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: mediaSize.width * .8,
                  height: mediaSize.height * .19,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: mediaSize.width * .39,
                        height: mediaSize.height * .2,
                        decoration: BoxDecoration(
                            color: myLightOrangeColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      Spacer(),
                      Container(
                        width: mediaSize.width * .39,
                        height: mediaSize.height * .2,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: mediaSize.width * .4,
                                height: mediaSize.height * .055,
                                decoration: BoxDecoration(
                                    color: myLightOrangeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myLightOrangeColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myLightOrangeColor,
                                              width: 5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      filled: true,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Spacer(),
                            Container(
                                width: mediaSize.width * .4,
                                height: mediaSize.height * .055,
                                decoration: BoxDecoration(
                                    color: myLightOrangeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myLightOrangeColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myLightOrangeColor,
                                              width: 5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      filled: true,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Spacer(),
                            Container(
                                width: mediaSize.width * .4,
                                height: mediaSize.height * .055,
                                decoration: BoxDecoration(
                                    color: myLightOrangeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myLightOrangeColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myLightOrangeColor,
                                              width: 5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      filled: true,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: mediaSize.width * .8,
                  height: mediaSize.height * .29,
                  decoration: BoxDecoration(
                      color: myLightOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: mediaSize.width * .025,
                        right: mediaSize.width * .025,
                        top: mediaSize.height * .015,
                        bottom: mediaSize.height * .015),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    constraints: BoxConstraints(
                      maxWidth: mediaSize.width * .8,
                      maxHeight: mediaSize.height * .29,
                    ),
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: 10 + 1,
                        itemBuilder: (BuildContext ctx, int index) {
                          if (index == 0) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: mediaSize.width * .23,
                                  right: mediaSize.width * .02),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      width: mediaSize.width * .15,
                                      child: Center(
                                        child: Text(
                                          "capability",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      )),
                                  Container(
                                      width: mediaSize.width * .15,
                                      margin: EdgeInsets.only(
                                          left: mediaSize.width * .15),
                                      child: Center(
                                        child: Text(
                                          "allowed",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          } else {
                            index -= 1;
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: mediaSize.height * .025,
                                  left: mediaSize.width * .23,
                                  right: mediaSize.width * .02),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      width: mediaSize.width * .15,
                                      child: Center(
                                        child: Text(
                                          "hotdog malaki",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      )),
                                  Container(
                                      width: mediaSize.width * .15,
                                      margin: EdgeInsets.only(
                                          left: mediaSize.width * .15),
                                      child: Center(
                                        child: Text(
                                          "allowed",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          }
                        }),
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
