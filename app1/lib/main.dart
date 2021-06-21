import 'package:flutter/material.dart';
import 'package:app1/pages/principal_page.dart';
import 'package:app1/pages/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MyHome(),
        '/second': (BuildContext context) => secPage(),
      },
    );
  }
} 
//BUTTONS ---------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Type of buttons'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             IconButton(
//               onPressed: _onPressBtn1,
//               iconSize: 100,
//               icon: Icon(
//                 Icons.delete,
//               ),
//             ),
//             OutlinedButton(
//               onPressed: _onPressBtn2,
//               child: Text(
//                 'BTN2',
//                 style: (TextStyle(color: Colors.black)),
//               ),
//               style: TextButton.styleFrom(
//                   // primary: Colors.orange,
//                   backgroundColor: Colors.red.shade100,
//                   // shadowColor: Colors.black,
//                   // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   side: BorderSide(color: Colors.red)),
//             ),
//             //FlatButton-->>TextButton
//             TextButton(
//               child: Text(
//                 'BTN3',
//                 style: TextStyle(fontSize: 59),
//               ),
//               onPressed: _onPressBtn3,
//               style: ButtonStyle(
//                 side: MaterialStateProperty.all(
//                     BorderSide(color: Colors.black, width: 2)),
//                 backgroundColor: MaterialStateProperty.all(Colors.green),
//                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20))),
//               ),
//             ),
//             TextButton(
//                 onPressed: _onPressBtn3,
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//                   color: Colors.black,
//                   child: Text('BTN3.2'),
//                 )),
//             //RaisedButton -->> ElevatedButton
//             ElevatedButton(
//               onPressed: _onPressBtn4,
//               child: Text('BTN4.2'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orange,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.black),
//                 padding: MaterialStateProperty.all(EdgeInsets.all(30)),
//                 // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 49, fontWeight: FontWeight.bold)
//               ),
//               onPressed: _onPressBtn4,
//               child: Text(
//                 'BTN4',
//                 style: TextStyle(
//                     color: Colors.green,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w200),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onPressBtn1() {
//     print('tbn 1');
//   }

//   void _onPressBtn2() {
//     print('tbn 2');
//   }

//   void _onPressBtn3() {
//     print('btn 3');
//   }

//   void _onPressBtn4() {
//     print('btn4');
//   }
// }
// GESTURE DETECTION -----------------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Gesture Detector', home: MyHome());
//   }
// }

// class MyHome extends StatefulWidget {
//   MyHome({Key? key}) : super(key: key);

