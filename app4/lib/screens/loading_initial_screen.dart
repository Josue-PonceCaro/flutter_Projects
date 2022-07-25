import 'package:app4/screens/login_screen.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/screens/settings_screen.dart';
import 'package:app4/share_preferences/preferences.dart';
import 'package:flutter/material.dart';

class LoadingInitialScreen extends StatelessWidget {
  static const String pageRoute = 'InitialLoading';
  const LoadingInitialScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: 
      Preferences.firebaseToken != '' && Preferences.userEmail != '' ? 
      const LoadingScreen() : 
      // const SettingsScreen() : 
      const LoginScreen()
      );
    
  }
}