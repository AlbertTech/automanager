import 'package:automanager/models/makeSaleReceiptModel.dart';
import 'package:automanager/models/userInfoSharedPref.dart';

class MakeSaleReceiptViewModel {
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();
  final MakeSaleReceiptModel makeSaleReceiptModel = new MakeSaleReceiptModel();

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
    sharedPrefUtil.getIsCurrentDatabase().then((currentDatabaseId) async {
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
        if (isSuccessful == true) {
        } else {
          print("error on make receipt: ");
        }
      });
    }).catchError((onError) {
      print("error on getting current database id: " + onError.toString());
    });
  }
}
