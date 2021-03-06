import 'package:flutter/material.dart';
import 'package:log_in/screens/screens.dart';
import 'package:log_in/share_preferences/share_preferences.dart';
import 'package:log_in/ui/input_decorations.dart';
import 'package:log_in/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String pageRoute = 'Login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AuthBackground(
            child: SingleChildScrollView(
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
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterScreen.pageRoute);
                },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1))),
                child: const Text(
                  'Crear cuenta nueva ',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        )),
      ]),
      drawer: const SideMenu(),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        // TODO: Mantener la referencia al KEY
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  hintText: 'enamil@ext.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_outlined),
              validator: (value) {
                return InternalValidations.emailValidator(value) ? null : 'Correo inválido';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Contrasenha',
                  hintText: '••••••••',
                  prefixIcon: Icons.password_sharp),
              validator: (value) {
                return InternalValidations.passwordValidator(value) ? null : 'Extensión incorrecta';
              },
            ),
            TextButton(
              onPressed: () {
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
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreen.pageRoute);
              },
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
