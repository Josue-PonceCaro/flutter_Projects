import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String phoneNumber = '';
  String userName = '';
  String userEmail = '';
  String userPassWord = '';
  String userBirthday = '01-01-1900';
  String gender = 'Otros';
  bool _isLoading = false;
   // las variables no son reactivas, no dibujará los widgets cuando este cambie
  // Para que esto pase, se les define como privadas, y se definen getter y setters
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Este es el que actualiza los widgets de sus subscriptores
  }

  bool isValid() {
    print('$phoneNumber - $userName');
    print('$userEmail - $userPassWord');
    print('$userBirthday - $gender');
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  }
}
