import 'dart:async';

import 'package:app4/providers/providers.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/services/services.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/input_decorations.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class RestorePasswordScreen extends StatefulWidget {
  static const String pageRoute = 'Restore';
  const RestorePasswordScreen({Key? key}) : super(key: key);

  @override
  State<RestorePasswordScreen> createState() => _RestorePasswordScreenState();
}

class _RestorePasswordScreenState extends State<RestorePasswordScreen> {
  late StreamSubscription<bool> keyboardSubscription;
  bool keyboardState = false;
  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print('Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      keyboardState = visible;
      print('Keyboard visibility update. Is visible: $visible');
      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size areaScreen = MediaQuery.of(context).size;
    final recoverForm = Provider.of<AuthFormProvider>(context);
    return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: recoverForm.isLoading ? false : true,
            ),
            body: 
            Container(
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
                                    height: areaScreen.height * 0.15,
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
                                    height: areaScreen.height * 0.02,
                                  ),
                                  BrandingQaira(width: areaScreen.width,),
                                  SizedBox(
                                    // color: AppTheme.red,
                                    height: areaScreen.height * 0.15,
                                  ),
                                  // LOGO AND BUTTOM --------
                                                        
                                ],
                              ),
                              
                          
                        ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: keyboardState ? null : Padding(
              padding: EdgeInsets.symmetric(horizontal: areaScreen.width * 0.05),
              child: MaterialButton(
                  // onPressed: !registerForm.isValidRegister()
                  onPressed: recoverForm.isLoading
                      ? null
                      : () async {
    
                          if(!recoverForm.isValidRestorPass()) return;
                          recoverForm.isLoading = true;
                          final authService = Provider.of<AuthService>(context, listen: false);
                          // await Future.delayed(Duration(seconds: 2));
                          final String? resetPassword = await authService.resetPassword(recoverForm.userEmail);
                          // await Future.delayed(Duration(seconds: 5));
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
                          'Recuperar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  areaScreen.height * 0.025),
                        ),
                      ],
                    ),
                  ),
                ),
               ),
           
            );
   
  }
}
