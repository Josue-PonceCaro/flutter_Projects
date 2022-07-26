import 'package:flutter/material.dart';

class AuthFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKeyLogin = new GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegister = new GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRestorPass = new GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPhoneNumber = '';
  String userPassword = '';
  String userBirthday = '';
  String gender = '';
  int userGender = 0;
  bool isDark = false;
  bool _isLoading = false;
  bool _isCompleted = false;

  bool get isCompleted => _isCompleted;
  set isCompleted(bool value) {
    _isCompleted = value;
    notifyListeners();
  }
  
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidLogin(){
    return formKeyLogin.currentState?.validate() ?? false;
  }
  bool isValidRegister(){
    return formKeyRegister.currentState?.validate() ?? false;
  }
  bool isValidRestorPass(){
    return formKeyRestorPass.currentState?.validate() ?? false;
  }

}