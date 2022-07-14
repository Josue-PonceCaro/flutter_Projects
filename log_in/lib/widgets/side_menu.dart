import 'package:flutter/material.dart';
import 'package:log_in/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Home Screen'),
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.pageRoute);
            },
          ),
         
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Settings'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsScreen.pageRoute);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
