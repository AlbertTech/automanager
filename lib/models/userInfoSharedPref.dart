import 'package:shared_preferences/shared_preferences.dart';

class UserInfoSharedPref {
  final stringKey_1 = "myUserId";
  final stringKey_2 = "isLoggedIn";
  final stringKey_3 = "myUserEmail";
  final stringKey_4 = "myUserName";
  final stringKey_5 = "myCurrentDatabaseId";
  final stringKey_6 = "myDatabaseList";
  final stringKey_7 = "myCurrentProfileId";
  final stringKey_8 = "myCurrentDatabaseName";
  List<String> myTemporaryListToMap = new List<String>();

  List<String> get myCurrentDatabaseName => null;

  Future<void> setCurrentUser(
      String uid,
      bool isLogged,
      String myCurrentDatabase,
      Map<String, dynamic> myDatabaseList,
      String myCurrentProfileId,
      String myCurrentDbName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(stringKey_1, uid);
    await prefs.setBool(stringKey_2, isLogged);
    await prefs.setString(stringKey_5, myCurrentDatabase);
    myDatabaseList.forEach((k, v) {
      myTemporaryListToMap.add(k + "." + v.toString());
    });
    await prefs.setStringList(stringKey_6, myTemporaryListToMap);
    await prefs.setString(stringKey_7, myCurrentProfileId);
    await prefs.setString(stringKey_8, myCurrentDbName);
    myTemporaryListToMap.clear();
  }

  Future<void> setCurrentDatabaseId(String myCurrentDatabaseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(stringKey_5, myCurrentDatabaseId);
  }

  Future<void> setCurrentDatabaseName(String myCurrentDatabaseName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(stringKey_8, myCurrentDatabaseName);
  }

  Future<void> updateCurrentDatabaseList(String myKey, String myValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await getMyDatabaseList().then((myDbList) async {
      myDbList.forEach((k, v) {
        myTemporaryListToMap.add(k + "." + v.toString());
      });
      myTemporaryListToMap.add(myKey + "." + myValue.toString());
      await prefs.setStringList(stringKey_6, myTemporaryListToMap);
    }).catchError((onError) {
      print("error on getting databaselist: " + onError.toString());
    });
  }

  Future<String> getCurrentUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get(stringKey_1);
  }

  Future<bool> getIsCurrentUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(stringKey_2);
  }

  Future<String> getIsCurrentDatabaseId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey_5);
  }

  Future<Map<String, dynamic>> getMyDatabaseList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> mapToReturn = new Map<String, String>();
    myTemporaryListToMap.clear();
    myTemporaryListToMap = prefs.getStringList(stringKey_6) ?? [];
    print("\n\n\n\n\n\n printing my map dlist now");
    myTemporaryListToMap.forEach((element) {
      List<String> entry = element.split('.');
      mapToReturn.addAll({entry[0]: entry[1]});
    });
    print("\nmap here: " +
        mapToReturn.keys.toString() +
        " " +
        mapToReturn.values.toString());
    return mapToReturn;
  }

  Future<String> getMyCurrentProfileId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey_7);
  }

  Future<String> getMyCurrentDbName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey_8);
  }

  Future<void> clearValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
