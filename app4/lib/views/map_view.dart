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
  final Set<Marker> markers;
  final Set<TileOverlay> onverlay;
  const MapView(
      {Key? key, required this.inicialLocation, required this.polylines, required this.onverlay, required this.markers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition inicialCameraPosition = CameraPosition( bearing: MapPreferences.initialBearing,
        target: inicialLocation, zoom: MapPreferences.initialZoom, tilt: MapPreferences.initialTild);
    final size = MediaQuery.of(context).size;
    bool isInit = false;
    double divisor = (size.height + size.width) * 100;
    GoogleMapController _controller;
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
            compassEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            buildingsEnabled: false,
            onCameraMove: (CameraPosition cameraPosition) {

              
              if(!isInit && cameraPosition.zoom <= MapPreferences.maxDrawingZoom  && cameraPosition.zoom >= MapPreferences.minDrawingZoom ){
                
                print('END----------- Before  11 $isInit');
                isInit = true;
                print('END----------- after 22 $isInit');
                // double centralLat = cameraPosition.target.latitude;
                // double centralLon = cameraPosition.target.longitude;
                double cosVal = math.cos(math.pi*cameraPosition.bearing/180);
                double sinVal = math.sin(math.pi*cameraPosition.bearing/180);
                
                
                double latSum = -(size.longestSide == size.height ? size.height : size.width)/divisor; // 0.009 Must convert to global variable , will change acording of a screen
                double lonSum = -(size.longestSide == size.height ? size.width : size.height)/divisor; // 0.005 same for this
     

                LatLng upR   =  rotationFormula (cameraPosition.target, LatLng(-latSum, - lonSum), cosVal, sinVal);
                LatLng downL =  rotationFormula (cameraPosition.target, LatLng(latSum, lonSum), cosVal, sinVal);
 
                LatLng upL   =  rotationFormula (cameraPosition.target, LatLng(-latSum, lonSum),  cosVal,  sinVal);
                LatLng downR =  rotationFormula (cameraPosition.target, LatLng(latSum, - lonSum),  cosVal,  sinVal);
                
                // print('upR >> Lat:${upR.latitude} Lon:${upR.longitude}');
                // print('downL >> Lat:${downL.latitude} Lon:${downL.longitude}');
                // print('upL >> Lat:${upL.latitude} Lon:${upL.longitude}');
                // print('downR >> Lat:${downR.latitude} Lon:${downR.longitude}');
                print('Those are the coor upR >> Lat:${upR.latitude} Lon:${upR.longitude}');
                print('Those are the coor downL >> Lat:${downL.latitude} Lon:${downL.longitude}');
                print('Those are the coor upL >> Lat:${upL.latitude} Lon:${upL.longitude}');
                print('Those are the coor downR >> Lat:${downR.latitude} Lon:${downR.longitude}');

                mapBloc.add(DrawMarkersFromZoneEvent([upR, upL, downR, downL]));
                final mapService = Provider.of<MapService>(context, listen: false);
                
                mapBloc.getBound().then((boundCoor) => {
                  


                  // mapService.getAllPoints(idToken: Preferences.firebaseToken, type: 'complete').then((value) {   
                  mapService.getAllPoints4Coordinates(idToken: Preferences.firebaseToken, type: 'rectangle2p', upLeft: boundCoor.northeast, downRight: boundCoor.southwest).then((value) {   
                  // mapService.getAllPoints4Coordinates(
                  //   idToken: Preferences.firebaseToken,
                  //    type: 'rectangle4p',
                  //    upLeft: upL, 
                  //    downRight: downR,
                  //    upRight: upR,
                  //    downLeft: downL
                  //    ).then((value) {   
                    mapBloc.add(DrawPolylinesFromZoneEvent(
                    cameraPosition, value //TODO: MUST DELATE THE datamapXX, ITS just for testing
                    // cameraPosition, value.length > 1 ? value : datamapXX //TODO: MUST DELATE THE datamapXX, ITS just for testing
                    ));
                    print('END----------- Drawing BEF 1 $isInit');
                    // isInit = false;
                    print('END----------- Before  AFF 2 $isInit');
                    
                  })




                });
                


              } 

            },
            onMapCreated: (controller) {
                
                mapBloc.add(OnMapInitializedEvent(controller));
            },
            polylines: polylines,
            markers: markers,
            
          ),
        ),
        );
  }
}

// LatLng rotationWrong (LatLng coo, LatLng point, double cosVal, double sinVal) {
//   double lat = point.latitude*cosVal + point.longitude*sinVal;
//   double lon = point.longitude*cosVal - point.latitude*sinVal;
//   return LatLng(coo.latitude + lat, coo.longitude + lon);
// }
LatLng rotationFormula (LatLng coo, LatLng point, double cosVal, double sinVal) {
  double lat = point.latitude*cosVal - point.longitude*sinVal;
  double lon = point.longitude*cosVal + point.latitude*sinVal;
  return LatLng(coo.latitude + lat, coo.longitude + lon);
}
