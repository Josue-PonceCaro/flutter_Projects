import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ManualMarker extends StatelessWidget {
   
  const ManualMarker({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height,
      height: size.width,
      child: Stack(
        children: [
          Center(
            
            child: Transform.translate(
              offset: const Offset(0, 30),
              child: BounceInDown(
                from: 150,
                child: const Icon(Icons.location_on_rounded, size: 40,),
                ),
            ),
          )
        ],
      ),
    );
  }
}