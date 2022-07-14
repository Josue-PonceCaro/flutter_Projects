import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30, color: Colors.blue);
    int counter = 0;
    return Scaffold(
      // ignore: avoid_print
      appBar: AppBar(
        title: const Text('Sample Code'),
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children:  <Widget>[
            const Text(
              'All numbers',
              style: fontSize30,
            ),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counter++;
          print('$counter');
        },
      ),
    );
  }

  setState(Null Function() param0) {}
}
