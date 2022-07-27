import 'package:app4/blocs/blocs.dart';
import 'package:app4/screens/login_screen.dart';
import 'package:app4/screens/welcome_screen.dart';
import 'package:app4/services/services.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:app4/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// F2 << To replace a word for other
// Install Pubspec Assist << To make fastes installatios
// Ctrk + Mayus + p and click Pubspec Assist: Add/update dependencies << To add  new dependencies
// bloc, flutter_bloc, equatable << Write an enter to intall those three dependencies
// then install the bloc extension
// Adding changes from Mac
// <<<<<<< HEAD
//This is comment from mac
// void main() {
//   runApp(
//     MultiBlocProvider(providers: [
//       BlocProvider(create: ((context) => GpsBloc())),
//       BlocProvider(create: ((context) => LocationBloc())),
//       BlocProvider(create: ((context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)))),
      
      
//     ], 
//     child: const MapsApp())
//   );
// =======
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preferences.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: ((context) => GpsBloc())),
    BlocProvider(create: ((context) => LocationBloc())),
    BlocProvider(
        create: ((context) =>
            MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)))),
  ], child: const MapsApp()));
}

class MapsApp extends StatelessWidget {
  const MapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maps App',
        // initialRoute: WelcomeScreen.pageRoute,
        initialRoute: SplashScreen.pageRoute,
        
        // initialRoute: LoginScreen.pageRoute,
        // initialRoute: SettingsScreen.pageRoute,
        routes: {
          WelcomeScreen.pageRoute:(context) => const WelcomeScreen(),
          LoadingScreen.pageRoute: (context) => const LoadingScreen(),
          LoadingInitialScreen.pageRoute: (context) => const LoadingInitialScreen(),
          LoginScreen.pageRoute: (context) => const LoginScreen(),
          RegisterScreen.pageRoute: (context) => const RegisterScreen(),
          SettingsScreen.pageRoute:(context) => const SettingsScreen(),
          RestorePasswordScreen.pageRoute: (context) =>
              const RestorePasswordScreen(),

          Loginx.pageRoute:(context) => const Loginx(),
          Registerx.pageRoute:(context) => const Registerx(),
          SplashScreen.pageRoute:(context) => const SplashScreen(),
        },
        theme: AppTheme.lightThem,
      ),
      
    );
  }
}
