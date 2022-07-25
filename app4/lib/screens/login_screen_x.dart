import 'package:app4/providers/providers.dart';
import 'package:app4/services/services.dart';
import 'package:app4/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/ui.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String pageRoute = 'Login';
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AuthBackground(
        welcomeText: '¡Hola!',
        descriptionText: 'Ingresa tus datos y empecemos a rutear.',
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (loginContext) => AuthFormProvider(),
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                CardContainer(
                    child: Column(
                  children: [
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const Text(
                    //   'Iniciar sesión',
                    //   style: TextStyle(color: Colors.black54, fontSize: 40),
                    //   //style: Theme.of(context).textTheme.headline4,
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    _LoginForm(),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                )),
                // const SizedBox(
                //   height: 50,
                // ),
                // Consumer<AuthFormProvider>(
                //     builder: (context, loginForm, _) => TextButton(
                //           onPressed: loginForm.isLoading
                //               ? null
                //               : () {
                //                   Navigator.pushNamed(context, RegisterScreen.pageRoute);
                //                   // Navigator.pushReplacementNamed(context, RegisterScreen.pageRoute);
                //                 },
                //           style: ButtonStyle(
                //               overlayColor: MaterialStateProperty.all(
                //                   Colors.indigo.withOpacity(0.1))),
                //           child: const Text(
                //             'Registrate',
                //             style:
                //                 TextStyle(fontSize: 18, color: AppTheme.blue),
                //           ),
                //         ),
                //         ),
                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        )),
      
      ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginFomr = Provider.of<AuthFormProvider>(context);
    return Container(
      child: Form(
        // TODO: Mantener la referencia al KEY
        key: loginFomr.formKeyLogin,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => loginFomr.userEmail = value,
              readOnly: loginFomr.isLoading ? true : false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  hintText: 'enamil@ext.com',
                  labelText: 'Correo electrónico',
                  // prefixIcon: Icons.alternate_email_outlined
                  ),
              validator: (value) {
                return InternalValidations.emailValidator(value)
                    ? null
                    : 'Correo inválido';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              onChanged: (value) => loginFomr.userPassword = value,
              autocorrect: false,
              readOnly: loginFomr.isLoading ? true : false,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Contrasenha',
                  hintText: '••••••••',
                  sufixIcon: Icons.remove_red_eye,
                  ),
              validator: (value) {
                return InternalValidations.passwordValidator(value)
                    ? null
                    : 'Extensión incorrecta';
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              child: TextButton(
                onPressed: loginFomr.isLoading
                    ? null
                    : () {

                        Navigator.pushNamed(context, RestorePasswordScreen.pageRoute);
                        // Navigator.pushReplacementNamed(context, RestorePasswordScreen.pageRoute);
                      },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1))),
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    fontSize: 12,
                     color: AppTheme.blue,
                     decoration: TextDecoration.underline,
                     ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(color: AppTheme.black, fontSize: 15),
                  ),
                TextButton(
                  onPressed: loginFomr.isLoading
                      ? null
                      : () {
                          Navigator.pushNamed(context, RegisterScreen.pageRoute);
                          // Navigator.pushReplacementNamed(context, RegisterScreen.pageRoute);
                        },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.indigo.withOpacity(0.1))),
                  child: const Text(
                    'Registrate',
                    style:
                        TextStyle(fontSize: 15, color: AppTheme.blue, fontWeight: FontWeight.w900),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text('© Desarrollado por '),
                Image.asset('assets/logos/logoQaira.jpg', width: 50, height: 20,)
              ],
            ),
            const SizedBox(
              height: 350,
            ),
            MaterialButton(
              onPressed: loginFomr.isLoading
                  ? null
                  : () async {
                      //
                      FocusScope.of(context)
                          .unfocus(); // Para quitar el teclado
                      // Se pone listen en false porque NO SE PUEDE ESCUCHAR DENTRO DE UN METODO
                      // Solo se puede escuchar dentro del build
                      if (!loginFomr.isValidLogin()) return;
                      loginFomr.isLoading = true;
                      // TODO: validad si el login es correcto

                      // UserCredential user1 = await FirebaseAuth.instance
                      //     .signInWithEmailAndPassword(
                      //         email: loginFomr.userEmail,
                      //         password: loginFomr.userPassword);
                      // print(user1.user);
                      // print(user1.user?.uid);
                      // User? user = FirebaseAuth.instance.currentUser;

                      // if (user!= null && !user.emailVerified) {
                      //   await user.sendEmailVerification();
                      // }



                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      final String? token = await authService.loginUser(
                          loginFomr.userEmail, loginFomr.userPassword);

                      if(token != null) {
                        Preferences.firebaseToken = token;
                        Preferences.userEmail = loginFomr.userEmail; //DELETE THIS
                        Preferences.userPassword = loginFomr.userPassword; //DELETE THIS
                        final Map<String, dynamic> dataLook = await authService.lookUpUser(token);
                        
                        if(dataLook.isEmpty == false){
                      
                            //"first_name":"Cose",
                            //"gender":"Otros",
                            //"last_name":" - ","
                            //phone_number":"+51943453453"}
                          // Preferences.userEmail = dataLook['email'] ; // TODO: evaluate this
                          Preferences.userBirthday = dataLook['birthdate'] ;
                          Preferences.userName = dataLook['name'] ;
                          Preferences.userGender = Preferences.getGenderNumber(dataLook['gender']) ;
                          Preferences.userPhoneNumber = dataLook['phone_number'].substring(3) ;      
                          // Preferences.userPassword = loginFomr.userPassword; // TODO: evaluate this
                        
                        }

                        final bool? emailVerified = await authService.isEmailVerified(token);
                        if(emailVerified != null){
                          Preferences.isEmailVerified = emailVerified;
                          if(!emailVerified) await authService.verifyEmail(token);
                        }
                        // Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
                      // TESTING DELETING 
                        // await Future.delayed(Duration(seconds: 3));
                        // final bool isDeleted = await authService.deleteUserAccount(token);
                      }
                      await Future.delayed(Duration(seconds: 3));
                      loginFomr.isLoading = false;
                      if(token != null) {
                        Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
                      // Navigator.pushReplacementNamed(context, SettingsScreen.pageRoute);
                      }
                      
                      
                      // GET TESTING ----------
                      // await Future.delayed(Duration(seconds: 5));
                      // PUT TESTING ---------
                      // final String? changing_user_data = await authService.changeUserData(
                      //   loginFomr.userEmail, 
                      //   'pablo',
                      //   '912123456', 
                      //   '04-12-1990', 
                      //   'masculino', 
                      //   token
                      //   );
                      // await Future.delayed(Duration(seconds: 5));
                      // final String? verify_email = await authService.verifyEmail(token);
                      // await Future.delayed(Duration(seconds: 5));
                      // final String? change_password = await authService.changePassword(token, '654321');
                      // await Future.delayed(Duration(seconds: 5));
                      // final String? resetPassword = await authService.resetPassword('j.ponce@qairadrones.com');


                      





                    },
              disabledColor: Colors.grey,
              elevation: 0,
              color: AppTheme.darkBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginFomr.isLoading ? 'Espere' : 'Ingresar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
