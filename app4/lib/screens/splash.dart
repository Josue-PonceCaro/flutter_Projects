import 'package:app4/screens/screens.dart';
import 'package:app4/screens/welcome_screen.dart';
import 'package:app4/share_preferences/preferences.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String pageRoute = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  
  State<SplashScreen> createState() => _SplashScreenState();

  
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
   _navigateToHome(); 
  }
  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () { });
    if (!Preferences.isFirstTime ) 
    {
      Navigator.pushReplacementNamed(context, LoadingInitialScreen.pageRoute);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WelcomeBackground(
            child: Container(),
            // child: Preferences.isFirstTime ? const _WelcomeButton() : Container(),
             )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Preferences.isFirstTime ? const _WelcomeButton() : Container(),
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