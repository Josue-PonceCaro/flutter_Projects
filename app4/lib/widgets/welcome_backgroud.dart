import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
   
  const WelcomeBackground({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Color.fromRGBO(3, 26, 55, 1),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: const [
            _CirclesLines(),
          ],
        ),
      ),
    );
  }
}

class _CirclesLines extends StatelessWidget {
  const _CirclesLines({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 60,
      child: Stack(children: [
        _Circles()
      ],),
      );
  }
}

class _Circles extends StatelessWidget {
  const _Circles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Colors.grey
      ),
    );
  }
}