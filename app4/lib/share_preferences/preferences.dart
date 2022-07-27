import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefer;
  static String _userName = '';
  static String _userBirthday = '';
  static int _userGender = 0;
  static String _userPassword = '';
  static String _userEmail = '';
  static String _userPhoneNumber = '';
  static int _userCiclistPeaton = 1;
  static int _userAirQualityPref = 50;
  static bool _isDark = false;
  static bool _isEmailVerified = false;
  static String _firebaseToken = '';
  static bool _isFirstTime = true;
  static bool _areTermsAccepted = false;
  static bool _willRemenberData = false;

  static void cleanPreferences() {
    userName = '';
    userBirthday = '';
    userGender = 0;
    userPassword = '';
    userEmail = '';
    userPhoneNumber = '';
    userCiclistPeaton = 1;
    userAirQualityPref = 50;
    isDark = false;
    isEmailVerified = false;
    firebaseToken = '';
    // isFirstTime = true; // TODO: analize this condition
    areTermsAccepted = false;
    willRemenberData = false;
  }

  static bool get areTermsAccepted {
    return _prefer.getBool('areTermsAccepted') ?? _areTermsAccepted;
  }

  static set areTermsAccepted(bool value) {
    _prefer.setBool('areTermsAccepted', value);
    _areTermsAccepted = value;
  }

  static bool get isFirstTime {
    return _prefer.getBool('isFirstTime') ?? _isFirstTime;
  }

  static set isFirstTime(bool value) {
    _prefer.setBool('isFirstTime', value);
    _isFirstTime = value;
  }

  static bool get willRemenberData {
    return _prefer.getBool('willRemenberData') ?? _willRemenberData;
  }

  static set willRemenberData(bool value) {
    _prefer.setBool('willRemenberData', value);
    _willRemenberData = value;
  }

  static int getGenderNumber(String genderString) {
    genderString.toLowerCase();
    if (genderString == 'masculino') {
      return 1;
    } else if (genderString == 'femenino') {
      return 2;
    } else if (genderString == 'otros') {
      return 3;
    }
    return 0;
  }

  static String getGenderString() {
    if (_userGender == 1) {
      return 'masculino';
    } else if (_userGender == 2) {
      return 'femenino';
    } else if (_userGender == 3) {
      return 'otros';
    }
    return '';
  }

  static String getGenderStringPassingValue(int gender) {
    if (gender == 1) {
      return 'masculino';
    } else if (gender == 2) {
      return 'femenino';
    } else if (gender == 3) {
      return 'otros';
    }
    return '';
  }

  static Future init() async {
    _prefer = await SharedPreferences.getInstance();
  }

  static String get firebaseToken {
    return _prefer.getString('firebaseToken') ?? _firebaseToken;
  }

  static set firebaseToken(String value) {
    _prefer.setString('firebaseToken', value);
    _firebaseToken = value;
  }

  static bool get isEmailVerified {
    return _prefer.getBool('isEmailVerified') ?? _isEmailVerified;
  }

  static set isEmailVerified(bool value) {
    _prefer.setBool('isEmailVerified', value);
    _isEmailVerified = value;
  }

  static bool get isDark {
    return _prefer.getBool('isDark') ?? _isDark;
  }

  static set isDark(bool value) {
    _prefer.setBool('isDark', value);
    _isDark = value;
  }

  static int get userAirQualityPref {
    return _prefer.getInt('userAirQualityPref') ?? _userAirQualityPref;
  }

  static set userAirQualityPref(int value) {
    _prefer.setInt('userAirQualityPref', value);
    _userAirQualityPref = value;
  }

  static int get userCiclistPeaton {
    return _prefer.getInt('userCiclistPeaton') ?? _userCiclistPeaton;
  }

  static set userCiclistPeaton(int value) {
    _prefer.setInt('userCiclistPeaton', value);
    _userCiclistPeaton = value;
  }

  static String get userEmail {
    return _prefer.getString('userEmail') ?? _userEmail;
  }

  static set userEmail(String value) {
    _prefer.setString('userEmail', value);
    _userEmail = value;
  }

  static String get userPhoneNumber {
    return _prefer.getString('userPhoneNumber') ?? _userPhoneNumber;
  }

  static set userPhoneNumber(String value) {
    _prefer.setString('userPhoneNumber', value);
    _userPhoneNumber = value;
  }

  static String get userPassword {
    return _prefer.getString('userPassword') ?? _userPassword;
  }

  static set userPassword(String value) {
    _prefer.setString('userPassword', value);
    _userPassword = value;
  }

  static int get userGender {
    return _prefer.getInt('userGender') ?? _userGender;
  }

  static set userGender(int value) {
    _prefer.setInt('userGender', value);
    _userGender = value;
  }

  static String get userBirthday {
    return _prefer.getString('userBirthday') ?? _userBirthday;
  }

  static set userBirthday(String value) {
    _prefer.setString('userBirthday', value);
    _userBirthday = value;
  }

  static String get userName {
    return _prefer.getString('userName') ?? _userName;
  }

  static set userName(String value) {
    _prefer.setString('userName', value);
    _userName = value;
  }
}
