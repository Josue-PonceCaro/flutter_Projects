import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingsingleton/blocs/fruit/fruit_bloc.dart';
import 'package:testingsingleton/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrapping the whole app with BlocProvider to get access to FruitBloc everywhere
    // BlocProvider extends InheritedWidget.
    return BlocProvider(
      bloc: FruitBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.redAccent,
        ),
        home: HomePage(),
      ),
    );
  }
}