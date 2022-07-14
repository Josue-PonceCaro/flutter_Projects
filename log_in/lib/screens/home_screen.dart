import 'package:flutter/material.dart';
import 'package:log_in/share_preferences/preferences.dart';
import 'package:log_in/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String pageRoute = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text('Nombre: ${Preferences.userName}'),
          const Divider(),
          Text('Teléfono: ${Preferences.phoneNumber}'),
          const Divider(),
          Text('email: ${Preferences.email}'),
          const Divider(),
          Text('Perfil de preferencia: ${Preferences.userPrefer == 1 ? 'Peatón' : 'Ciclista'}')
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}
