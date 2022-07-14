import 'package:app3/models/models.dart';
import 'package:flutter/material.dart';
import 'package:app3/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[
    MenuOption(
        route: 'home',
        name: 'Home Screen',
        screen: const HomeScreen(),
        icon: Icons.home),
    MenuOption(
        route: 'listView1',
        name: 'Lista 1',
        screen: const Listview1Screen(),
        icon: Icons.library_books_sharp),
    MenuOption(
        route: 'listView2',
        name: 'Lista 2',
        screen: const Listview2Screen(),
        icon: Icons.list),
    MenuOption(
        route: 'card',
        name: 'card Screen',
        screen: const CardScreen(),
        icon: Icons.add_card_rounded),
    MenuOption(
        route: 'alert',
        name: 'alert Screen',
        screen: const AlertScreen(),
        icon: Icons.alarm_off_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOption) {
      appRoutes.addAll({option.route: (context) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (context) => const HomeScreen(),
  //   'listView1': (BuildContext context) => const Listview1Screen(),
  //   'listView2': (BuildContext context) => const Listview2Screen(),
  //   'card': (BuildContext constext) => const CardScreen(),
  //   'alert': (context) => const AlertScreen(),
  //   'map1': (context) => const Map1Screen(),
  // };
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }
}
