import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static bool _userDarkMode = false;
  static int _userPreference = 1;
  static String _userName = '';
  static String _userPhoneNumber = '';
  static String _userEmail = '';
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

 

  static bool get isDarkMode {
    return _prefs.getBool('isDark') ?? _userDarkMode;
  }

  static set isDarkMode(bool value) {
    _userDarkMode = value;
    _prefs.setBool('isDark', value);
  }

  static int get userPrefer {
    return _prefs.getInt('preference') ?? _userPreference;
  }

  static set userPrefer(int value) {
    _userPreference = value;
    _prefs.setInt('preference', value);
  }
  static String get userName {
    return _prefs.getString('userName') ?? _userName;
  }

  static set userName(String value) {
    _userName = value;
    _prefs.setString('userName', value);
  }

  static String get phoneNumber {
    return _prefs.getString('phonoNumber') ?? _userPhoneNumber;
  }

  static set phoneNumber(String value) {
    _userPhoneNumber = value;
    _prefs.setString('phonoNumber', value);
  }

  static String get email {
    return _prefs.getString('email') ?? _userEmail;
  }

  static set email(String value) {
    _userEmail = value;
    _prefs.setString('email', value);
  }
}
