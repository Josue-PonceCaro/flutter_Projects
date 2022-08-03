
import 'package:app4/delegates/delegates.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
   
  const SearchBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: Colors.white,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: SearchDestinationDelegate());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [BoxShadow(
                color: AppTheme.black,
                blurRadius: 5,
                offset: Offset(0,5),
                )]
            ),
            child: const Text('Donde quieres ir?', style: TextStyle(color: AppTheme.black),),
          ),
        ),
      ),
    );
  }
}




