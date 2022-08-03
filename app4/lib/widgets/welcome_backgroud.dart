

import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  final Widget child;
  const WelcomeBackground({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppTheme.darkBlue,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: sizeScreen.height*0.7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                 Expanded(child: SizedBox(height: sizeScreen.height*0.05,)),
                 Expanded(
                   child: Image.asset(
                      'assets/logos/logoLimaWhite.png',
                      width: sizeScreen.width*0.4,
                      // height: width*0.05,
                    ),
                 ),
                 Expanded(child: SizedBox(height: sizeScreen.height*0.05,)),
                 Expanded(
                  flex: 3,
                   child: Image.asset(
                      'assets/generalPics/worldFull.png',
                      width: double.infinity,
                      // height: width*0.05,
                    ),
                 ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: sizeScreen.width*0.1),
                      child: Row(
                        children: [
                          Text('respira', style: TextStyle(height: 1, color: AppTheme.white, fontSize: sizeScreen.width*0.07, fontWeight: FontWeight.w500, ),),
                        ],
                      ),
                    ),
                    
                    ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: sizeScreen.width*0.1),
                      child: Row(
                        children: [
                          Text('limpio', style: TextStyle(height: 1, color: AppTheme.primaryOrange, fontSize: sizeScreen.width*0.18, fontWeight: FontWeight.w900,),),
                        ],
                      ),
                    )),
                ],
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: sizeScreen.height*0.7,
              ),
              child,
            ],
          ),

        ],
      ),
    );
  }
}

