import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  void buttonPlus() {
    counter++;
    setState(() {});
  }
  void buttonMinus() {
    counter--;
    setState(() {});
  }
  void buttonReset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30, color: Colors.blue);

    return Scaffold(
      // ignore: avoid_print
      appBar: AppBar(
        title: const Text('Sample Code'),
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            const Text(
              'All numbers',
              style: fontSize30,
            ),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(plusFunction: buttonPlus,minusFunction:buttonMinus,resetFunction:buttonReset ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function plusFunction, minusFunction,resetFunction;
  const CustomFloatingActions({
    Key? key, required this.plusFunction,required this.minusFunction,required this.resetFunction,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => minusFunction(),
          child: const Icon(Icons.exposure_minus_1_outlined),
          
          // onPressed: () => setState(() {counter--;}),
        ),
        // const SizedBox(width: 60,),
        FloatingActionButton(
          onPressed: ()=> resetFunction(),
          child: const Icon(Icons.restart_alt_outlined),
        ),
        // const SizedBox(width: 60,),
        FloatingActionButton(
          onPressed: () =>plusFunction(),
          child: const Icon(Icons.exposure_plus_1_outlined),
        ),
      ],
    );
  }
}
