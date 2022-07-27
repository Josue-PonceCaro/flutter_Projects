import 'package:app4/screens/screens.dart';
import 'package:app4/share_preferences/preferences.dart';
import 'package:app4/themes/themes.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String pageRoute = 'Welcome'; 
  const WelcomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const[
          WelcomeBackground(
            child: _WelcomeButton(),
          ),
        ],
      ),
    );
  }
}

class _WelcomeButton extends StatelessWidget {
  const _WelcomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.bottomCenter,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, LoadingInitialScreen.pageRoute);
         },
        color: AppTheme.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
          child: const Text(
            'Empecemos',
            style: TextStyle(
              color: AppTheme.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}