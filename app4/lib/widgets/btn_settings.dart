import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BtnSettings extends StatelessWidget {
  const BtnSettings({
    Key? key,
    required GlobalKey<ScaffoldState> globalKey,
  }) : _globalKey = globalKey, super(key: key);

  final GlobalKey<ScaffoldState> _globalKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  ElasticInLeft(
        child: CircleAvatar(
          maxRadius: 25,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(
              Icons.list,
              size: 30,
              color: Colors.black,
              ),
            onPressed: () {
              print('oPen DRAWER....');
              _globalKey.currentState?.openDrawer();
            }, ),
        ),
      ),
    );
  }
}



