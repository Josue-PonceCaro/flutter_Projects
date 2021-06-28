import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

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
              Text('VALIDATIONS'),
            ],
          ),
        ),
      ),
    );
  }
}
