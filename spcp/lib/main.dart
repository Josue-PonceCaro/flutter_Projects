import 'package:flutter/material.dart';
import 'package:spcp/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPCP',
      theme: ThemeData(
        // primarySwatch: const MaterialColor(1, {1: Color.fromARGB(255, 26, 71, 138)}),
      ),
      home: const HomePage(),
      // initialRoute: HomePage.pageRoute,
      // routes: {
      //   HomePage.pageRoute:(context) => const HomePage(),
      // },
    );
  }
}

