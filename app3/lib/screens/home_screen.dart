import 'package:app3/router/app_routes.dart';
import 'package:app3/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOption;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My HOME'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(menuOptions[index].name),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.primaryColor,),
                  leading: Icon(menuOptions[index].icon, color: AppTheme.primaryColor,),
                  onTap: () {
                    // Usar esto cuando no se tiene definido la ruta
                    // final route = MaterialPageRoute(
                    //   builder: (context) => const Listview2Screen(),
                    // );
                    // Navigator.pushReplacement(context, route);
                    // Navigator.push(context, route);
                    Navigator.pushNamed(
                        context, menuOptions[index].route);
                    // Navigator.pushReplacementNamed(context, 'listView1');
                    // Navigator.pushReplacement(context, route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: menuOptions.length));
  }
}
