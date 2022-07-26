import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String welcomeText;
  final String descriptionText;
  final double hightSize;
  final Color welcomeTextColor;
  final Color descriptionTextColor;
  const WelcomeText({
    Key? key,
    required this.welcomeText,
    required this.descriptionText, required this.hightSize, this.welcomeTextColor = AppTheme.darkBlue, this.descriptionTextColor = AppTheme.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          // padding: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.bottomLeft,
          child: Text(
            welcomeText,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: welcomeTextColor,
                fontSize: hightSize*0.045),
          ),
        ),
        SizedBox(height: hightSize*0.02,),
        Container(
          width: double.infinity,
          // padding: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.bottomLeft,
          child: Text(
            descriptionText,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color:  descriptionTextColor,
                fontSize: hightSize*0.025),
          ),
        ),
      ],
    );
  }
}

