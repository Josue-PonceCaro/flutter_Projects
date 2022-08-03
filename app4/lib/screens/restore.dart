import 'package:app4/providers/providers.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/services/services.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/input_decorations.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Restorex extends StatelessWidget {
  static const String pageRoute = 'Restorex';
  const Restorex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size areaScreen = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (restoreContext) => AuthFormProvider(),
      child: Consumer<AuthFormProvider>(
        builder: (context, recoverForm, _) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: recoverForm.isLoading ? false : true,
            ),
            body: Container(
              color: AppTheme.white,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: areaScreen.width * 0.05),
                child: Stack(
                  // alignment: AlignmentDirectional.topEnd,
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
                            color: AppTheme.white,
                            height: areaScreen.height * 0.15,
                            width: double.infinity,
                            child: WelcomeText(
                              hightSize: areaScreen.height,
                              welcomeText: '¡Hola!',
                              descriptionText: 'Ingresa tu correo para recuperar tu cuenta.',
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SingleChildScrollView(

                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    // color: AppTheme.red,
                                    height: areaScreen.height * 0.2,
                                  ),
                                  // FORM -------------
                                  Container(
                                    // height: areaScreen.height * 0.504,
                                    color: AppTheme.white,
                                    width: double.infinity,
                                    child: Form(
                                      key: recoverForm.formKeyRestorPass,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          
                                          TextFormField(
                                            onChanged: (value) =>
                                                recoverForm.userEmail = value,
                                            readOnly: recoverForm.isLoading
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
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                  
                                  SizedBox(
                                    height: areaScreen.height * 0.2,
                                  ),
                                
                                  // LOGO AND BUTTOM --------
                                  Column(
                                    children: [
                                      BrandingQaira(width: areaScreen.width,),
                                      SizedBox(
                                        height: areaScreen.height * 0.03,
                                      ),
                                      MaterialButton(
                                        // onPressed: !registerForm.isValidRegister()
                                        onPressed: recoverForm.isLoading
                                            ? null
                                            : () async {
                         
                                                if(!recoverForm.isValidRestorPass()) return;
                                                recoverForm.isLoading = true;
                                                final authService = Provider.of<AuthService>(context, listen: false);
                                                await Future.delayed(Duration(seconds: 2));
                                                final String? resetPassword = await authService.resetPassword(recoverForm.userEmail);
                                                await Future.delayed(Duration(seconds: 5));
                                                recoverForm.isLoading = false;
                                              },
                                        disabledColor: AppTheme.gray50,
                                        elevation: 0,
                                        color: AppTheme.blue,
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
                                                'Iniciar sesión',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        areaScreen.height * 0.025),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ), 
                                  
                                  SizedBox(
                                    // color: AppTheme.red,
                                    height: areaScreen.height * 0.02,
                                  ),                           
                                ],
                              ),
                              
                          
                        ),
                  ],
                ),
              ),
            )),
      ),
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