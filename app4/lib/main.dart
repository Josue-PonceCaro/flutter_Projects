import 'package:app4/blocs/blocs.dart';
import 'package:app4/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:app4/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// F2 << To replace a word for other
// Install Pubspec Assist << To make fastes installatios
// Ctrk + Mayus + p and click Pubspec Assist: Add/update dependencies << To add  new dependencies
// bloc, flutter_bloc, equatable << Write an enter to intall those three dependencies 
// then install the bloc extension
void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: ((context) => GpsBloc())),
      BlocProvider(create: ((context) => LocationBloc())),
      BlocProvider(create: ((context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)))),
    ], 
    child: const MapsApp())
  );
}

class MapsApp extends StatelessWidget {
  const MapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps App',
      initialRoute: LoginScreen.pageRoute,
      routes: {

        LoadingScreen.pageRoute:(context) => const LoadingScreen(),
        LoginScreen.pageRoute:(context) => const LoginScreen(),
        RegisterScreen.pageRoute:(context) => const RegisterScreen(),
        RestorePasswordScreen.pageRoute:(context) => const RestorePasswordScreen(),



      },
    );
  }
}
