import 'package:app4/blocs/blocs.dart';
import 'package:app4/dataTest/pred1.dart';
import 'package:app4/services/services.dart';
import 'package:app4/share_preferences/share_preferences.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class MapView extends StatelessWidget {
  final LatLng inicialLocation;
  final Set<Polyline> polylines;
  final Set<TileOverlay> onverlay;
  const MapView(
      {Key? key, required this.inicialLocation, required this.polylines, required this.onverlay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition inicialCameraPosition = CameraPosition( bearing: 90,
        target: inicialLocation, zoom: MapPreferences.initialZoom, tilt: MapPreferences.initialTild);
    final size = MediaQuery.of(context).size;
    bool isInit = false;
    double divisor = (size.height + size.width) * 100;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          // Implement Following
          onPointerMove: (pointerMoveEvent) {
            mapBloc.add(WillStopFollowingUser());
          },
          child: GoogleMap(
            minMaxZoomPreference: MinMaxZoomPreference(MapPreferences.minZoom, MapPreferences.maxZoom),
            tileOverlays: onverlay,
            initialCameraPosition: inicialCameraPosition,
            myLocationEnabled: false,
            compassEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            buildingsEnabled: false,
            onCameraMove: (CameraPosition cameraPosition) {
              // print('camera details -------');
              // if(
              //   mapBloc.state.lastCameraPosition.target.latitude != cameraPosition.target.latitude
              //   // && mapBloc.state.lastCameraPosition.target.longitude != cameraPosition.target.longitude
              //   && mapBloc.state.lastCameraPosition.zoom != cameraPosition.zoom
              // ){

              if(!isInit){
                // print(cameraPosition.zoom);
                // print(cameraPosition.tilt);
                // print(cameraPosition.bearing); // Orientation
                // print(cameraPosition.target);
        
                // mapBloc.add(DrawPolylinesFromZoneEvent(
                //   cameraPosition
                // ));
                const double limitMin = 14;
                const double limitMax = 20;
                double cosVal = math.cos(math.pi*cameraPosition.bearing/180);
                double sinVal = math.sin(math.pi*cameraPosition.bearing/180);
                
                double hightSum = -(size.longestSide == size.height ? size.height : size.width)/divisor; // 0.009 Must convert to global variable , will change acording of a screen
                // double hightSum = 0.011-0.002*(cameraPosition.zoom - limitMin); // 0.009 Must convert to global variable , will change acording of a screen
                double widthSum = -(size.longestSide == size.height ? size.width : size.height)/divisor; // 0.005 same for this
                // double widthSum = 0.008-0.001*(cameraPosition.zoom - limitMin); // 0.005 same for this
                double toLat = hightSum*cosVal - widthSum*sinVal;
                toLat = toLat > 0 ? -toLat : toLat;
                double toLon = widthSum*cosVal - hightSum*sinVal;
                toLon = toLon > 0 ? -toLon : toLon;

                // double latMax = cameraPosition.target.latitude - hightSum;
                // double latMin = cameraPosition.target.latitude + hightSum;
                
                // double lonMax = cameraPosition.target.longitude - widthSum;
                // double lonMin = cameraPosition.target.longitude + widthSum;
// ====Tile info zoom:
// The bearing is ==
                print('The bearing is == ${cameraPosition.bearing}');
                double latMax = cameraPosition.target.latitude - toLat;
                double latMin = cameraPosition.target.latitude + toLat;
                
                double lonMax = cameraPosition.target.longitude - toLon;
                double lonMin = cameraPosition.target.longitude + toLon;
            
                LatLng upLeft = LatLng(latMax, lonMin);
                LatLng downRight = LatLng(latMin, lonMax);
                LatLng upRight = LatLng(latMax, lonMin);
                LatLng downLeft = LatLng(latMin, lonMax);


                final mapService = Provider.of<MapService>(context, listen: false);
                // mapService.getAllPoints(idToken: Preferences.firebaseToken, type: 'complete').then((value) {   
                // mapService.getAllPoints(idToken: Preferences.firebaseToken, type: 'rectangle', upLeft: upLeft, downRight: downRight).then((value) {   
                mapService.getAllPoints4Coordinates(
                  idToken: Preferences.firebaseToken,
                   type: 'rectangle',
                   upLeft: upLeft, 
                   downRight: downRight

                   ).then((value) {   
                  mapBloc.add(DrawPolylinesFromZoneEvent(
                  cameraPosition, value //TODO: MUST DELATE THE datamapXX, ITS just for testing
                  // cameraPosition, value.length > 1 ? value : datamapXX //TODO: MUST DELATE THE datamapXX, ITS just for testing
                  ));
                  isInit = false;
                  
                });
                print('END-----------');
                isInit = true;
              }
            },
            onMapCreated: (controller) =>
                mapBloc.add(OnMapInitializedEvent(controller)),
            polylines: polylines,
            markers: {Marker(markerId: MarkerId('1'), position: inicialLocation)},
            
          ),
        ),
        );
  }
}