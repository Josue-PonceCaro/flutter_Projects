import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// https://account.mapbox.com/
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoianBjYXJvIiwiYSI6ImNsNTBhNm1ncTM2bTQzZGxweW54aWpqbDgifQ.J5lyQXlrts7eyoKDD8atlg';
// https://docs.mapbox.com/api/maps/styles/
// https://github.com/fleaflet/flutter_map/tree/master/example/lib/pages
const MAPBOX_STYLE = 'mapbox://styles/mapbox/dark-v10';
const MARKER_COLOR = Color(0xFF3DC5A7);
final _myLocation = LatLng(-12.0362176, -77.0296812);

class Map1Screen extends StatelessWidget {
  const Map1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: _myLocation,
            zoom: 15,
          ),
          layers: [
            TileLayerOptions(
                // urlTemplate: 'assets/map/anholt_osmbright/{z}/{x}/{y}.png',
                // urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                // urlTemplate:
                    // "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
                subdomains: [
                  'a',
                  'b',
                  'c'
                ],
                // additionalOptions: {
                //   'accessToken': MAPBOX_ACCESS_TOKEN,
                //   'id': MAPBOX_STYLE
                // }
                ),
          ],
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: null,
            ),
          ],
        )
      ],
    ));
  }
}
