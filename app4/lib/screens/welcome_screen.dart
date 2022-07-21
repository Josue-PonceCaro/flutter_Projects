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
          WelcomeBackground(),
        ],
      ),
    );
  }
}