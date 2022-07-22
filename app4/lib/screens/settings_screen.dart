import 'package:app4/screens/login_screen.dart';
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
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
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
              children: const [
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
                _SettingsForm(),
               
                
                
              
                
                
                
              ],
            ),
          ),
        ),
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
    return Container(
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
                                  
                                  setState(() {
                                    Preferences.userGender = value ?? 2;
                                  });
                            }),
                            ),
                            Expanded(
                              child: RadioListTile<int>(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text('masculino'),
                                value: 1,
                                groupValue: Preferences.userGender,
                                onChanged: (value) {
                                  setState(() {
                                      Preferences.userGender = value ?? 1;
                                  });
                            }),
                            ),
                            
                            Expanded(
                              child: RadioListTile<int>(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text('otros'),
                                value: 3,
                                groupValue: Preferences.userGender,
                                onChanged: (value) {
                                  setState(() {
                                    Preferences.userGender = value ?? 3;
                                  });
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
                  
    );
  }
}
