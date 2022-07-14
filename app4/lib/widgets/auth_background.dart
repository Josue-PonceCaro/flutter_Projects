import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(children: [
        Positioned(
          top: 40,
          left: 20,
          child: _Bubble(),
        ),
        Positioned(
          top: 100,
          left: 220,
          child: _Bubble(),
        ),
        Positioned(
          top: 280,
          left: 250,
          child: _Bubble(),
        ),
        Positioned(
          top: 40,
          right: -20,
          child: _Bubble(),
        ),
        Positioned(
          bottom: -40,
          left: 20,
          child: _Bubble(),
        ),
      ]),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 153, 1),
          Color.fromRGBO(90, 70, 178, 1)
        ]),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(225, 225, 225, 0.05)
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(100),
          //   image: const DecorationImage(image: AssetImage('assets/hoja2.png'), fit: BoxFit.cover, opacity: 0.1),
          ),
    );
  }
}
