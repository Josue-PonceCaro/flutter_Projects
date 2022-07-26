import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';


class BrandingQaira extends StatelessWidget {
  final double width;
  const BrandingQaira({
    Key? key, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '© Desarrollado por ',
          style: TextStyle(
            color: AppTheme.gray50,
            fontSize: width*0.025
          ),
          ),
        Image.asset(
          'assets/logos/logoQaira.jpg',
          width: width*0.1,
          // height: width*0.05,
        )
      ],
    );
  }
}
