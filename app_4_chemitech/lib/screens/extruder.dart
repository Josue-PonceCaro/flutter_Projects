import 'package:flutter/material.dart';

class ExtruderScreen extends StatelessWidget {
   static String pageRoute = 'Extruder';
  const ExtruderScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/bg1.png',
                    fit: BoxFit.fill,
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('CONTROL PANEL'),
                          Container(
                            margin: const EdgeInsets.all(3),
                            // padding: const EdgeInsets.all(1),
                            height: 35,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  // TextFormField(
                                    
                                  // ),
                                  _SearchIcons(icon: Icons.arrow_drop_down,),
                                  _SearchIcons(icon: Icons.save_alt,),
                                  _SearchIcons(icon: Icons.history,),
                                 
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
          ),
      ),
    );
  }
}

class _SearchIcons extends StatelessWidget {
  final IconData icon;
  const _SearchIcons({
    Key? key, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(2),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white
      ),
      child: Icon(icon, size: 20,),
    );
  }
}