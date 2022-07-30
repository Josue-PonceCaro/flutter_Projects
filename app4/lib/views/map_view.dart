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
        bearing: 90, target: inicialLocation, zoom: 16.5, tilt: 90);
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
            myLocationEnabled: false,
            compassEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onCameraMove: (CameraPosition cameraPosition) {
              // print('camera details -------');
              // if(
              //   mapBloc.state.lastCameraPosition.target.latitude != cameraPosition.target.latitude
              //   // && mapBloc.state.lastCameraPosition.target.longitude != cameraPosition.target.longitude
              //   && mapBloc.state.lastCameraPosition.zoom != cameraPosition.zoom
              // ){

              print(cameraPosition.zoom);
              print(cameraPosition.tilt);
              print(cameraPosition.bearing); // Orientation
              print(cameraPosition.target);
       
              mapBloc.add(DrawPolylinesFromZoneEvent(
                cameraPosition
              ));
              
            },
            onMapCreated: (controller) =>
                mapBloc.add(OnMapInitializedEvent(controller)),
            polylines: polylines,
          ),
        ),
        );
  }
}