import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreferences {
  static const pref_key = "prefernces";

  setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(pref_key, value);
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(pref_key) ?? false;
  }
}
