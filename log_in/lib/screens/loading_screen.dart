import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const String pageRoute = 'Loading';
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('LoadingScreen'),
      ),
    );
  }
}
