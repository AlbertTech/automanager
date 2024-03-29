import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:automanager/resources/mySalesTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MakeSaleReceiptModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  final MySalesTags mySalesTags = new MySalesTags();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();

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
      String myCustomerGender,
      String currentDatabaseId) async {
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
                    "/" +
                    currentDatabaseId +
                    "/" +
                    myDatabaseTags.myDatabaseInventoryTag +
                    "")
                .doc(myStockUid)
                .get()
                .then((myDocumentValue) async {
              if (myDocumentValue.get("Quantity") > 0) {
                await firebaseFirestore
                    .collection("" +
                        myDatabaseTags.allDatabaseTag +
                        "/" +
                        currentDatabaseId +
                        "/" +
                        myDatabaseTags.myDatabaseInventoryTag +
                        "")
                    .doc(myStockUid)
                    .update({
                  myDatabaseTags.myStockQuantityTag:
                      FieldValue.increment(-int.parse(myCustomerQuantity)),
                }).then((value) async
                {
                  await firebaseFirestore
                      .collection("/" +
                          myDatabaseTags.allDatabaseTag +
                          "/" +
                          currentDatabaseId +
                          "/" +
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
                    mySalesTags.salesBalanceTag: double.parse(myCustomerBalance),
                    mySalesTags.salesChangeTag:
                        (double.parse(myCustomerBalance) -
                            double.parse(myDocumentValue
                                .get(myDatabaseTags.myStockPriceTag).toString())),
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
