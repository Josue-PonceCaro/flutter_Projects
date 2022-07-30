import 'dart:async';

import 'package:app4/providers/providers.dart';
import 'package:app4/services/auth_service.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/input_decorations.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String pageRoute = 'Register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  bool _hidePass = true;
  @override
  Widget build(BuildContext context) {
    final Size areaScreen = MediaQuery.of(context).size;
    print('---------REGISTER----------------');
    print(areaScreen.height);
    print(areaScreen.width);
    // final registerForm = Provider.of<AuthFormProvider>(context);
    return ChangeNotifierProvider(
      create: (registerContext) => AuthFormProvider(),
      child: Consumer<AuthFormProvider>(
        builder: (context, registerForm, _) =>
        Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: registerForm.isLoading ? false : true,
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
                              welcomeText: 'Crear cuenta',
                              descriptionText: 'Ingresa tus datos para empezar.',
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
                                            obscureText: _hidePass,
                                            style: const TextStyle(
                                                color: Colors.deepPurple),
                                            decoration: InputDecoration(
                                              // isDense: true, 
                                              // contentPadding: EdgeInsets.fromLTRB(5, 5, 10, 0),
                                              hintText: '••••••••',
                                              labelText: 'Contrasenha',
                                              hintStyle: const TextStyle(color: Colors.black26),
                                              labelStyle: const TextStyle(color: Colors.grey),
                                          
                                              focusedBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                borderSide: BorderSide(color: AppTheme.black, width: 1),
                                              ),
                                              suffixIcon:  IconButton(
                                                onPressed: (){
                                                  setState(() {
                                                    _hidePass =! _hidePass;
                                                  });
                                                },
                                                 icon: Icon(_hidePass ? Icons.visibility_off : Icons.visibility, color:  AppTheme.black,)),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ) 
                                              ),
                                        

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
                                                  fillColor: MaterialStateProperty.all(AppTheme.blue),
                                                  value: Preferences.areTermsAccepted,
                                                  onChanged: (value) {
                                                    if (!registerForm.isLoading){
                                                      Preferences.areTermsAccepted =
                                                          value ?? false;
                                                      setState(() {});
                                                    }
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
                                  
                                  SizedBox(
                                    height: areaScreen.height * 0.01,
                                  ),
                                  BrandingQaira(width: areaScreen.width,),
                                  // LOGO AND BUTTOM --------
                                  
                                  
                                  SizedBox(
                                    // color: AppTheme.red,
                                    height: areaScreen.height * 0.15,
                                  ),                           
                                ],
                              ),
                              
                          
                        ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            floatingActionButton: keyboardState ? null:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: areaScreen.width *0.05),
              child: MaterialButton(
                                        // onPressed: !registerForm.isValidRegister()
                                        onPressed: registerForm.isLoading
                                            ? null
                                            : () async {
                                                FocusScope.of(context).unfocus();
                                                if (!registerForm.isValidRegister())
                                                  return;
                                                if (!Preferences.areTermsAccepted) return;
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

                                                // await Future.delayed(
                                                //     Duration(seconds: 2));

                                                if (errorMsg == null) {
                                                  // Navigator.pushReplacementNamed(context, LoadingScreen.pageRoute);
                                                  final String? token =
                                                      await authService.loginUser(
                                                          registerForm.userEmail,
                                                          registerForm.userPassword);

                                                  if (token != null) {
                                                    Preferences.isFirstTime = false;
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
                                                registerForm.isLoading = false;
                                                if (errorMsg == null) {
                                                  Navigator.pushReplacementNamed(
                                                      context,
                                                      LoadingScreen.pageRoute);
                                                      // SettingsScreen.pageRoute);
                                                }
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
                                      
               )
            ,      
       
            ),
      
      
      
      ),
    );
  }
}