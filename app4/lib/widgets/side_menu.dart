import 'package:app4/screens/screens.dart';
import 'package:app4/share_preferences/preferences.dart';
import 'package:app4/themes/themes.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
   
  const SideMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: size.height*0.2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
             
                    const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Preferences.userName == '' ? 'Sin Nombre' : Preferences.userName,
                          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                        ), // TODO: QUITAR ESTO, solo colocar el nomre
                        Text(Preferences.userEmail),
                      ],
                    ),
                  ],
                ),
              ),
             
              _TitleFormat(text: 'Historial', icon: Icons.history, callback: () {
                
              },
              ),
              _TitleFormat(text: 'Favoritos', icon: Icons.heart_broken, callback: () {
                
              },
              ),
              _TitleFormat(text: 'Configurar perfil', icon: Icons.person, callback: () {
                Navigator.pushNamed(context, SettingsScreen.pageRoute);
              },
              ),
              const SizedBox(height: 10,),
              Container(
                height: 2,
                width: size.width,
                color: AppTheme.gray30,
                ),
              const SizedBox(height: 10,),
              _TitleFormat(text: 'Ayuda', icon: Icons.help_outline_sharp, callback: () {
                
              },
              ),
              
              _TitleFormat(text: 'Políticas de privacidad', icon: Icons.policy, callback: () {
          
              },
              ),
              const SizedBox(height: 30,),
              BrandingLima(width: size.width),
              const SizedBox(height: 10,),
              BrandingQaira(width: size.width),
              const SizedBox(height: 30,),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed:  ()  {
                    Preferences.cleanPreferences();
                    Navigator.pushNamed(context, SplashScreen.pageRoute);
                    // Navigator.pushReplacementNamed(context, SplashScreen.pageRoute);
                    
                  }, 
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(AppTheme.primaryOrange)
                  ),
                  child: Row(
                    children: const  [
                      Icon(Icons.logout, color: AppTheme.red,),
                      SizedBox(width: 7,),
                      Text('Cerrar sesion', 
                      style: TextStyle(fontSize: 13, color: AppTheme.red),),
                    ],
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleFormat extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback callback;
  const _TitleFormat({
    Key? key, required this.text, required this.icon, required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.black,),
      title: Text(text, style: const TextStyle(color: AppTheme.black, fontWeight: FontWeight.w800),),
      onTap: callback,
    );
  }
}
