import 'package:flutter/material.dart';
import 'pages/page_1.dart';
import 'pages/page_2.dart';
import 'pages/page_3.dart';
import 'pages/page_4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: Page0());
  }
}

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Page1(),
        '/pg2': (context) => Page2(),
        '/pg3': (context) => Page3(),
        '/pg4': (context) => Page4(),
      },
    );
  }
}
