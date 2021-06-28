import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class Page5 extends StatefulWidget {
  Page5({Key? key}) : super(key: key);

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  bool ocrInit = false;
  @override
  void initState() {
    // TODO: implement initState
    FlutterMobileVision.start().then((value) {
      ocrInit = true;
    });
    super.initState();
  }

  _startScan() async {
    List<OcrText> list = [];
    try {
      list = await FlutterMobileVision.read(
        waitTap: true,
        fps: 5,
      );
      for (OcrText text in list) {
        print('value is ${text.value}');
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: _startScan,
      onTap: () {
        _startScan();
      },
      child: Container(
        child: Text('INIT CAMERA'),
      ),
    );
  }
}
