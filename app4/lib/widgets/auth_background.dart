import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final String welcomeText;
  final String descriptionText;
  const AuthBackground({Key? key, required this.child, required this.welcomeText, required this.descriptionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppTheme.white,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          
          Column(
            
            children: [
              const Divider(height: 100, color: AppTheme.white,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.bottomLeft,
                child:  Text(
                  welcomeText,
                  style: TextStyle(fontWeight: FontWeight.w900, color: AppTheme.black, fontSize: 35),
                  ),
              ),
              const Divider(height: 20, color: AppTheme.white,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.bottomLeft,
                child:  Text(
                  descriptionText,
                  style: TextStyle(fontWeight: FontWeight.w400, color: AppTheme.black, fontSize: 20),
                  ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
