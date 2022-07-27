import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
void main() {
  final oneRow = <String, dynamic>{
    "id": "4827951_0",
    "name": "Avenida V\u00eda de Evitamiento",
    "type": "highway", "id_node_1": "31035815",
    "id_node_2": "31035816",
    "lat_node_1": "-12.0365063",
    "lon_node_1": "-77.0120278",
    "lat_node_2": "-12.0378127",
    "lon_node_2": "-77.0135433", 
    "PM25_predicted": 94.36153566760507,
    "PM10_predicted": 91.46717111250356,
    "enabled": true};
  
  final rows = <Map<String, dynamic>>[
    {"id": "4827949_8",
     "name": "Avenida V\u00eda de Evitamiento",
     "type": "highway", "id_node_1": "1367679653",
     "id_node_2": "273411492",
     "lat_node_1": "-12.0326084",
     "lon_node_1": "-77.0063621", 
     "lat_node_2": "-12.0319524", 
     "lon_node_2": "-77.0050903", 
     "PM25_predicted": 91.11885269937312, 
     "PM10_predicted": 154.45539501071832, 
     "enabled": true},
    {"id": "4827951_0",
     "name": "Avenida V\u00eda de Evitamiento",
     "type": "highway", "id_node_1": "31035815",
     "id_node_2": "31035816",
     "lat_node_1": "-12.0365063",
     "lon_node_1": "-77.0120278",
     "lat_node_2": "-12.0378127",
     "lon_node_2": "-77.0135433",
     "PM25_predicted": 94.36153566760507,
     "PM10_predicted": 91.46717111250356,
     "enabled": true},
  ];
  for (int i = 0; i < rows.length; i++) {
    double lat1 = double.parse(rows[i]['lat_node_1']);
    double lon1 = double.parse(rows[i]['lon_node_1']);
    double lat2 = double.parse(rows[i]['lat_node_1']);
    double lon2 = double.parse(rows[i]['lon_node_2']);
    LatLng point1 = LatLng(lat1, lon1);
    print(point1);
    print('Lat1: $lat1');
    print('Lon1: $lon1');
    print('Lat2: $lat2');
    print('Lon2: $lon2');
    
  }
}