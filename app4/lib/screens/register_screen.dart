import 'package:app4/providers/providers.dart';
import 'package:app4/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/screens/login_screen.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/input_decorations.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static const String pageRoute = 'Register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AuthBackground(
            child: SingleChildScrollView(
                child: ChangeNotifierProvider(
          create: (buildeContext) => RegisterFormProvider(),
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
              Consumer<RegisterFormProvider>(
                builder: (context, registerForm, _) => TextButton(
                  onPressed: registerForm.isLoading
                      ? null
                      : () {
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
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ))),
      ]),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    return Container(
      child: Form(
        key: registerForm.formKey,
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
              onChanged: (value) => registerForm.phoneNumber = value,
              readOnly: registerForm.isLoading ? true : false,
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
              onChanged: (value) => registerForm.userEmail = value,
              readOnly: registerForm.isLoading ? true : false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'enamil@ext.com',
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
              onChanged: (value) => registerForm.userPassWord = value,
              readOnly: registerForm.isLoading ? true : false,
              autocorrect: false,
              keyboardType: TextInputType.visiblePassword,
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
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: registerForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!registerForm.isValid()) return;
                      registerForm.isLoading = true;
                      final authService = Provider.of<AuthService>(context, listen: false);
                      final String? errorMsg = await authService.createUser(
                          registerForm.userEmail,
                          registerForm.userPassWord,
                          registerForm.userName,
                          registerForm.phoneNumber,
                          registerForm.userBirthday,
                          registerForm.gender);
                      
                      await Future.delayed(Duration(seconds: 2));

                      if(errorMsg == null) {
                        // Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
                      }
                      else{
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
