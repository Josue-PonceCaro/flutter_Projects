import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  static const String pageRoute = 'Map';
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MapScreen'),
      ),
    );
  }
}
