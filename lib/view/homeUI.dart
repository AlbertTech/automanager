import 'package:flutter/material.dart';

class HomeUI {
  HomeUI(this._listItem, this.myLightBlueColor, this.myClipper_1,
      this.myClipper_2);

  final Color myLightBlueColor;
  final CustomClipper myClipper_1;
  final CustomClipper myClipper_2;
  final List<String> _listItem;

  Widget getHomeUI() {
    return Builder(builder: (BuildContext context) {
      final mediaSize = MediaQuery.of(context).size;
      return Container(
        width: mediaSize.width,
        height: mediaSize.height,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            //Clippers
            /*
            ClipPath(
              child: Container(
                color: myLightBlueColor.withOpacity(.8),
              ),
              clipper: myClipper_1,
            ),
            ClipPath(
              child: Container(
                color: myLightBlueColor.withOpacity(.8),
              ),
              clipper: myClipper_2,
            ),*/
            Container(
              width: mediaSize.width * .8,
              height: mediaSize.height * .9,
              margin: EdgeInsets.symmetric(
                  vertical: mediaSize.height * .05,
                  horizontal: mediaSize.width * .1),
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Text("My Database"),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(10),
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: _listItem
                          .map((item) => Container(
                              color: Colors.orange,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Image.asset(
                                    item,
                                    fit: BoxFit.fill,
                                  )),
                                  Text("dsa")
                                ],
                              )))
                          .toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
