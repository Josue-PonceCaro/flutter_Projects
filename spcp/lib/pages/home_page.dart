import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  static String pageRoute = 'homePage';
  @override
  Widget build(BuildContext context) {
    const Color principalColor = Color.fromRGBO(26, 71, 138, 1);
    return Scaffold(
      // appBar: AppBar(
        
      //   backgroundColor: const Color.fromRGBO(26, 71, 138, 1),
      //   title: 
      //   const Text('Sociedad Peruana de Ciencia Política')
         
          
      // ),
      body:  Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         // mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Container(
            //  height: 160,
             width: double.infinity,
            //  width: 500,
             color: principalColor,
             child: Column(
               children:  const [
                //  Image.asset(
                   
                //    'assets/logo/spcp_logo.jpeg',
                //    height: 130,
                //    width: 130,
                //    fit: BoxFit.cover,
                //    ),
                 Text('S P C P', 
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w100,
                  ),
                ),
                 Text('Sociedad Peruana de Ciencia Política', 
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w100
                  ),
                ),
             ],
             ),
           ),
          Container(
            color: Colors.white,
            height: 500,
            width: double.infinity,
            child: Row(
              children:  [
              Container(
                padding: const  EdgeInsets.only(left: 20),
                width: 600,
                child: const Text('Somos una asociación sin fines de lucro que agrupa a estudiantes y egresados afines a la carrera de Ciencia Política a nivel nacional. Buscamos contribuir al desarrollo académico, promover la cultura política y consolidar la carrera de Ciencia Política en el Perú.', 
                 style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w100
                  ),
                ),
              ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            height: 100,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('IG: https://www.instagram.com/sociedadperuanacp/', 
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(height: 10,),
                Text('linkedin: https://www.linkedin.com/company/sociedadperuanacp/mycompany/', 
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w100
                  ),
                ),
              ],
            ),

          ),

         ],
        ),
      ),
    );
  }
}