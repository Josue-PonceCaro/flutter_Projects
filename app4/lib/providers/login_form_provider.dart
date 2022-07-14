import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String userEmail = '';
  String userPassWord = '';
  bool _isLoading =
      false; // las variables no son reactivas, no dibujará los widgets cuando este cambie
  // Para que esto pase, se les define como privadas, y se definen getter y setters
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Este es el que actualiza los widgets de sus subscriptores
    
  }

  bool isValid() {
    print('$userEmail - $userPassWord');
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  }
}
