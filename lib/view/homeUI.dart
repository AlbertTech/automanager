import 'package:flutter/material.dart';

class HomeUI {
  HomeUI(this._listItem, this.myLightBlueColor, this.myColorLightOrange,
      this.myClipper_1, this.myClipper_2);

  final Color myLightBlueColor;
  final Color myColorLightOrange;
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
              width: mediaSize.width * .9,
              height: mediaSize.height * .9,
              margin: EdgeInsets.symmetric(
                  vertical: mediaSize.height * .05,
                  horizontal: mediaSize.width * .05),
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Text(
                    "My Database",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Expanded(
                    child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _listItem.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: mediaSize.width*.1,
                        decoration: BoxDecoration(
                          color: myColorLightOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          /*boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54.withOpacity(0.45),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(3.5, 4))
                              ]*/
                        ),
                        child: GridTile(
                            footer: Text(
                              'placeholder',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            child: Image.asset(
                              _listItem[index],
                              filterQuality: FilterQuality.high,
                            )),
                      );
                    },
                  ),),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
