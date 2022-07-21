import 'package:app4/providers/providers.dart';
import 'package:app4/services/services.dart';
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
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (buildContext) => LoginFormProvider(),
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                CardContainer(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Iniciar sesión',
                      style: TextStyle(color: Colors.black54, fontSize: 40),
                      //style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _LoginForm(),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                )),
                const SizedBox(
                  height: 50,
                ),
                Consumer<LoginFormProvider>(
                    builder: (context, loginForm, _) => TextButton(
                          onPressed: loginForm.isLoading
                              ? null
                              : () {
                                  Navigator.pushReplacementNamed(
                                      context, RegisterScreen.pageRoute);
                                },
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.indigo.withOpacity(0.1))),
                          child: const Text(
                            'Crear cuenta nueva ',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                        )),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        )),
      ]),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginFomr = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        // TODO: Mantener la referencia al KEY
        key: loginFomr.formKey,
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
                  prefixIcon: Icons.alternate_email_outlined),
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
              onChanged: (value) => loginFomr.userPassWord = value,
              autocorrect: false,
              readOnly: loginFomr.isLoading ? true : false,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Contrasenha',
                  hintText: '••••••••',
                  prefixIcon: Icons.password_sharp),
              validator: (value) {
                return InternalValidations.passwordValidator(value)
                    ? null
                    : 'Extensión incorrecta';
              },
            ),
            TextButton(
              onPressed: loginFomr.isLoading
                  ? null
                  : () {
                      Navigator.pushReplacementNamed(
                          context, RestorePasswordScreen.pageRoute);
                    },
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      Colors.indigo.withOpacity(0.1))),
              child: const Text(
                'Olvidaste tu Contrasenha',
                style: TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 30,
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
                      if (!loginFomr.isValid()) return;
                      loginFomr.isLoading = true;
                      // TODO: validad si el login es correcto

                      // UserCredential user = await FirebaseAuth.instance
                      //     .signInWithEmailAndPassword(
                      //         email: loginFomr.userEmail,
                      //         password: loginFomr.userPassWord);
                      // print(user);
                      // print(user.user?.uid);

                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      final String token = await authService.loginUser(
                          loginFomr.userEmail, loginFomr.userPassWord);

                      await Future.delayed(Duration(seconds: 3));
                      // GET TESTING ----------
                      // final String dataLook = await authService.lookUpUser(token);
                      final String? email_verified = await authService.emailVerified(token);
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
                      await Future.delayed(Duration(seconds: 5));
                      final String? verify_email = await authService.verifyEmail(token);
                      await Future.delayed(Duration(seconds: 5));
                      final String? change_password = await authService.changePassword(token, '654321');
                      await Future.delayed(Duration(seconds: 5));
                      // final String? resetPassword = await authService.resetPassword('j.ponce@qairadrones.com');


                      





                      loginFomr.isLoading = false;

                      // if(token != '') Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
                    },
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
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
            )
          ],
        ),
      ),
    );
  }
}
