import 'package:flutter/material.dart';

class InputDecotations {
  static InputDecoration authInputDecoration(
    {required String hintText,
    required String labelText,
    IconData? prefixIcon
    }
  ){
    return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    hintStyle: const TextStyle(color: Colors.black26),
    labelStyle: const TextStyle(color: Colors.grey),
    enabledBorder:
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.deepPurple, width: 2),
    ),
    prefixIcon: prefixIcon != null ? Icon(prefixIcon, color:  Colors.deepPurple,) : null,
  );

  }
}
