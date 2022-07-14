import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/screens/login_screen.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/input_decorations.dart';
import 'package:app4/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const String pageRoute = 'Register';
  const RegisterScreen({Key? key}) : super(key: key);

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
                    'Registrarse',
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
                      context, LoginScreen.pageRoute);
                },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1))),
                child: const Text(
                  'Ya tiene cuenta?',
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
      
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // TODO: Mantener la referencia al KEY
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Maria Jesus',
                  prefixIcon: Icons.person_pin_circle),
              validator: (value) {
                return InternalValidations.nameValidator(value)
                    ? null
                    : 'Nombre Incorrecto';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Numero de Celular',
                  hintText: '987654321',
                  prefixIcon: Icons.phone_android_rounded),
              validator: (value) {
                return InternalValidations.phoneValidator(value)
                    ? null
                    : 'número incorrecto';
              },
            ),

            const SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'enamil@ext.com',
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
              keyboardType: TextInputType.visiblePassword,
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
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
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
                  'Registrarse',
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
