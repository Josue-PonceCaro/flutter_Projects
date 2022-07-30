import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:app4/dataTest/pred1.dart';
import 'package:flutter/material.dart';
import 'package:app4/blocs/blocs.dart';
import 'package:app4/themes/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<WillStopFollowingUser>((event, emit) => emit(state.copyWith(isFollowingUser: false)),);
    on<WillStartFollowingUser>(_onStartFollowing,);
    // on<UpdateUserPolylineEvent>(_onPolilyneNewPointPRO);
    on<UpdateUserPolylineEvent>(_onPolilyneNewPoint);

    on<DrawPolylinesFromZoneEvent>(_onDrawingPolylinesFromZone);


    locationBloc.stream.listen((locationState) {
      if (locationState.lastKnownLocation != null) {
        add(UpdateUserPolylineEvent(locationState.myLocationHistory));
      }
      if (!state.isFollowingUser) return;
      if (locationState.lastKnownLocation == null) return;
      moveCamera(locationState.lastKnownLocation!);
    });
  }


  void _onStartFollowing(WillStartFollowingUser event, Emitter<MapState> emit){
    emit(state.copyWith(isFollowingUser: true));
    if (locationBloc.state.lastKnownLocation == null) return;
    moveCamera(locationBloc.state.lastKnownLocation!);
  }


  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(interfaceMap));
    // _mapController!.setMapStyle(jsonEncode(shadesGrey));
    emit(state.copyWith(isMapInitialized: true));
  }

  void _onPolilyneNewPoint( UpdateUserPolylineEvent event, Emitter<MapState> emit) {
    final color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    final myRoute = Polyline(
      polylineId:  const PolylineId('myRoute'),
      color: color,
      // color: Colors.red,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: event.userLocation,
      geodesic: true,
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;
    emit(state.copyWith(polylines: currentPolylines));
  }
  void _onDrawingPolylinesFromZone(DrawPolylinesFromZoneEvent event, Emitter<MapState> emit) {
    
    final Map<String, Polyline>currentPolylines = {};
    double initConditionLat = event.cameraPosition.target.latitude - state.lastCameraPosition.target.latitude;
    double initConditionLon = event.cameraPosition.target.longitude - state.lastCameraPosition.target.longitude;

    initConditionLat = initConditionLat >= 0 ? initConditionLat : -initConditionLat;
    initConditionLon = initConditionLon >= 0 ? initConditionLon : -initConditionLon;
    if(state.lastCameraPosition.zoom != event.cameraPosition.zoom) {
      changeTild(event.cameraPosition);
      emit(state.copyWith(lastCameraPosition: event.cameraPosition));
    }
    if (initConditionLat > 0.001 || initConditionLon > 0.001){


      if(event.cameraPosition.zoom > 15 && event.cameraPosition.zoom < 20) {

        // final currentPolylines = Map<String, Polyline>.from(state.polylines);
        double cosVal = math.cos(math.pi*event.cameraPosition.bearing/180);
        double sinVal = math.sin(math.pi*event.cameraPosition.bearing/180);
        double hightSum = 0.011-0.002*(event.cameraPosition.zoom - 15); // 0.009 Must convert to global variable , will change acording of a screen
        double widthSum = 0.008-0.001*(event.cameraPosition.zoom - 15); // 0.005 same for this
        double toLat = hightSum*cosVal - widthSum*sinVal;
        toLat = toLat > 0 ? -toLat : toLat;
        double toLon = widthSum*cosVal - hightSum*sinVal;
        toLon = toLon > 0 ? -toLon : toLon;

        double latMax = event.cameraPosition.target.latitude - toLat;
        double latMin = event.cameraPosition.target.latitude + toLat;
        
        double lonMax = event.cameraPosition.target.longitude - toLon;
        double lonMin = event.cameraPosition.target.longitude + toLon;


          // for(int i = 0; i < 5000; i++){
          for(int i = 0; i < datamapXX.length/10-1; i++){
            
            double lat1 = double.parse(datamapXX[i]['lat_node_1']);
            double lon1 = double.parse(datamapXX[i]['lon_node_1']);
            double lat2 = double.parse(datamapXX[i]['lat_node_2']);
            double lon2 = double.parse(datamapXX[i]['lon_node_2']);
            if (
              lat1 > latMin && lat1 < latMax && lon1 > lonMin && lon1 < lonMax || 
              lat2 > latMin && lat2 < latMax && lon2 > lonMin && lon2 < lonMax
              
              ){
              
              List<LatLng> newPointX = [];
              newPointX.add(LatLng(lat1, lon1 ));
              newPointX.add(LatLng(lat2, lon2 ));
              final Color theColor;
              if(datamapXX[i]['PM10_predicted'] < InkaValues.pm10Buena){
                theColor = InkaValues.inkaColorBuena;
              } else if(datamapXX[i]['PM10_predicted'] < InkaValues.pm10Regular){
                theColor = InkaValues.inkaColorRegular;
              } else if(datamapXX[i]['PM10_predicted'] < InkaValues.pm10Mala){
                theColor = InkaValues.inkaColorMala;
              } else{
                theColor = InkaValues.inkaColorMuyMala;
              } 
              
              final theRoute = Polyline(
                polylineId:  PolylineId(datamapXX[i]['id']),
                color: theColor,
                // color: Colors.red,
                width: 5,
                startCap: Cap.roundCap,
                endCap: Cap.roundCap,
                points: newPointX,
                geodesic: true,
              );

              currentPolylines[datamapXX[i]['id']] = theRoute;
            }
            
          }
      }

        // currentPolylines['myRoute'] = myRoute;
        emit(state.copyWith(polylines: currentPolylines));
    }
  }

  void changeTild(CameraPosition cameraPosition){
    double newTild; 
    const double maxZoom = 18.5;
    const double minZoom = 11.5;
    if(cameraPosition.zoom < maxZoom && cameraPosition.zoom > minZoom){
      newTild = 90 * (cameraPosition.zoom - minZoom)/(maxZoom - minZoom);
    } else if(cameraPosition.zoom < minZoom){
      newTild = 0;
    } else {
      newTild = 90;
    }

    print('---------NEW TILD---------$newTild');

    final cameraUpdate = CameraUpdate.newCameraPosition(CameraPosition(
      target : cameraPosition.target,
      tilt   : newTild,
      zoom   : cameraPosition.zoom,
      bearing: cameraPosition.bearing    
      ));
    _mapController!.animateCamera(cameraUpdate);
  }



  void _onPolilyneNewPointPRO( UpdateUserPolylineEvent event, Emitter<MapState> emit) {
    
    
    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    if(currentPolylines.isEmpty){
      // for(int i = 0; i < 5000; i++){
      for(int i = 0; i < datamapXX.length/10; i++){
      // for(int i = 0; i < datamap.length; i++){
      
        List<LatLng> newPointX = [];
        newPointX.add(LatLng(double.parse(datamapXX[i]['lat_node_1']), double.parse(datamapXX[i]['lon_node_1'])));
        newPointX.add(LatLng(double.parse(datamapXX[i]['lat_node_2']), double.parse(datamapXX[i]['lon_node_2'])));
        final theColor;
        if(datamapXX[i]['PM10_predicted'] < InkaValues.pm10Buena){
          theColor = InkaValues.inkaColorBuena;
        } else if(datamapXX[i]['PM10_predicted'] < InkaValues.pm10Regular){
          theColor = InkaValues.inkaColorRegular;
        } else if(datamapXX[i]['PM10_predicted'] < InkaValues.pm10Mala){
          theColor = InkaValues.inkaColorMala;
        } else{
          theColor = InkaValues.inkaColorMuyMala;
        } 
        
        final theRoute = Polyline(
          polylineId:  PolylineId(datamapXX[i]['id']),
          color: theColor,
          // color: Colors.red,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          points: newPointX,
          geodesic: true,
        );

        currentPolylines[datamapXX[i]['id']] = theRoute;
      }

      // currentPolylines['myRoute'] = myRoute;
      emit(state.copyWith(polylines: currentPolylines));
    }
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController!.animateCamera(cameraUpdate);
  }


}
