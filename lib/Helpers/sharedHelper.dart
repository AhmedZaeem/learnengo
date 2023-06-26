import 'package:shared_preferences/shared_preferences.dart';

mixin sharedHelper {
  dynamic sharedPref(String key,
      {String type = 'string', String operation = 'get', dynamic data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    type = type.toLowerCase();
    operation = operation.toLowerCase();
    if (operation == 'set') {
      if (type == 'string') {
        preferences.setString(key, data);
      } else if (type == 'bool') {
        preferences.setBool(key, data);
      } else if (type == 'double') {
        preferences.setDouble(key, data);
      } else if (type == 'int') {
        preferences.setInt(key, data);
      } else if (type == 'list') {
        preferences.setStringList(key, data);
      }
    }
    if (operation == 'get') {
      if (type == 'string') {
        return preferences.getString(key);
      } else if (type == 'bool') {
        return preferences.getBool(key);
      } else if (type == 'double') {
        return preferences.getDouble(key);
      } else if (type == 'int') {
        return preferences.getInt(key);
      } else if (type == 'list') {
        return preferences.getStringList(key);
      }
    }
  }
}
