import 'package:app4/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng inicialLocation;
  final Set<Polyline> polylines;
  const MapView(
      {Key? key, required this.inicialLocation, required this.polylines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition inicialCameraPosition = CameraPosition(
        bearing: 192.8334901395799, target: inicialLocation, zoom: 15);
    final size = MediaQuery.of(context).size;
 
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          // Implement Following
          onPointerMove: (pointerMoveEvent) {
            mapBloc.add(WillStopFollowingUser());
          },
          child: GoogleMap(
            initialCameraPosition: inicialCameraPosition,
            myLocationEnabled: true,
            compassEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onMapCreated: (controller) =>
                mapBloc.add(OnMapInitializedEvent(controller)),
            polylines: polylines,
          ),
        ));
  }
}
