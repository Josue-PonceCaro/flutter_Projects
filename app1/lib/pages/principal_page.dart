import 'package:flutter/material.dart';
import 'second_page.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator one'),
      ),
      body: Center(
        child: Container(
          child: TextButton(
            onPressed: () {
              _btn1(context);
            },
            child: Text(
              'NEX PAGE',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
                backgroundColor: Colors.red, padding: EdgeInsets.all(20)),
          ),
        ),
      ),
    );
  }

  void _btn1(BuildContext context) {
    Navigator.of(context).pushNamed('/second', arguments: "COSEeee");
    // arguments: SecondPageArg(name: "COSE", lastName: "chonche"));
    // Navigator.of(context).pushNamed('/second');
  }
}
