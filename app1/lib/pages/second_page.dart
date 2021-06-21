import 'package:flutter/material.dart';

class secPage extends StatelessWidget {
  // static const routeName = '/second';
  const secPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String arguments = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(arguments),
        // child: Text('coseeeeee'),
      ),
    );
  }
}

// class SecondPageArg {
//   String name;
//   String lastName;

//   SecondPageArg({this.name, this.lastName});
// }
