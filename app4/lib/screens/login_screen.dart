import 'dart:async';

import 'package:app4/providers/providers.dart';
import 'package:app4/services/services.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:app4/screens/screens.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/ui/ui.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String pageRoute = 'Login';
  
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();

  
}

class _LoginScreenState extends State<LoginScreen> {

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
    // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    
    // print('-----------LOGIN--------------');
    // print(areaScreen.height);
    // print(areaScreen.width);
    // print(state);
    return ChangeNotifierProvider(
      create: (loginContext) => AuthFormProvider(),
      child: Consumer<AuthFormProvider>(
        builder: (context, loginFomr, _) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
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
                              descriptionText: 'Ingresa tus datos y empecemos a rutear.',
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
                                      key: loginFomr.formKeyLogin,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          
                                          TextFormField(
                                            onChanged: (value) =>
                                                loginFomr.userEmail = value,
                                            readOnly: loginFomr.isLoading
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
                                          SizedBox(
                                            height: areaScreen.height * 0.01,
                                          ),
                                          TextFormField(
                                      
                                            onChanged: (value) =>
                                                loginFomr.userPassword = value,
                                            readOnly: loginFomr.isLoading
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
                                          
                                          Container(
                                            // color: AppTheme.primaryOrange,
                                            height: 30,
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


                                          Container(
                                            height: 35,
                                            // color: AppTheme.red,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                    fillColor: MaterialStateProperty.all(AppTheme.blue),
                                                    value: Preferences.willRemenberData,
                                                    onChanged: (value) {
                                                      if (!loginFomr.isLoading){
                                                        Preferences.willRemenberData =
                                                            value ?? false;
                                                        setState(() {});
                                                      }
                                                    }),
                                                const Text(
                                                  'Recordar datos',
                                                  style: TextStyle(
                                                      color: AppTheme.black,
                                                      fontSize:
                                                          12),
                                                ),
                                                
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: areaScreen.height * 0.01,
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
                                                        // Navigator.pushNamed(context, RegisterScreen.pageRoute);
                                                        Navigator.pushReplacementNamed(context, RegisterScreen.pageRoute);
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  
                                  SizedBox(
                                    height: areaScreen.height * 0.01,
                                  ),
                                  // LOGO AND BUTTOM --------
                                  BrandingQaira(width: areaScreen.width,),
                                   
                                  // BUTTON USSED TO BE HERE
                                  
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
      
            // resizeToAvoidBottomInset: false,
            
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            


            // floatingActionButton: KeyboardVisibilityBuilder(builder: (context, visible) {
            //       return Text('iS VISIBLE????? $visible');
            floatingActionButton: keyboardState ? null : 
                  Padding(
              padding: EdgeInsets.symmetric(horizontal: areaScreen.width * 0.05),
              child: 
              MaterialButton(
                          // onPressed: !registerForm.isValidRegister()
                          onPressed: loginFomr.isLoading
                              ? null
                              : () async {
                      
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
                                    Preferences.isFirstTime = false;
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
                                  // await Future.delayed(Duration(seconds: 3));
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
            ),
                 
            
            
                
            
            ),
      ),
    );
   
  }
}
