import 'package:automanager/models/makeSaleReceiptModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/utilities/errorTrapTool.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MakeSaleReceiptViewModel {
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  final MakeSaleReceiptModel makeSaleReceiptModel = new MakeSaleReceiptModel();
  final ErrorTrapTool errorTrapTool = new ErrorTrapTool();
  Future<void> performMakeOfSale(
      String myStockUid,
      String myCategoryStockUid,
      String myStockName,
      String myOrderType,
      String myOrderDate,
      String myCustomerName,
      String myCustomerLocation,
      String myCustomerQuantity,
      String myCustomerBalance,
      String myCustomerAge,
      String myCustomerGender) async {
    errorTrapTool.myEasyLoadingInit();
    errorTrapTool.showEasyLoading();
    sharedPrefUtil.getIsCurrentDatabaseId().then((currentDatabaseId) async {
      print("my stock id: "+myStockUid);
      await makeSaleReceiptModel
          .makeASaleReceipt(
              myStockUid,
              myCategoryStockUid,
              myStockName,
              myOrderType,
              myOrderDate,
              myCustomerName,
              myCustomerLocation,
              myCustomerQuantity,
              myCustomerBalance,
              myCustomerAge,
              myCustomerGender,
              currentDatabaseId)
          .then((isSuccessful) {
        errorTrapTool.dismissEasyLoading();
        if (isSuccessful == true) {
          print("done");
          EasyLoading.showInfo("Success");
        } else {
          print("error on make receipt: ");
          EasyLoading.showInfo("Failed");

        }
      });
    }).catchError((onError) {
      errorTrapTool.dismissEasyLoading();
      print("error on getting current database id: " + onError.toString());
    });
  }
}
