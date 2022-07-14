import 'package:flutter/material.dart';

class GpsAccessScreen extends StatelessWidget {
  static const String pageRoute = 'GpsAccess';
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('GpsAccessScreen'),
      ),
    );
  }
}
