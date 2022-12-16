import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  static const firsttime = "firsttime";
  static const String city = "city";

  static Future<bool> isfirsttime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(firsttime) ?? true;
  }

  static Future<bool> setfirsttime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(firsttime, false);
  }

  static Future<String?> getcity() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(city);
  }

  static Future<void> setcity(String location) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(city, location);
  }
}
