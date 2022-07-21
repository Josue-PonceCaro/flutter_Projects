
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefer;
  static String _userName = '';
  static String _userBirthday = '01-01-1990';
  static int _userGender = 3;
  static String _userPassword = '';
  static String _userEmail = '';
  static int _userCiclistPeaton = 1;
  static int _userAirQualityPref = 50;
  static bool _isDark = false;
  static String _firebaseToken = '';

  static Future init() async{
    _prefer = await SharedPreferences.getInstance();
  }

  static String get firebaseToken {
    return _prefer.getString('firebaseToken') ?? _firebaseToken;
  }
  static set firebaseToken (String value) {
    _prefer.setString('firebaseToken', value);
    _firebaseToken = value;
  }

  static bool get isDark {
    return _prefer.getBool('isDark') ?? _isDark;
  }
  static set isDark (bool value) {
    _prefer.setBool('isDark', value);
    _isDark = value;
  }

  static int get userAirQualityPref {
    return _prefer.getInt('userAirQualityPref') ?? _userAirQualityPref;
  }
  static set userAirQualityPref (int value) {
    _prefer.setInt('userAirQualityPref', value);
    _userAirQualityPref = value;
  }

  static int get userCiclistPeaton {
    return _prefer.getInt('userCiclistPeaton') ?? _userCiclistPeaton;
  }
  static set userCiclistPeaton (int value) {
    _prefer.setInt('userCiclistPeaton', value);
    _userCiclistPeaton = value;
  }

  static String get userEmail {
    return _prefer.getString('userEmail') ?? _userEmail;
  }
  static set userEmail (String value) {
    _prefer.setString('userEmail', value);
    _userEmail = value;
  }


  static String get userPassword {
    return _prefer.getString('userPassword') ?? _userPassword;
  }
  static set userPassword (String value) {
    _prefer.setString('userPassword', value);
    _userPassword = value;
  }

  static int get userGender {
    return _prefer.getInt('userGender') ?? _userGender;
  }
  static set userGender (int value) {
    _prefer.setInt('userGender', value);
    _userGender = value;
  }

  static String get userBirthday {
    return _prefer.getString('userBirthday') ?? _userBirthday;
  }
  static set userBirthday (String value) {
    _prefer.setString('userBirthday', value);
    _userBirthday = value;
  }

  static String get userName {
    return _prefer.getString('userName') ?? _userName;
  }
  static set userName (String value) {
    _prefer.setString('userName', value);
    _userName = value;
  }

}