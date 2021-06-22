// STATEFULL WIDGET ---------------------------------------------------------
import 'dart:async';
// import 'dart:html';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String name = 'Ariana';
  int a = 10;
  double aa = 10;
  int s = 0;
  bool ss = false;
  List<String> ubicaciones = [
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006',
    '004-031-006'
  ];
  List<String> pallet = [
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1',
    '200-600-1'
  ];
  List<String> sku = [
    '58207109',
    '58207109',
    '58207109',
    '58207109',
    '58207109',
    '58207109',
    '58207109',
    '58207109',
    '7940513',
    '7940513',
    '7940513',
    '7940513',
    '7940513',
    '7940513',
    '7940513'
  ];
  List<String> descripcion = [
    'MENTA DE CHOCOLET 12b x 365g x 73u',
    'ACEITE DE MAIZ 12 x 900ml',
    'GOLPE 6d x 600g x 24u',
    'BOLSON PIÑATERO 12b x 426g',
    'CHUPETE TAFI 12b x 500g x 250u',
    'MENTA DE CHOCOLET 12b x 365g x 73u',
    'ACEITE DE MAIZ 12 x 900ml',
    'GOLPE 6d x 600g x 24u',
    'BOLSON PIÑATERO 12b x 426g',
    'CHUPETE TAFI 12b x 500g x 250u',
    'MENTA DE CHOCOLET 12b x 365g x 73u',
    'ACEITE DE MAIZ 12 x 900ml',
    'GOLPE 6d x 600g x 24u',
    'BOLSON PIÑATERO 12b x 426g',
    'CHUPETE TAFI 12b x 500g x 250u'
  ];
  List<String> fv = [
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021',
    '17-04-2021'
  ];
  List<String> cajas = [
    '10',
    '11',
    '12',
    '4',
    '3',
    '12',
    '9',
    '15',
    '1',
    '11',
    '0',
    '15',
    '10',
    '5',
    '10'
  ];
  List<String> unidades = [
    '3',
    '0',
    '0',
    '5',
    '7',
    '0',
    '0',
    '11',
    '2',
    '0',
    '13',
    '0',
    '1',
    '0',
    '0'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.perm_contact_cal_rounded),
        title: Text("Inventario Rastreros"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    onPressed: _homebtn,
                    icon: Icon(Icons.home),
                    iconSize: 80,
                  ),
                  IconButton(
                    onPressed: _historybtn,
                    icon: Icon(Icons.history),
                    iconSize: 80,
                  ),
                ],
              ),
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: aa, color: Color.fromARGB(200, a, a + 99, a + 99)),
            ),
            LinearProgressIndicator(
              value: aa / 220,
              color: Color.fromARGB(200, a + 99, a, a + 99),
            ),
            Switch(
                value: ss,
                onChanged: (value) {
                  setState(() {
                    this.ss = value;
                  });
                },
                activeColor: Color.fromARGB(200, 200, 100, 230)),
            Expanded(
              child: ListView.builder(
                itemCount: ubicaciones.length,
                itemBuilder: (BuildContext context, int index) {
                  final ubicacion = ubicaciones[index];
                  return ListTile(
                    title: Text(ubicacion),
                    leading: Icon(Icons.person),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: (Icon(
          Icons.adb,
        )),
        onPressed: changeSize,
      ),
    );
  }

  void changeSize() {
    setState(() {
      if (s == 0) {
        a = a + 10;
        aa = aa + 10;
        if (a > 150) {
          s = 1;
        }
      } else if (s == 1) {
        a = a - 10;
        aa = aa - 10;
        if (a < 20) {
          s = 0;
        }
      }

      // if (name == 'Mark') {
      //   name = 'Odin';
      // } else {
      //   name = 'Mark';
      // }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (value) {
      changeSize();
    });
  }

  void _homebtn() {
    print("HOME PAGE BTN");
  }

  void _historybtn() {
    print("HISTORY BTN");
  }
}

//----------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Homesdd Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
