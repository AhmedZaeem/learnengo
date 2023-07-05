import 'package:learnengo/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedController {
  CachedController._();
  static CachedController cache = CachedController._();
  factory CachedController() => cache;
  late SharedPreferences preferences;
  Future<void> initCache() async {
    preferences = await SharedPreferences.getInstance();
  }

  dynamic getData(sharedPrefrencesKeys key) {
    return preferences.get(key.name);
  }

  void setData(sharedPrefrencesKeys key, dynamic data) {
    if (data is String) {
      preferences.setString(key.name, data);
    } else if (data is bool) {
      preferences.setBool(key.name, data);
    } else if (data is int) {
      preferences.setInt(key.name, data);
    } else if (data is double) {
      preferences.setDouble(key.name, data);
    }
  }
}
