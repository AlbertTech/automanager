import 'package:automanager/view/homeView.dart';
import 'package:automanager/view/makeSaleReceiptView.dart';
import 'package:flutter/material.dart';

class WidgetForFab {
  WidgetForFab(this.context, this.viewState, this.myColorForFab);

  final BuildContext context;
  final String viewState;
  final Color myColorForFab;

  getWidgetForFab() {
    final Size mediaSize = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          switch (viewState) {
            case "MakeSaleView":
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MakeSaleReceiptView()));
              break;

            case "MakeSaleReceiptView":
              print("do databsae action -saleviewreceipt");
              Navigator.pop(context);
              Navigator.pop(context);
              break;

            case "AddStockView":
              print("do databsae action -addstock");
              break;

            default:
              break;
          }
        },
        child: Container(
          width: mediaSize.width * .125,
          height: mediaSize.height * .075,
          decoration: BoxDecoration(
            color: myColorForFab,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
            child: iconChangerForFab(),
          ),
        ));
  }

  Icon iconChangerForFab() {
    final Color myIconColor = Colors.white;
    IconData myIcons = Icons.error;
    switch (viewState) {
      case "ItemDisplayView":
        myIcons = Icons.save;
        break;
      case "AddStockView":
        myIcons = Icons.add;
        break;
      case "MakeSaleView":
        myIcons = Icons.navigate_next;
        break;
      case "MakeSaleReceiptView":
        myIcons = Icons.receipt;
        break;
      default:
        myIcons = Icons.error;
        break;
    }
    return Icon(
      myIcons,
      color: myIconColor,
    );
  }
}
