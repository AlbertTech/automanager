import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  final stringKey_1 = "myUserId";
  final stringKey_2 = "isLoggedIn";



  Future<void> setCurrentUser(String uid, bool isLogged) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(stringKey_1, uid);
    await prefs.setBool(stringKey_2, isLogged);
  }

  Future<void> clearValue() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<String> getCurrentUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get(stringKey_1);
  }

  Future<bool> getIsCurrentUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(stringKey_2);
  }
}
