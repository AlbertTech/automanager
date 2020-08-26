import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SalesReportUI {
  SalesReportUI(this.context, this.myClipper, this.myLightOrangeColor,
      this.myDeepOrangeColor, this.myLightBlueColor);

  final BuildContext context;
  final CustomClipper myClipper;
  final Color myLightOrangeColor;
  final Color myDeepOrangeColor;
  final Color myLightBlueColor;

  Widget getSalesReportUI() {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
        width: mediaSize.width,
        height: mediaSize.height,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                color: myLightBlueColor,
              ),
              clipper: myClipper,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: mediaSize.height * .1,
                  horizontal: mediaSize.width * .1),
              constraints: BoxConstraints(
                  maxHeight: mediaSize.height * .8,
                  maxWidth: mediaSize.width * .8),
              child: Column(
                children: <Widget>[
                  Container(
                    height: mediaSize.height * .06,
                    width: mediaSize.width * .8,
                    child: GestureDetector(
                        onTap: () {},
                        child: new Container(
                            constraints: BoxConstraints(
                                maxWidth: mediaSize.width * .8,
                                maxHeight: mediaSize.height * .06),
                            decoration: BoxDecoration(
                                color: myDeepOrangeColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black54.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: Offset(3, 3))
                                ]),
                            child: Align(
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                'See important notes',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                maxFontSize: 25,
                                minFontSize: 18,
                                maxLines: 1,
                              ),
                            ))),
                  ),
                  Spacer(),
                  Container(
                    width: mediaSize.width * .8,
                    height: mediaSize.height * .25,
                    decoration: BoxDecoration(
                        color: myLightOrangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(12.5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(3, 3))
                        ]),
                    child: Container(
                        margin: EdgeInsets.all(12.5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.5)),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: mediaSize.width * .8,
                    height: mediaSize.height * .4,
                    decoration: BoxDecoration(
                        color: myLightOrangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(12.5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(3, 3))
                        ]),
                    child: Container(
                        margin: EdgeInsets.all(12.5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.5)),
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
