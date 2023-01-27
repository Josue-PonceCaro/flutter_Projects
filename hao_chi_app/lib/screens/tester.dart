import 'package:flutter/material.dart';
import 'package:hao_chi_app/screens/example_page.dart';
import 'package:hao_chi_app/screens/resume_route_page.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ExamplePage(),
        '/resume-route': (context) => const ResumeRoutePage(),
      },
    );
  }
}


