import 'package:app4/providers/providers.dart';
import 'package:app4/screens/login_screen.dart';
import 'package:app4/services/services.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/input_decorations.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RestorePasswordScreen extends StatelessWidget {
  static const String pageRoute = 'Restore';
  const RestorePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
      ),
      body: Stack(children:  [
         AuthBackground(
          welcomeText: 'Recuperar',
          descriptionText: 'Ingresa tu correo electronico.',
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ChangeNotifierProvider(
              create: (restorContext) => AuthFormProvider(),
              child: Column(
                children: [
                  const SizedBox(height: 250,),
                  CardContainer(
                    child: Column(
                      children: [
            
                      //   const SizedBox(height: 10,),
                      //   const Text(
                      //          'Recuperar contrasenha',
                      //          style: TextStyle(color: Colors.black54, fontSize: 30),
                      // //style: Theme.of(context).textTheme.headline4,
                      
                      //   ),
                      //   const SizedBox(height: 30,),
                        _LoginForm(),
                        const SizedBox(height: 30,)
                      ],
                    )
                  ),
                  // const SizedBox(height: 50,),
                  // Consumer<AuthFormProvider>(
                  //   builder: (context, recoverForm, _) =>  TextButton(
                  //     onPressed: recoverForm.isLoading ? null : () {
                  //       Navigator.pushReplacementNamed(context, LoginScreen.pageRoute);
                  //     }, 
                  //     style: ButtonStyle(
                  //       overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1))
                  //     ),
                  //     child: const Text('Regresar', 
                  //     style: TextStyle(fontSize: 18, color: Colors.black87),),
                  //     ),
                  // ),
                  
                  const SizedBox(height: 300,)
                ],
              ),
            ),
            )
         ),
         
      ]),
      
    );
  }
}
class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recoverForm = Provider.of<AuthFormProvider>(context);
    return Container(
      child: Form(
        key: recoverForm.formKeyRestorPass,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // TODO: Mantener la referencia al KEY
        child: Column(
          children: [
            TextFormField(
              readOnly: recoverForm.isLoading ? true : false,
              onChanged: (value) => recoverForm.userEmail = value,
              
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecotations.authInputDecoration(
                hintText : 'enamil@ext.com',
                labelText: 'Correo electrónico',
                // prefixIcon: Icons.alternate_email_outlined
              ),
              validator: (value){
                return InternalValidations.emailValidator(value) ? null : 'Correo inválido';
              },
              ),
         
            const SizedBox(height: 30,),
            MaterialButton(
              onPressed: recoverForm.isLoading ? null : () async {
                if(!recoverForm.isValidRestorPass()) return;
                recoverForm.isLoading = true;
                final authService = Provider.of<AuthService>(context, listen: false);
                await Future.delayed(Duration(seconds: 2));
                final String? resetPassword = await authService.resetPassword(recoverForm.userEmail);
                await Future.delayed(Duration(seconds: 5));
                recoverForm.isLoading = false;
                // Navigator.pushReplacementNamed(context, LoginScreen.pageRoute);
              },
              disabledColor: Colors.grey,
              elevation: 0,
              color: AppTheme.darkBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Recuperar',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}