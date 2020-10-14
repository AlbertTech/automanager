import 'package:automanager/models/sharedPrefUtil.dart';
import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:automanager/resources/mySalesTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MakeSaleReceiptModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  final MySalesTags mySalesTags = new MySalesTags();
  final SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();

  bool isSuccessful;

  Future<bool> makeASaleReceipt(
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
    await sharedPrefUtil
        .getIsCurrentUserLoggedIn()
        .then((isCurrentUserLoggedIn) async {
      if (isCurrentUserLoggedIn == true) {
        await sharedPrefUtil.getCurrentUserId().then((myUid) async {
          if (myUid != null && myUid.isNotEmpty) {
            isSuccessful = true;
            await firebaseFirestore
                .collection("" +
                    myDatabaseTags.allDatabaseTag +
                    "/J82BQucjHo0amaOm5Waz/" +
                    myDatabaseTags.myDatabaseInventoryTag +
                    "/" +
                    myCategoryStockUid +
                    "/" +
                    myDatabaseTags.myDatabaseCategoryMerchandiseTag +
                    "")
                .doc(myStockUid)
                .get()
                .then((myDocumentValue) async {
              if (myDocumentValue.get("Quantity") > 0) {
                await firebaseFirestore
                    .collection("" +
                        myDatabaseTags.allDatabaseTag +
                        "/J82BQucjHo0amaOm5Waz/" +
                        myDatabaseTags.myDatabaseInventoryTag +
                        "/" +
                        myCategoryStockUid +
                        "/" +
                        myDatabaseTags.myDatabaseCategoryMerchandiseTag +
                        "")
                    .doc(myStockUid)
                    .update({
                  myDatabaseTags.myStockQuantityTag:
                      FieldValue.increment(-int.parse(myCustomerQuantity))
                }).then((value) async {
                  await firebaseFirestore
                      .collection("/" +
                          myDatabaseTags.allDatabaseTag +
                          "/J82BQucjHo0amaOm5Waz/" +
                          mySalesTags.allSalesTag +
                          "")
                      .add({
                    mySalesTags.salesStockUid: myStockUid,
                    mySalesTags.salesStockName: myStockName,
                    mySalesTags.salesOrderDateTag: myOrderDate,
                    mySalesTags.salesOrderTypeTag: myOrderType,
                    mySalesTags.salesCustomerNameTag: myCustomerName,
                    mySalesTags.salesCustomerLocationTag: myCustomerLocation,
                    mySalesTags.salesQuantityTag: myCustomerQuantity,
                    mySalesTags.salesBalanceTag: myCustomerBalance,
                    mySalesTags.salesAgeTag: myCustomerAge,
                    mySalesTags.salesGenderTag: myCustomerGender
                  }).then((value) {
                    isSuccessful = true;
                    print("receipt made");
                  }).catchError((onError) {
                    print("adding sale: " + onError.toString());
                    isSuccessful = false;
                  });
                }).catchError((onError) {
                  print(
                      "error on decrementing quantity: " + onError.toString());
                  isSuccessful = false;
                });
              } else {
                isSuccessful = false;
              }
            }).catchError((onError) {
              print("error on getting selected item: " + onError.toString());
              isSuccessful = false;
            });
          } else {
            isSuccessful = false;
          }
        }).catchError((onError) {
          print("error on shared pref uid: " + onError.toString());
          isSuccessful = false;
        });
      } else {
        isSuccessful = false;
      }
    }).catchError((onError) {
      print("error on shared pref is logged in: " + onError.toString());
      isSuccessful = false;
    });
    return isSuccessful;
  }
}