//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gesture Detector'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             ListItems(),
//             ListItems(),
//             ListItems(),
//             ListItems(),
//             ListItems(),
//             ListItems(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ListItems extends StatelessWidget {
//   const ListItems({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _onTap,
//       onLongPress: _onLongPress,
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Row(
//           children: <Widget>[
//             Icon(
//               Icons.folder,
//               color: Colors.red,
//               size: 30,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               'Mis Videos',
//               style: TextStyle(
//                   fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _onTap() {
//     print('HOla');
//   }

//   void _onLongPress() {
//     print('Se ha mantenido el click');
//   }
// }
// STATEFULL WIDGET ---------------------------------------------------------
// import 'dart:async';

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Material App', home: MyHome());
//   }
// }

// class MyHome extends StatefulWidget {
//   MyHome({Key? key}) : super(key: key);

//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   String name = 'Ariana';
//   int a = 10;
//   double aa = 10;
//   int s = 0;
//   bool ss = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Text(
//               name,
//               style: TextStyle(
//                   fontSize: aa, color: Color.fromARGB(200, a, a + 99, a + 99)),
//             ),
//             LinearProgressIndicator(
//               value: aa / 220,
//               color: Color.fromARGB(200, a + 99, a, a + 99),
//             ),
//             Switch(
//                 value: ss,
//                 onChanged: (value) {
//                   setState(() {
//                     this.ss = value;
//                   });
//                 },
//                 activeColor: Color.fromARGB(200, 200, 100, 230))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: (Icon(
//           Icons.adb,
//         )),
//         onPressed: changeSize,
//       ),
//     );
//   }

//   void changeSize() {
//     setState(() {
//       if (s == 0) {
//         a = a + 10;
//         aa = aa + 10;
//         if (a > 150) {
//           s = 1;
//         }
//       } else if (s == 1) {
//         a = a - 10;
//         aa = aa - 10;
//         if (a < 20) {
//           s = 0;
//         }
//       }

//       // if (name == 'Mark') {
//       //   name = 'Odin';
//       // } else {
//       //   name = 'Mark';
//       // }
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer.periodic(Duration(milliseconds: 10), (value) {
//       changeSize();
//     });
//   }
// }

// ALL ABOUT FOUNTS--- Need to uncomment the font section in pubspec.yaml-----------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       theme: ThemeData(fontFamily: 'orbitron'),
//       home: MyHome(),
//     );
//   }
// }

// class MyHome extends StatelessWidget {
//   const MyHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Material App Bar'),
//       ),
//       body: Center(
//         child: Container(
//           child: Text(
//             """Lorem ipsum dolor sit amet consectetur adipiscing, elit consequat vel id accumsan mattis, parturient felis dis nisi diam. A placerat vestibulum conubia est enim ullamcorper, hac montes sagittis eros orci metus, sollicitudin id eget neque varius. Proin congue hendrerit primis velit mollis vitae cursus fermentum luctus nulla ad risus tortor, morbi vestibulum habitasse tempor egestas convallis phasellus nibh nisl litora mauris elementum.

// Congue velit volutpat luctus facilisi felis mi, gravida phasellus cubilia per auctor, vulputate metus habitasse nunc feugiat. Ad metus facilisi enim integer morbi nibh auctor, venenatis cras sollicitudin nisl luctus elementum, magnis mauris aliquam sagittis nisi pretium. Arcu lectus eleifend risus in augue himenaeos porttitor laoreet, natoque mus nulla erat ante vitae lacus morbi convallis, vel montes dictumst ac sodales facilisis tellus.""",
//             style: TextStyle(fontFamily: 'dance'),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Image using assets------------------------  uncomment assets from pubspec.yaml-----
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: MyHome(),
//     );
//   }
// }

// class MyHome extends StatelessWidget {
//   const MyHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Material App Bar'),
//       ),
//       body: ListView(
//         //To include an asset, is important to declarate the pic into the pubspec.yaml file.
//         children: <Widget>[
//           Image.asset(
//             'assets/yahoo.png',
//             scale: 4,
//           ),
//           Image.asset(
//             'assets/google.png',
//             scale: 3,
//           ),
//           Image.asset(
//             'assets/google.png',
//             scale: 2,
//           ),
//           Image.asset(
//             'assets/google.png',
//             scale: 1,
//           ),
//           Image.asset(
//             'assets/google.png',
//             scale: 2,
//           ),
//           Image.asset(
//             'assets/google.png',
//             scale: 3,
//           ),
//           Image.asset(
//             'assets/yahoo.png',
//             scale: 4,
//           )
//         ],
//       ),
//     );
//   }
// }

// LISTVIEW.BUILDER - CONTACTS  -----------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);
//   List<String> names = [
//     'pepe',
//     'juan',
//     'manuel',
//     'pedro',
//     'juaking',
//     'pepe',
//     'juan',
//     'manuel',
//     'pedro',
//     'juaking',
//     'pepe',
//     'juan',
//     'manuel',
//     'pedro',
//     'juaking',
//     'pepe',
//     'juan',
//     'manuel',
//     'pedro',
//     'juaking',
//     'manuel',
//     'pedro',
//     'juaking',
//     'pepe',
//     'juan',
//     'manuel',
//     'pedro',
//     'juaking',
//     'pepe',
//     'juan',
//     'manuel',
//     'pedro',
//     'juaking',
//     'pepe',
//     'juan',
//     'manuel',
//     'pedro',
//     'juaking'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Material App Bar'),
//       ),
//       body: ListView.builder(
//         itemCount:
//             names.length, //important define the itemCount, or it be infinite
//         itemBuilder: (BuildContext context, int index) {
//           final name = names[index];
//           return ListTile(
//             title: Text(name),
//             leading: Icon(Icons.person),
//             onTap: () {
//               print(name);
//             },
//           );
//           // return Card(child: Text(name));
//         },
//       ),
//     );
//   }
// }
//LISTVIEW.BUILDER - SHOWING IMAGES------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Material App Bar'),
//       ),
//       body: ListView.builder(
//         itemCount: 50,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: Image.network(
//               'https://picsum.photos/id/$index/400/200',
//               height: 200,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// NORMAL LISTVIEW-----------------------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: ListView(
//           children: <Widget>[
//             Card(
//               child: Image.network(
//                   'https://modaellos.com/wp-content/uploads/2020/02/hombre-pelo-largo.png'),
//             ),
//             Card(
//               child: Image.network(
//                   'https://1.bp.blogspot.com/-kHsDa4QM-hA/W-XDxyZBbFI/AAAAAAAADEk/UML7OKMma6ALgjMU_rFJtqCtW6OOBFSewCLcBGAs/s1600/adioss.jpg'),
//             ),
//             Card(
//               child: Image.network(
//                   'https://dm.henkel-dam.com/is/image/henkel/600x800_seitenansicht-mann-mit-langem-haar-zum-zopf-wcms-es?scl=1&fmt=jpg'),
//             ),
//             Card(
//               child: Image.network(
//                   'https://ath2.unileverservices.com/wp-content/uploads/sites/5/2019/02/peinados-para-hombres-con-cabello-largo-680x1024.jpg'),
//             ),
//             Card(
//               child: Image.network(
//                   'https://dallas1343.blob.core.windows.net/images/peinado-cabello-largo-hombre-trenzas-pelo-largo-hombres-pelo-largo-B8A51810ierpby.jpg'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ALL ABOUT COLOR--------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Center(
//           child: Container(
//             // color: Colors.orange[800],
//             // color: Color(0xaf601090),
//             // color: Color.fromRGBO(200, 50, 20, 0.4),
//             color: Color.fromARGB(100, 200, 0xf0, 200),
//             height: 300,
//             width: 300,
//           ),
//         ),
//       ),
//     );
//   }
// }
// margin and padding----------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Margin and paddfing'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             width: 200,
//             height: 200,
//             color: Colors.orange,
//             margin: EdgeInsets.all(10),
//             padding: EdgeInsets.all(40),
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Text(
//                   '----',
//                   style: TextStyle(
//                       backgroundColor: Colors.black,
//                       fontSize: 40,
//                       color: Colors.white),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   '----',
//                   style: TextStyle(
//                       backgroundColor: Colors.black,
//                       fontSize: 40,
//                       color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//COLUMN AND ROWS----------------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text("ACTIVAR SONIDO"),
//                   Switch(value: true, onChanged: (value) {}),
//                 ],
//               ),
//               Divider(),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                       child: Text(
//                           "HABILITAR CAMARA")), // Expanded to take the rest os the space
//                   Switch(value: true, onChanged: (value) {}),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     color: Colors.amber,
//                     width: 50,
//                     height: 100,
//                   ),
//                   Container(
//                     color: Colors.black54,
//                     width: 50,
//                     height: 90,
//                   ),
//                   Container(
//                     color: Colors.amber,
//                     width: 50,
//                     height: 80,
//                   ),
//                   Container(
//                     color: Colors.black87,
//                     width: 50,
//                     height: 70,
//                   ),
//                   Container(
//                     color: Colors.amber,
//                     width: 50,
//                     height: 60,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// widget colums -----------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: SizedBox(
//           width: double.infinity,
//           child: Column(
//             //CTRL + SHIFT + R ->WRAP WITH CONTAINER, CHANGE THE NAME TO SizeBox
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Container(
//                 color: Colors.black,
//                 height: 50,
//                 width: 300,
//               ),
//               Image.network(
//                 'https://steamuserimages-a.akamaihd.net/ugc/960839410053852976/1EBF684CCC615EEE325D2E342F1BEB81F29ACA33/',
//                 height: 120,
//                 fit: BoxFit.fill,
//               ),
//               Image.network(
//                 'https://www.icegif.com/wp-content/uploads/car-icegif-6.gif',
//                 height: 120,
//                 fit: BoxFit.cover,
//               ),
//               Image.network(
//                 'https://thumbs.gfycat.com/FlatGrouchyGodwit-size_restricted.gif',
//                 height: 120,
//                 fit: BoxFit.cover,
//               ),
//               Container(
//                 color: Colors.black87,
//                 height: 10,
//                 width: 300,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ABOUT APPBAR ------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//           actions: <Widget>[
//             IconButton(onPressed: _add, icon: Icon(Icons.add)),
//             IconButton(onPressed: _remove, icon: Icon(Icons.remove))
//           ],
//           elevation: 20,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.elliptical(250, 5))),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: _um,
//           ),
//         ),
//         body: Center(),
//       ),
//     );
//   }

//   void _add() {
//     print('add');
//   }

//   void _remove() {
//     print('remove');
//   }

//   void _um() {
//     print('umbrella clicked');
//   }
// }

// about scaffold-------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Center(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             print("ADD");
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.black,
//           ),
//         ),
//         drawer: Drawer(
//           child: Text("hola"),
//         ),
//         endDrawer: Drawer(
//           child: Text('hola end drawer'),
//         ),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Center(
//           child: IconButton(
//             icon: Icon(
//               Icons.close,
//               color: Colors.blue,
//             ),
//             iconSize: 200,
//             onPressed: () {
//               print('hola mundo');
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// EXAMPLE ICONS 1---------------------------------------------------------------------------------
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Center(
//           child: Icon(
//             Icons.beach_access,
//             size: 120,
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }
// EXAMPLE IMAGENES 1---------------------------------------------------------------------------------

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Center(
//           child: Container(
//             child: Image.network(
//               "https://www.revistaneo.com/sites/default/files/inline-images/Mazda%203%20Turbo%202021%2002.jpg",
//               height: 100,
//               width: 400,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// EXAMPLE 1---------------------------------------------------------------------------------
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
//         primarySwatch: Colors.red,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text('Hi world',
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.amber,
//                 backgroundColor: Colors.black)),
//       ),
//     );
//   }
// }
