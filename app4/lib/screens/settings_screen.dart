import 'package:app4/screens/login_screen.dart';
import 'package:app4/screens/welcome_screen.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app4/providers/providers.dart';
import 'package:app4/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';




class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String pageRoute = 'Settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray10,
      appBar: AppBar(
        
        title: const Text(
          'Datos personales',
          style: TextStyle(color: AppTheme.black),          
          ),
        
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (buildeContext) => AuthFormProvider(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              // const Text('Ajustes',
              //     style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
              // const Divider(),
        
              // SwitchListTile.adaptive(
              //     title: const Text('Darkmode'),
              //     value: Preferences.isDark,
              //     onChanged: (value) {
              //       Preferences.isDark = value;
                    
                    // value
                    //     ? themeProvider.setDarkMode()
                    //     : themeProvider.setLightMode();
                    // setState(() {}
                    // );
                  // }),
               Container(
                width: double.infinity,
                height: 170,
                color: AppTheme.gray30,
                child: const Icon(Icons.person, color: AppTheme.gray50, size: 150,),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: _SettingsForm(),
              ),
             
              
              
            
              
              
              
            ],
          ),
        ),
      ),
      
      );
    
  }
}


class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<int>(
              activeColor: AppTheme.darkBlue,
              groupValue: groupValue,
              value: value,
              onChanged: (int? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label, style: const TextStyle(fontSize: 13),),
          ],
        ),
      ),
    );
  }
}




class _SettingsForm extends StatefulWidget {
  const _SettingsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<_SettingsForm> {
  @override
  Widget build(BuildContext context) {
    final settingForm = Provider.of<AuthFormProvider>(context, listen: false);
    settingForm.userName        = Preferences.userName;
    settingForm.userEmail       = Preferences.userEmail;
    settingForm.userPhoneNumber = Preferences.userPhoneNumber;
    settingForm.userPassword    = Preferences.userPassword;
    settingForm.userBirthday    = Preferences.userBirthday;
    settingForm.userGender      = Preferences.userGender;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
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
            settingForm.userName = value;
            // setState(() {});
            // name = value;
          },
        ),

