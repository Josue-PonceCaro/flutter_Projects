import 'package:flutter/material.dart';
import 'package:app3/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal:20),
        children: const <Widget>[
          CustomCard1(),
          
        ],
      )
    );
  }
}

