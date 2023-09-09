import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  late SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<dynamic> setData(String key, dynamic value) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
    }
  }

  String? getStringData(String key) {
    return sharedPreferences.getString(key);
  }

  bool? getBoolData(String key) {
    return sharedPreferences.getBool(key);
  }

  int? getIntData(String key) {
    return sharedPreferences.getInt(key);
  }

  Future clear() async{
    return await sharedPreferences.clear();
  }
}
