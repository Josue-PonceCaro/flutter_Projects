import 'dart:ui';

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
            child: CustomPaint(
              painter: _CircularPainter()),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 10, top: 40),
                height: sizeScreen.height * 0.5,
                width: double.infinity,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 40,),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      alignment: Alignment.bottomRight,
                      width: double.infinity,
                      child: Icon(Icons.near_me, color: AppTheme.lightGreen, size: 80,),
                    ),
                    const SizedBox(height: 105,),
                    const Text('respira', style: TextStyle(height: 1, color: AppTheme.white, fontSize: 35, fontWeight: FontWeight.w500, ),),
                    const Text('limpio', style: TextStyle(height: 1, color: AppTheme.primaryOrange, fontSize: 85, fontWeight: FontWeight.w900,),),
                  ],
                ),
                // color: AppTheme.primaryOrange,
              ),
              Container(
                height: sizeScreen.height * 0.5,
                width: double.infinity,
                color: AppTheme.darkBlue,
                child: Column(
                  children: [
                
                    Padding(
                      padding:  const EdgeInsets.only(left: 10, right: 10),
                      child: RichText(text: 
                        const TextSpan(
                          style:  TextStyle(
                          fontSize: 18,
                          color: AppTheme.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '¡Únete!', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' y conoce en tiempo real el estado del aire que respiras, mientras te diviertes al aire libre.')
                          ]
                        ),
                      ),
                    ),
                    SizedBox(height: sizeScreen.height * 0.15,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const[
                          Icon(Icons.nordic_walking, color: AppTheme.white,),
                          SizedBox(width: 20,),
                          Icon(Icons.pedal_bike, color: AppTheme.white,),
                          SizedBox(width: 20,),
                          Icon(Icons.directions_run, color: AppTheme.white,),
                          SizedBox(width: 115,),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  const [
                          
                         
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                          _SmallLine(),
                           SizedBox(width: 5,),
                           _SmallBol(),
                          ],
                      ),
                    ),
                    SizedBox(height: sizeScreen.height * 0.17,),
                    child,
                  ],
                ),
          ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class _SmallBol extends StatelessWidget {
  const _SmallBol({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 20,
      width: 10,
      decoration:  const BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10)
          )
        ),
                        
    );
  }
}

class _SmallLine extends StatelessWidget {
  const _SmallLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 3.5,
      width: 15,
      decoration:  const BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
          
        ),
                        
    );
  }
}


class _CircularPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final double paperHeigh = size.height;
    final double paperWidth = size.width;
    final pencil = Paint();

    // Properties

    pencil.color = AppTheme.gray80;
    pencil.style = PaintingStyle.stroke;
    pencil.strokeWidth = 1.5;
    final path = Path();
    // path.moveTo(paperWidth * 0.25, paperHeigh * 0.6);
    // path.quadraticBezierTo(paperWidth*0.5, paperHeigh*0.5, paperWidth * 0.75, paperHeigh * 0.6);

    const double initialVal = 150;
    const double upVal = 75;
    for (var i = 0; i < 5; i++) {
      canvas.drawCircle(Offset(paperWidth*0.5,paperHeigh*0.61), initialVal + upVal*i, pencil);
    }

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}