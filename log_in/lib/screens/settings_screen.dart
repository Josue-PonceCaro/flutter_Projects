import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_in/providers/theme_providers.dart';
import 'package:log_in/share_preferences/preferences.dart';
import 'package:log_in/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String pageRoute = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int preference = 1;
  // String name = '';
  // String phoneNumber = '';
  // String email = '';
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
              const Divider(),

              SwitchListTile.adaptive(
                  title: const Text('Darkmode'),
                  value: Preferences.isDarkMode,
                  onChanged: (value) {
                    Preferences.isDarkMode = value;
                    
                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLightMode();
                    setState(() {});
                  }),

              const Divider(),
              TextFormField(
                keyboardType: TextInputType.name,
                // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.singleLineFormatter],
                initialValue: Preferences.userName,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del Usuario',
                  hintText: 'Pepe',
                ),
                onChanged: (value) {
                  Preferences.userName = value;
                  setState(() {});
                  // name = value;
                },
              ),
              const Divider(),
              TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                initialValue: Preferences.phoneNumber,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  helperText: 'Número de teléfono',
                  hintText: '000',
                ),
                onChanged: (value) {
                  Preferences.phoneNumber = value;
                  setState(() {});
                },
              ),
              const Divider(),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: Preferences.email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  helperText: 'Correo electrónico',
                  hintText: 'aa@aa.com',
                ),
                onChanged: (value) {
                  Preferences.email = value;
                },
              ),
              const Divider(),
              RadioListTile<int>(
                  title: const Text('Peatón'),
                  value: 1,
                  groupValue: Preferences.userPrefer,
                  onChanged: (value) {
                    Preferences.userPrefer = value ?? 1;
                    
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  title: const Text('Ciclista'),
                  value: 2,
                  groupValue: Preferences.userPrefer,
                  onChanged: (value) {
                    Preferences.userPrefer = value ?? 2;

                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
