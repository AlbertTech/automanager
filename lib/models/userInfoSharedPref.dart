import 'package:shared_preferences/shared_preferences.dart';

class UserInfoSharedPref {
  final stringKey_1 = "myUserId";
  final stringKey_2 = "isLoggedIn";
  final stringKey_3 = "myUserEmail";
  final stringKey_4 = "myUserName";
  final stringKey_5 = "myCurrentDatabase";
  final stringKey_6 = "myDatabaseList";
  final stringKey_7 = "myCurrentProfileId";
  final stringKey_8 = "myCurrentDatabaseName";
  Future<void> setCurrentUser(
      String uid,
      bool isLogged,
      String myCurrentDatabase,
      List<String> myDatabaseList,
      String myCurrentProfileId,
      String myCurrentDbName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(stringKey_1, uid);
    await prefs.setBool(stringKey_2, isLogged);
    await prefs.setString(stringKey_5, myCurrentDatabase);
    await prefs.setStringList(stringKey_6, myDatabaseList);
    await prefs.setString(stringKey_7, myCurrentProfileId);
    await prefs.setString(stringKey_8, myCurrentDbName);
  }

  Future<void> updateCurrentDatabaseId(String myCurrentDatabaseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(stringKey_5, myCurrentDatabaseId);
  }
  Future<void> updateCurrentDatabaseName(String myCurrentDatabaseName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(stringKey_8, myCurrentDatabaseName);
  }

  Future<void> clearValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<String> getCurrentUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get(stringKey_1);
  }

  Future<bool> getIsCurrentUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(stringKey_2);
  }

  Future<String> getIsCurrentDatabase() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey_5);
  }

  Future<List<String>> getMyDatabaseList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(stringKey_6);
  }

  Future<String> getMyCurrentProfileId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey_7);
  }
  Future<String> getMyCurrentDbName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey_8);
  }
}
