import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario Rastrero'),
      ),
      body: GestureDetector(
        onTap: () {
          print('object');
        },
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Text('Qaira is working in this app'),
              SizedBox(
                height: 40,
              ),
              Text('VALIDATION HISTORY'),
            ],
          ),
        ),
      ),
    );
  }
}
