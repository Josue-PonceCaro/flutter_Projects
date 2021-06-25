import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: GestureDetector(
        onTap: () {
          print('object');
        },
        child: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
