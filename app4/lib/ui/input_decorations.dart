import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';

class InputDecotations {
  static InputDecoration authInputDecoration(
    {required String hintText,
    required String labelText,
    IconData? prefixIcon,
    IconData? sufixIcon
    }
  ){
    return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    hintStyle: const TextStyle(color: Colors.black26),
    labelStyle: const TextStyle(color: Colors.grey),
    // enabledBorder:
    //     const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
    // focusedBorder: const UnderlineInputBorder(
    //   borderSide: BorderSide(color: AppTheme.black, width: 2),
    // ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppTheme.black, width: 1),
    ),
    prefixIcon: prefixIcon != null ? Icon(prefixIcon, color:  AppTheme.black,) : null,
    suffixIcon: sufixIcon != null ? Icon(sufixIcon, color:  AppTheme.black,) : null,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ) 
    );

  }
}
