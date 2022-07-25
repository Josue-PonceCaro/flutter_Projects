import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 100),
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        // height: 300, // TODO: DELETE
        decoration: _createCardShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(31, 180, 92, 92),
                offset: Offset(0, 0),
                blurRadius: 0),
          ]);
}