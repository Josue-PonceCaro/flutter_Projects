import 'package:app4/providers/providers.dart';
import 'package:app4/services/auth_service.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/screens/login_screen.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/input_decorations.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String pageRoute = 'Register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final Size areaScreen = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (registerContext) => AuthFormProvider(),
      child: Consumer<AuthFormProvider>(
        builder: (context, registerForm, _) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: registerForm.isLoading ? false : true,
            ),
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: areaScreen.width * 0.04),
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: AppTheme.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: areaScreen.height * 0.0,
                        ),
                        Container(
                          height: areaScreen.height * 0.15,
                          width: double.infinity,
                          child: WelcomeText(
                            hightSize: areaScreen.height,
                            welcomeText: 'Crear cuenta',
                            descriptionText: 'Ingresa tus datos para empezar.',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: areaScreen.height * 0.15,
                              ),
                              Container(
                                height: areaScreen.height * 0.504,
                                color: AppTheme.white,
                                width: double.infinity,
                                child: Form(
                                  key: registerForm.formKeyRegister,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        onChanged: (value) =>
                                            registerForm.userName = value,
                                        readOnly: registerForm.isLoading
                                            ? true
                                            : false,
                                        autocorrect: false,
                                        keyboardType: TextInputType.name,
                                        style: const TextStyle(
                                            color: AppTheme.black),
                                        decoration: InputDecotations
                                            .authInputDecoration(
                                          labelText: 'Nombre Completo',
                                          hintText: 'Maria Jesus',
                                          // prefixIcon: Icons.person_pin_circle
                                        ),
                                        validator: (value) {
                                          return InternalValidations
                                                  .nameValidator(value)
                                              ? null
                                              : 'Nombre Incorrecto';
                                        },
                                      ),
                                      SizedBox(
                                        height: areaScreen.height * 0.01,
                                      ),
                                      TextFormField(
                                        onChanged: (value) =>
                                            registerForm.userEmail = value,
                                        readOnly: registerForm.isLoading
                                            ? true
                                            : false,
                                        autocorrect: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        decoration: InputDecotations
                                            .authInputDecoration(
                                          labelText: 'Correo electrónico',
                                          hintText: 'enamil@ext.com',
                                          // prefixIcon: Icons.alternate_email_outlined
                                        ),
                                        validator: (value) {
                                          return InternalValidations
                                                  .emailValidator(value)
                                              ? null
                                              : 'Correo inválido';
                                        },
                                      ),
                                      SizedBox(
                                        height: areaScreen.height * 0.01,
                                      ),
                                      TextFormField(
                                        onChanged: (value) => registerForm
                                            .userPhoneNumber = value,
                                        readOnly: registerForm.isLoading
                                            ? true
                                            : false,
                                        autocorrect: false,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.phone,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        decoration: InputDecotations
                                            .authInputDecoration(
                                          labelText: 'Numero de Celular',
                                          hintText: '987654321',
                                          // prefixIcon: Icons.phone_android_rounded
                                        ),
                                        validator: (value) {
                                          return InternalValidations
                                                  .phoneValidator(value)
                                              ? null
                                              : 'número incorrecto';
                                        },
                                      ),
                                      SizedBox(
                                        height: areaScreen.height * 0.01,
                                      ),
                                      TextFormField(
                                        onChanged: (value) =>
                                            registerForm.userPassword = value,
                                        readOnly: registerForm.isLoading
                                            ? true
                                            : false,
                                        autocorrect: false,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: true,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        decoration: InputDecotations
                                            .authInputDecoration(
                                                labelText: 'Contrasenha',
                                                hintText: '••••••••',
                                                sufixIcon:
                                                    Icons.remove_red_eye),
                                        validator: (value) {
                                          return InternalValidations
                                                  .passwordValidator(value)
                                              ? null
                                              : 'Extensión incorrecta';
                                        },
                                      ),
                                      SizedBox(
                                        height: areaScreen.height * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                              value: Preferences.areTermsAccepted,
                                              onChanged: (value) {
                                                Preferences.areTermsAccepted =
                                                    value ?? false;
                                                print('------------');
                                                print(Preferences
                                                    .areTermsAccepted);
                                                setState(() {});
                                              }),
                                          Text(
                                            'Acepto los',
                                            style: TextStyle(
                                                color: AppTheme.black,
                                                fontSize:
                                                    areaScreen.height * 0.015),
                                          ),
                                          TextButton(
                                            onPressed: registerForm.isLoading
                                                ? null
                                                : () {
                                                    // Navigator.pushNamed(context, RegisterScreen.pageRoute);
                                                    // Navigator.pushReplacementNamed(context, RegisterScreen.pageRoute);
                                                  },
                                            style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.indigo
                                                            .withOpacity(0.1))),
                                            child: Text(
                                              'términos y condiciones legales',
                                              style: TextStyle(
                                                  fontSize:
                                                      areaScreen.height * 0.015,
                                                  color: AppTheme.blue,
                                                  fontWeight: FontWeight.w900,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: areaScreen.height * 0.868,
                            // color: AppTheme.primaryOrange,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text('© Desarrollado por '),
                                    Image.asset(
                                      'assets/logos/logoQaira.jpg',
                                      width: 50,
                                      height: 20,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: areaScreen.height * 0.03,
                                ),
                                MaterialButton(
                                  // onPressed: !registerForm.isValidRegister()
                                  onPressed: registerForm.isLoading
                                      ? null
                                      : () async {
                                          FocusScope.of(context).unfocus();
                                          if (!registerForm.isValidRegister())
                                            return;
                                          registerForm.isLoading = true;
                                          final authService =
                                              Provider.of<AuthService>(context,
                                                  listen: false);
                                          final String? errorMsg =
                                              await authService.createUser(
                                                  email: registerForm.userEmail,
                                                  password:
                                                      registerForm.userPassword,
                                                  name: registerForm.userName,
                                                  phone: registerForm
                                                      .userPhoneNumber,
                                                  birthday:
                                                      registerForm.userBirthday,
                                                  gender: registerForm.gender);

                                          await Future.delayed(
                                              Duration(seconds: 2));

                                          if (errorMsg == null) {
                                            // Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
                                            final String? token =
                                                await authService.loginUser(
                                                    registerForm.userEmail,
                                                    registerForm.userPassword);

                                            if (token != null) {
                                              Preferences.firebaseToken = token;
                                              Preferences.userName =
                                                  registerForm.userName;
                                              Preferences.userPassword =
                                                  registerForm.userPassword;
                                              Preferences.userEmail =
                                                  registerForm.userEmail;
                                              Preferences.userPhoneNumber =
                                                  registerForm.userPhoneNumber;

                                              await authService
                                                  .verifyEmail(token);
                                            }
                                          } else {
                                            print(errorMsg);
                                          }

                                          // await Future.delayed(Duration(seconds: 2));
                                          // final String token = await authService.loginUser(
                                          //     registerForm.userEmail, registerForm.userPassWord);
                                          // await Future.delayed(Duration(seconds: 5));
                                          // // PUT TESTING ---------
                                          // final String? changing_user_data = await authService.changeUserData(
                                          //   registerForm.userEmail,
                                          //   registerForm.userName,
                                          //   registerForm.phoneNumber,
                                          //   '04-12-1990',
                                          //   'masculino',
                                          //   token
                                          //   );
                                          registerForm.isLoading = false;
                                          if (errorMsg == null) {
                                            Navigator.pushReplacementNamed(
                                                context,
                                                SettingsScreen.pageRoute);
                                          }
                                        },
                                  disabledColor: AppTheme.gray50,
                                  elevation: 0,
                                  color: AppTheme.darkBlue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Container(
                                    width: double.infinity,
                                    height: areaScreen.height * 0.065,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Continuar',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  areaScreen.height * 0.025),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: areaScreen.height * 0.02,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: Stack(children: [
    //     AuthBackground(
    //       welcomeText: 'Crear cuenta',
    //       descriptionText: 'Ingresa tus datos para empezar.',
    //         child: SingleChildScrollView(
    //           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    //             child: ChangeNotifierProvider(
    //       create: (registerContext) => AuthFormProvider(),
    //       child: Column(
    //         children: [
    //           const SizedBox(
    //             height: 200,
    //           ),
    //           CardContainer(
    //               child: Column(
    //             children: [
    //               // const SizedBox(
    //               //   height: 10,
    //               // ),
    //               // const Text(
    //               //   'Registrarse',
    //               //   style: TextStyle(color: Colors.black54, fontSize: 40),
    //               //   //style: Theme.of(context).textTheme.headline4,
    //               // ),
    //               // const SizedBox(
    //               //   height: 30,
    //               // ),
    //               _LoginForm(),
    //               const SizedBox(
    //                 height: 30,
    //               )
    //             ],
    //           )),
    //           // const SizedBox(
    //           //   height: 50,
    //           // ),
    //           // Consumer<AuthFormProvider>(
    //           //   builder: (context, registerForm, _) => TextButton(
    //           //     onPressed: registerForm.isLoading
    //           //         ? null
    //           //         : () {

    //           //             Navigator.pushReplacementNamed(
    //           //                 context, LoginScreen.pageRoute);
    //           //           },
    //           //     style: ButtonStyle(
    //           //         overlayColor: MaterialStateProperty.all(
    //           //             Colors.indigo.withOpacity(0.1))),
    //           //     child: const Text(
    //           //       'Ya tiene cuenta?',
    //           //       style: TextStyle(fontSize: 18, color: Colors.black87),
    //           //     ),
    //           //   ),
    //           // ),
    //           const SizedBox(
    //             height: 150,
    //           )
    //         ],
    //       ),
    //     ))),
    //   ]),
    // );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<AuthFormProvider>(context);
    return Container(
      child: Form(
        key: registerForm.formKeyRegister,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // TODO: Mantener la referencia al KEY
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => registerForm.userName = value,
              readOnly: registerForm.isLoading ? true : false,
              autocorrect: false,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                labelText: 'Nombre',
                hintText: 'Maria Jesus',
                // prefixIcon: Icons.person_pin_circle
              ),
              validator: (value) {
                return InternalValidations.nameValidator(value)
                    ? null
                    : 'Nombre Incorrecto';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) => registerForm.userPhoneNumber = value,
              readOnly: registerForm.isLoading ? true : false,
              autocorrect: false,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                labelText: 'Numero de Celular',
                hintText: '987654321',
                // prefixIcon: Icons.phone_android_rounded
              ),
              validator: (value) {
                return InternalValidations.phoneValidator(value)
                    ? null
                    : 'número incorrecto';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) => registerForm.userEmail = value,
              readOnly: registerForm.isLoading ? true : false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'enamil@ext.com',
                // prefixIcon: Icons.alternate_email_outlined
              ),
              validator: (value) {
                return InternalValidations.emailValidator(value)
                    ? null
                    : 'Correo inválido';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) => registerForm.userPassword = value,
              readOnly: registerForm.isLoading ? true : false,
              autocorrect: false,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Contrasenha',
                  hintText: '••••••••',
                  sufixIcon: Icons.remove_red_eye),
              validator: (value) {
                return InternalValidations.passwordValidator(value)
                    ? null
                    : 'Extensión incorrecta';
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Text('© Desarrollado por '),
                Image.asset(
                  'assets/logos/logoQaira.jpg',
                  width: 50,
                  height: 20,
                )
              ],
            ),
            const SizedBox(
              height: 300,
            ),
            MaterialButton(
              // onPressed: !registerForm.isValidRegister()
              onPressed: registerForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!registerForm.isValidRegister()) return;
                      registerForm.isLoading = true;
                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      final String? errorMsg = await authService.createUser(
                          email: registerForm.userEmail,
                          password: registerForm.userPassword,
                          name: registerForm.userName,
                          phone: registerForm.userPhoneNumber,
                          birthday: registerForm.userBirthday,
                          gender: registerForm.gender);

                      await Future.delayed(Duration(seconds: 2));

                      if (errorMsg == null) {
                        // Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
                        final String? token = await authService.loginUser(
                            registerForm.userEmail, registerForm.userPassword);

                        if (token != null) {
                          Preferences.firebaseToken = token;
                          Preferences.userName = registerForm.userName;
                          Preferences.userPassword = registerForm.userPassword;
                          Preferences.userEmail = registerForm.userEmail;
                          Preferences.userPhoneNumber =
                              registerForm.userPhoneNumber;

                          await authService.verifyEmail(token);
                        }
                      } else {
                        print(errorMsg);
                      }

                      // await Future.delayed(Duration(seconds: 2));
                      // final String token = await authService.loginUser(
                      //     registerForm.userEmail, registerForm.userPassWord);
                      // await Future.delayed(Duration(seconds: 5));
                      // // PUT TESTING ---------
                      // final String? changing_user_data = await authService.changeUserData(
                      //   registerForm.userEmail,
                      //   registerForm.userName,
                      //   registerForm.phoneNumber,
                      //   '04-12-1990',
                      //   'masculino',
                      //   token
                      //   );
                      registerForm.isLoading = false;
                      if (errorMsg == null) {
                        Navigator.pushReplacementNamed(
                            context, SettingsScreen.pageRoute);
                      }
                    },
              disabledColor: AppTheme.gray50,
              elevation: 0,
              color: AppTheme.darkBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
