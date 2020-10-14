import 'file:///D:/Programming/Flutter_Projects/automanager/lib/utilities/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/shadowClipper.dart';
import 'package:automanager/utilities/widgetForFab.dart';
import 'package:automanager/view/makeSaleUI.dart';
import 'package:automanager/view_models/makeSaleViewModel.dart';
import 'package:flutter/material.dart';

class MakeSaleView extends StatefulWidget {
  @override
  _MakeSaleViewState createState() => _MakeSaleViewState();
}

class _MakeSaleViewState extends State<MakeSaleView> {
  MakeSaleUI makeSaleUI;

  MakeSaleViewModel makeSaleViewModel;

  MyColors myColors;
  Widget myClippedPathWithShadow;
  TextEditingController mySearchBar;
  Map<String, String> mySuggestions;
  List<String> myNewSuggestion;
  List<String> mySelectedItemValues;
  FocusNode myFocus;
  bool isRefreshed;

  @override
  void initState() {
    makeSaleViewModel = new MakeSaleViewModel();
    myNewSuggestion = new List();
    mySelectedItemValues = new List();
    myFocus = new FocusNode();
    myColors = new MyColors();
    myClippedPathWithShadow = new ClipPathWithShadow(
            MyClippers("MakeSaleView"), MyColors().colorLightOrange, 8, 0, 0)
        .getWidget();
    mySearchBar = new TextEditingController();
    mySuggestions = new Map();
    makeSaleUI = new MakeSaleUI(
        this.context,
        this.updateMyMaps,
        this.updateMySelectedItem,
        this.makeSaleViewModel,
        this.myClippedPathWithShadow,
        this.myColors.colorLightOrange,
        this.myColors.colorLightdark,
        this.mySearchBar,
        this.mySuggestions,
        this.myNewSuggestion,
        this.mySelectedItemValues,
        this.myFocus,
        this.isRefreshed);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void updateMyMaps(Map thisMap, Map newMap, List myNewSuggestions) {
    setState(() {
      thisMap.addAll(newMap);
      myNewSuggestions.addAll(newMap.values.toList());
    });
  }

  void updateMySelectedItem(
      List<String> myViewingList, List<String> myUpdatedList) {
    setState(() {
      myViewingList.addAll(myUpdatedList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: makeSaleUI.getMakeSaleUI(),
          floatingActionButton:
              WidgetForFab(context, "MakeSaleView", MyColors().colorDeepOrange)
                  .getWidgetForFab(mySelectedItemValues),
        ));
  }
}
