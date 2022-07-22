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

class RestoreScreen extends StatelessWidget {
  static const String pageRoute = 'Restoring';
  const RestoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AuthBackground(
            child: SingleChildScrollView(
                child: ChangeNotifierProvider(
          create: (restorContext) => AuthFormProvider(),
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
              Consumer<AuthFormProvider>(
                builder: (context, restorForm, _) => TextButton(
                  onPressed: restorForm.isLoading
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
    final restorForm = Provider.of<AuthFormProvider>(context);
    return Container(
      child: Form(
        key: restorForm.formKeyRestorPass,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // TODO: Mantener la referencia al KEY
        child: Column(
          children: [
            
            
            TextFormField(
              onChanged: (value) => restorForm.userEmail = value,
              readOnly: restorForm.isLoading ? true : false,
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
            
            MaterialButton(
              onPressed: restorForm.isLoading
                  ? null
                  : () async {
                      if(!restorForm.isValidRestorPass()) return;
                      restorForm.isLoading = true;
                      final authService = Provider.of<AuthService>(context, listen: false);
                      await Future.delayed(Duration(seconds: 2));
                      final String? resetPassword = await authService.resetPassword(restorForm.userEmail);
                      await Future.delayed(Duration(seconds: 5));
                      restorForm.isLoading = false;
                      
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
