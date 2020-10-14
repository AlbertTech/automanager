import 'package:automanager/models/makeSaleReceiptModel.dart';
import 'package:automanager/models/sharedPrefUtil.dart';

class MakeSaleReceiptViewModel {
  final SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();
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
            myCustomerGender)
        .then((isSuccessful) {
      if (isSuccessful == true) {
      } else {}
    });
  }
}
