import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPref {
  static const String userLoggedKey = 'is_logged_in';

  Future<void> setLoggedIn(bool value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(userLoggedKey, value);
  }

  Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(userLoggedKey) ?? false;
  }
  Future<void>setLogout()async{    final pref = await SharedPreferences.getInstance();
    await pref.setBool(userLoggedKey, false);
  }
}
