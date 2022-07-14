import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Power Ranger',
    'Super Smash'
  ];

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Listview'),
        ),
        body: ListView(
          children: [
            ...options.map((val) => ListTile(title: Text(val),
            trailing: const Icon(Icons.arrow_forward_ios),)).toList()],
        ));
  }
}
//...........


