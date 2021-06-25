import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.perm_contact_cal_rounded),
        title: Text("Inventario Rastreros"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            // width: width,
            child: Center(
                child: Text(
              'User: #001 Username',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Total Restreros Restantes'),
                Container(
                  height: 20,
                  width: 49,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(1),
                  child: Text(
                    '14',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            // margin: EdgeInsets.all(20),
            // color: Colors.orange,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(1),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text('Ubicacion'),
                      Container(
                        height: 20,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(1),
                        child: Text(
                          '0004-031-006',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ]),
                    Column(children: <Widget>[
                      Text('Pallet'),
                      Container(
                        height: 20,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(1),
                        child: Text(
                          '1020123',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ]),
                    Column(children: <Widget>[
                      Text('SKU'),
                      // Text('58203917'),
                      Container(
                        height: 20,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(1),
                        child: Text(
                          '58203917',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // padding: EdgeInsets.all(20),
                  child: Column(children: <Widget>[
                    Text('Descripcion'),
                    // Text('MENTA DE CHOCOLET 12b x 365g x 73u'),
                    Container(
                      height: 20,
                      width: 350,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(1),
                      child: Text(
                        'MENTA DE CHOCOLET 12b x 365g x 73u',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    child: Text(
                      'Corregir datos',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    // print('CORREGIR DATOS');
                    Navigator.of(context).pushNamed('/pg3');
                  },
                  // onPressed: _btncorregir2,
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.blue, width: 0.2)),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/pg4');
                    createAlert(context, 'Fecha de Vencimiento');
                  },
                  child: Column(children: <Widget>[
                    Text('Fecha de Vencimiento'),
                    Container(
                      height: 20,
                      width: 90,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(1),
                      child: Text(
                        '17-01-2021',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Text('VALIDAR')
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/pg4');
                    createAlert(context, 'N~ Cajas');
                  },
                  child: Column(children: <Widget>[
                    Text('Cajas'),
                    Container(
                      height: 20,
                      width: 90,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(1),
                      child: Text(
                        '30',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Text('VALIDAR'),
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/pg4');
                    createAlert(context, 'Unidades');
                  },
                  child: Column(children: <Widget>[
                    Text('Unidades'),
                    Container(
                      height: 20,
                      width: 90,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(1),
                      child: Text(
                        '11',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Text('VALIDAR')
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _btncorregir() {
    print('corregir');
  }
}

createAlert(BuildContext context, String data) {
  TextEditingController customCrontroller = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(data),
          content: TextField(
            controller: customCrontroller,
          ),
          actions: <Widget>[
            MaterialButton(
                elevation: 5.0,
                child: Text('Validar'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      });
}
