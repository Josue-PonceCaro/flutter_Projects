import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'Ariana';
    int a = 10;
    double aa = 10;
    int s = 0;
    bool ss = false;
    double hs = 40;
    double hx = 20;
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
    List<String> pallets = [
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
    List<String> skus = [
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
    List<String> descripcions = [
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
    List<String> fvs = [
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

    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.perm_contact_cal_rounded),
        title: Text(
          '''Inventario
    Rastrero''',
          style: TextStyle(fontSize: 16),
        ),

        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print('qaira');
            },
            child: Image.asset(
              'assets/Qaira.png',
              scale: 5,
            ),
          ),
          GestureDetector(
            onTap: () {
              print('ransa');
            },
            child: Image.asset(
              'assets/Ransa.png',
              scale: 4,
            ),
          ),
        ],
        elevation: 20,
      ),
      body: Center(
        child: Column(
          children: [
            // Container(
            //   // decoration: BoxDecoration(border: Border.all(width: 1)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     // crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: <Widget>[
            //       IconButton(
            //         // color: Colors.red,
            //         onPressed: _homebtn,
            //         icon: Icon(Icons.home),
            //         iconSize: 50,
            //       ),
            //       IconButton(
            //         onPressed: _historybtn,
            //         icon: Icon(Icons.history),
            //         iconSize: 50,
            //       ),
            //     ],
            //   ),
            // ),

            // LinearProgressIndicator(
            //   value: aa / 220,
            //   color: Color.fromARGB(200, a + 99, a, a + 99),
            // ),

            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    height: hx,
                    // color: Colors.red,
                    child: Icon(Icons.widgets_outlined),
                  ),
                  // Icon(Icons.ballot_rounded),
                  Container(
                    height: hx,
                    child: Text('ubicacion',
                        style: (TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w800))),
                  ),
                  Container(
                    height: hx,
                    child: Text('pallet',
                        style: (TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w800))),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: hx,
                    child: Text('sku',
                        style: (TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w800))),
                  ),
                  // Text(descripcion),
                  // Text(fv),
                  // Text(caja),
                  // Text(pallet),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ubicaciones.length,
                itemBuilder: (BuildContext context, int index) {
                  final ubicacion = ubicaciones[index];
                  final pallet = pallets[index];
                  final sku = skus[index];
                  final descripcion = descripcions[index];
                  final fv = fvs[index];
                  final caja = cajas[index];
                  final unidad = unidades[index];
                  return GestureDetector(
                    onTap: () {
                      // print('object');
                      Navigator.of(context).pushNamed('/pg2');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          height: hs,
                          // color: Colors.red,
                          child: Icon(
                            Icons.widgets_rounded,
                            size: 20,
                          ),
                        ),
                        Container(
                          height: hs,
                          child: Text(ubicacion,
                              style: (TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400))),
                        ),
                        Container(
                          height: hs,
                          child: Text(pallet,
                              style: (TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400))),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          height: hs,
                          child: Text(sku,
                              style: (TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400))),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: (Icon(
          Icons.history_toggle_off_rounded,
        )),
        onPressed: () {
          Navigator.of(context).pushNamed('/pg4');
        },
      ),
    );
  }
}
