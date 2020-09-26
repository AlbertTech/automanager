import 'package:automanager/resources/myColors.dart';

import 'package:automanager/utilities/widgetForFab.dart';
import 'package:automanager/view/itemDisplayUI.dart';
import 'package:flutter/material.dart';

class ItemDisplayView extends StatefulWidget {
  @override
  _ItemDisplayViewState createState() => _ItemDisplayViewState();
}

class _ItemDisplayViewState extends State<ItemDisplayView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: ItemDisplayUI(
            context,
            MyColors().colorLightOrange,
            MyColors().colorDeepOrange,
            MyColors().colorLightdark,
          ).getItemDisplayUI(),
          floatingActionButton: WidgetForFab(
                  context, "ItemDisplayView", MyColors().colorDeepOrange)
              .getWidgetForFab(),
        ));
  }
}