        const Divider(),
        TextFormField(
          keyboardType: TextInputType.phone,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          initialValue: Preferences.userPhoneNumber,
          decoration: const InputDecoration(
            labelText: 'Teléfono',
            helperText: 'Número de teléfono',
            hintText: '000',
          ),
          onChanged: (value) {
            settingForm.userPhoneNumber = value;
            // setState(() {});
          },
        ),
        const Divider(),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          initialValue: Preferences.userEmail,
          decoration: const InputDecoration(
            labelText: 'Email',
            helperText: 'Correo electrónico',
            hintText: 'aa@aa.com',
          ),
          onChanged: (value) {
            print('------email-----');
            print(value);
            settingForm.userEmail = value;
          },
        ),
        const Divider(),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          initialValue: Preferences.userPassword,
          obscuringCharacter: '•',
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Contrasenha',
            helperText: 'Contrasenha',
            hintText: '••••••••',
          ),
          onChanged: (value) {
            print('-----passs--');
            print(value);
            settingForm.userPassword = value;
          },
        ),
        const Divider(),
        TextFormField(
          keyboardType: TextInputType.datetime,
          initialValue: Preferences.userBirthday,
          decoration: const InputDecoration(
            labelText: 'Fecha de nacimiento',
            helperText: 'Fecha de nacimiento',
            hintText: '12-11-2000',
          ),
          onChanged: (value) {
            settingForm.userBirthday = value;
          },
        ),
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledRadio(
              label: 'Femenino',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: 2,
              groupValue: Preferences.userGender,
              onChanged: (int newValue) {
                setState(() {
                  Preferences.userGender = newValue;
                });
              },
            ),
            LabeledRadio(
              label: 'Masculino',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: 1,
              groupValue: Preferences.userGender,
              onChanged: (int newValue) {
                setState(() {
                  Preferences.userGender = newValue;
                });
              },
            ),
            LabeledRadio(
              label: 'Otros',
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              value: 3,
              groupValue: Preferences.userGender,
              onChanged: (int newValue) {
                setState(() {
                  Preferences.userGender = newValue;
                });
              },
            ),
            // Expanded(
            //   child: RadioListTile<int>(
            //     contentPadding: const EdgeInsets.all(0),
            //     title: const Text(
            //       'Femenino', 
            //       style: TextStyle(fontSize: 11, backgroundColor: AppTheme.red),),
            //     value: 2,
            //     groupValue: Preferences.userGender,
            //     onChanged: (value) {
                  
            //       setState(() {
            //         Preferences.userGender = value ?? 2;
            //       });
            // }),
            // ),
            // Expanded(
            //   child: RadioListTile<int>(
            //     contentPadding: const EdgeInsets.all(0),
            //     title: const Text('masculino'),
            //     value: 1,
            //     groupValue: Preferences.userGender,
            //     onChanged: (value) {
            //       setState(() {
            //           Preferences.userGender = value ?? 1;
            //       });
            // }),
            // ),
            
            // Expanded(
            //   child: RadioListTile<int>(
            //     contentPadding: const EdgeInsets.all(0),
            //     title: const Text('otros'),
            //     value: 3,
            //     groupValue: Preferences.userGender,
            //     onChanged: (value) {
            //       setState(() {
            //         Preferences.userGender = value ?? 3;
            //       });
            // }),
            // ),
          ],
        ),
        const Divider(),
    
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: TextButton(
                  onPressed:  ()  {
                    Preferences.cleanPreferences();
                    Navigator.pushReplacementNamed(context, WelcomeScreen.pageRoute);
                    
                  }, 
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(AppTheme.primaryOrange)
                  ),
                  child: const Text('Cerrar sesion', 
                  style: TextStyle(fontSize: 13, color: AppTheme.primaryOrange),),
            ),
        ),
        const Divider(height: 1,),
    
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: TextButton(
                  onPressed:  () async {
                    final authService =
                        Provider.of<AuthService>(context, listen: false);
                    final bool isDeleted = await authService.deleteUserAccount(Preferences.firebaseToken);
                    if(isDeleted) {
                      Preferences.cleanPreferences();
                      Navigator.pushReplacementNamed(context, LoginScreen.pageRoute);
                    }
                  }, 
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(AppTheme.red)
                  ),
                  child: const Text('Eliminar cuenta', 
                  style: TextStyle(fontSize: 13, color: AppTheme.red),),
            ),
        ),
        const Divider(),
    
        MaterialButton(
          minWidth: double.infinity,
          onPressed:  () async{
            final authService = Provider.of<AuthService>(context, listen: false);
    
            // TODO: The preferences must change after the updating was confirmed
            print('----PRINTING ALL VALUES --------');
            print('Email is: ${settingForm.userEmail}');
            print('Name is: ${settingForm.userName}');
            print('PhoneNumber is: ${settingForm.userPhoneNumber}');
            print('Password is: ${settingForm.userPassword}');
          
            final bool isChangedUserData = await authService.changeUserData(
                  email:     settingForm.userEmail ,
                  name:      settingForm.userName ,
                  phone:     settingForm.userPhoneNumber ,
                  birthday:  settingForm.userBirthday ,
                  gender:    Preferences.getGenderString(),
                  idToken:   Preferences.firebaseToken ,
                  );
            if(isChangedUserData){
              Preferences.userEmail        = settingForm.userEmail;
              Preferences.userName         = settingForm.userName ;
              Preferences.userPhoneNumber  = settingForm.userPhoneNumber ;
              Preferences.userBirthday     = settingForm.userBirthday ;
              Preferences.userGender       = settingForm.userGender ;
            }
            if (Preferences.userPassword != settingForm.userPassword){
              final bool changedPassword = await authService.changePassword(Preferences.firebaseToken, settingForm.userPassword);
              if (changedPassword) Preferences.userPassword = settingForm.userPassword;
            }
          },
          disabledColor: Colors.grey,
          elevation: 0,
          color: Color.fromRGBO(26, 74, 132, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: const Text(
              'Guardar',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
      ),
      const Divider(height: 50,)
    





      ],
    );
  }
}
