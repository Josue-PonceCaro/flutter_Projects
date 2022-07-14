import 'package:flutter/material.dart';
import 'package:log_in/providers/theme_providers.dart';
import 'package:log_in/screens/screens.dart';
import 'package:log_in/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

// 3 changes on the yaml file: assets, shared_preferences, provider
// https://pub.dev/packages/shared_preferences/install  << Will use this package
// https://pub.dev/packages/provider/install
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkMode: Preferences.isDarkMode )  )
      ],
      child: const MapsApp(),
    )
  );
  
}

class MapsApp extends StatelessWidget {
  const MapsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: LoginScreen.pageRoute,
      routes: {
        HomeScreen.pageRoute: (context) => const HomeScreen(),
        SettingsScreen.pageRoute: (context) => const SettingsScreen(),
        LoginScreen.pageRoute:(context) => const LoginScreen(),
        RegisterScreen.pageRoute:(context) => const RegisterScreen(),
        RestorePasswordScreen.pageRoute:(context) => const RestorePasswordScreen(),
        GpsAccessScreen.pageRoute:(context) => const GpsAccessScreen(),
        MapScreen.pageRoute:(context) => const MapScreen(),
        LoadingScreen.pageRoute:(context) => const LoadingScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
