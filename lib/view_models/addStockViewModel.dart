import 'package:automanager/models/addStockModel.dart';
import 'package:automanager/models/sharedPrefUtil.dart';
import 'package:automanager/utilities/textValidatorUtility.dart';

class AddStockViewModel {
  AddStockModel addStockModel = new AddStockModel();
  SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();
  TextValidatorUtility textValidatorUtility = new TextValidatorUtility();
  List<String> mySuggestionCategory = new List();
  bool isUpdated = false;

  Future<void> updateMyCategorySuggestions(stockCategory) async {
    await addStockModel.findMyCategories(stockCategory).then((value) {
      mySuggestionCategory.addAll(addStockModel.myCategories.values.toList());
      isUpdated = true;
    });
  }

  Future<void> addStock(
      String stockName,
      stockCategory,
      stockQuantity,
      stockPriceEach,
      stockDateOrder,
      stockDateArrival,
      stockDistributor,
      Map myMapDesc) async {
    await textValidatorUtility.checkIfAllTextNotEmptyAndNotNull([
      stockName,
      stockCategory,
      stockQuantity,
      stockPriceEach,
    ]).then((value) async {
      if (value == true) {
        print("====checked all text is not empty=======");
        await textValidatorUtility.checkAllNumberNotEmpty([
          int.parse(stockQuantity),
          int.parse(stockPriceEach),
        ]).then((value) async {
          print("====checked all numbers is > 0=======");
          await sharedPrefUtil
              .getIsCurrentUserLoggedIn()
              .then((currentUserLoggedIn) async {
            print("====checked sharedpref isUserLoggedIn=======");
            if (currentUserLoggedIn == true) {
              print("====checked current user is logged in=======");
              await sharedPrefUtil
                  .getCurrentUserId()
                  .then((sharedPrefUtilUid) async {
                print("====checked sharedPref getUserId=======");
                await addStockModel
                    .addStock(
                        sharedPrefUtilUid,
                        stockName,
                        stockCategory,
                        int.parse(stockQuantity),
                        int.parse(stockPriceEach),
                        stockDateOrder,
                        stockDateArrival,
                        stockDistributor,
                        myMapDesc)
                    .catchError((onError) {
                  print(
                      "my user id error with fireauth: " + onError.toString());
                });
              }).catchError((onError) {
                print("error on getting userId shared pref: " +
                    onError.toString());
              });
            } else {
              print("====> no userLoggedIn");
            }
          }).catchError((onError) {
            print("error on getting isCurrentUserLoggedIn: " +
                onError.toString());
          });
        }).catchError((onError) {
          print("error on checking my numbers: " + onError.toString());
        });
      } else {
        print("all variables not inputted");
      }
    });
  }
}
