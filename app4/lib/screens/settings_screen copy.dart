import 'package:app4/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app4/providers/providers.dart';
import 'package:app4/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class SettingsScreen2 extends StatefulWidget {
  static const String pageRoute = 'Settings';

  const SettingsScreen2({Key? key}) : super(key: key);

  @override
  State<SettingsScreen2> createState() => _SettingsScreen2State();
}

class _SettingsScreen2State extends State<SettingsScreen2> {
  // bool isDarkMode = false;
  // int preference = 1;
  // String name = '';
  // String phoneNumber = '';
  // String email = '';
  
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    // final settingForm = Provider.of<AuthFormProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos personales'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (buildeContext) => AuthFormProvider(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Consumer<AuthFormProvider>(
                  builder: (context, settingForm, child) => Container(
                    
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          color: Color.fromARGB(255, 203, 220, 233),
                          child: const Icon(Icons.person, color: Color.fromARGB(255, 134, 138, 141), size: 150,),
                        ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RadioListTile<int>(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text('femenino'),
                                value: 2,
                                groupValue: Preferences.userGender,
                                onChanged: (value) {
                                  Preferences.userGender = value ?? 2;
                                  setState(() {});
                            }),
                            ),
                            Expanded(
                              child: RadioListTile<int>(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text('masculino'),
                                value: 1,
                                groupValue: Preferences.userGender,
                                onChanged: (value) {
                                  Preferences.userGender = value ?? 1;
                                  
                                  setState(() {});
                            }),
                            ),
                            
                            Expanded(
                              child: RadioListTile<int>(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text('otros'),
                                value: 3,
                                groupValue: Preferences.userGender,
                                onChanged: (value) {
                                  Preferences.userGender = value ?? 3;
                  
                                  setState(() {});
                            }),
                            ),
                          ],
                        ),
                      const Divider(),
                  
                      TextButton(
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
                                overlayColor: MaterialStateProperty.all(Colors.red)
                              ),
                              child: const Text('Eliminar cuenta', 
                              style: TextStyle(fontSize: 18, color: Colors.red),),
                        ),
                        const Divider(),
                  
                        MaterialButton(
                  
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
                                  gender:    Preferences.getGenderStringPassingValue(settingForm.userGender) ,
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                            child: const Text(
                              'Guardar',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                      )
                  





                      ],
                    ),
                  ),
                  
                ),
                
                
              
                
                
                
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
