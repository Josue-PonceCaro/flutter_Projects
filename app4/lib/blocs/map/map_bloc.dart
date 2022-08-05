import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:app4/dataTest/pred1.dart';
import 'package:app4/share_preferences/share_preferences.dart';
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

    on<DrawMarkersFromZoneEvent>(_onDrawingMarkersFromZone);

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
    _mapController!.setMapStyle(jsonEncode(MapThemes.simpleMap));
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

  void _onDrawingMarkersFromZone(DrawMarkersFromZoneEvent event, Emitter<MapState> emit) {
    final allMarks = Map<String, Marker>.from(state.markers);
    for(int i = 0; i < event.marks.length; i++){
      final myMark = Marker(
        markerId: MarkerId('$i'),
        position: event.marks[i],
        );
      allMarks['$i'] = myMark;
    }
    emit(state.copyWith(markers: allMarks));
  }

  Future<LatLngBounds> getBound() async{
    LatLngBounds coordinates = await _mapController!.getVisibleRegion();
    return coordinates;
  }
  

  void _onDrawingPolylinesFromZone(DrawPolylinesFromZoneEvent event, Emitter<MapState> emit) {

    // if(state.lastCameraPosition.zoom != event.cameraPosition.zoom) {
    //   changeTild(event.cameraPosition);
    //   emit(state.copyWith(lastCameraPosition: event.cameraPosition));
    // }
    if(true){ // SET CONDITION TO DRAW POLYLINES

      final Map<String, Polyline>currentPolylines = {};
      List<LatLng> newPointX = [];
      double p10Compare = 0;
      int widthLine = 0;
      for(int i = 0; i < event.points.length/1-1; i++){
        
        double lon1 = event.points[i]['lon_node_1'];
        double lat1 = event.points[i]['lat_node_1'];
        double lat2 = event.points[i]['lat_node_2'];
        double lon2 = event.points[i]['lon_node_2'];
    
          newPointX.add(LatLng(lat1, lon1 ));

          p10Compare = event.points[i]['PM10_predicted'] - event.points[i+1]['PM10_predicted'];
          p10Compare > 0 ? p10Compare : - p10Compare;
          if(
            event.points[i]["name"] != event.points[i+1]["name"] ||
            event.points[i]["lat_node_2"] != event.points[i+1]["lat_node_1"] ||
            event.points[i]["lon_node_2"] != event.points[i+1]["lon_node_1"] ||
            p10Compare > 1               
          ){ //x


            newPointX.add(LatLng(lat2, lon2 ));
            final Color theColor;
            if(event.points[i]['PM10_predicted'] < InkaValues.pm10Buena){
              theColor = InkaValues.inkaColorBuena;
              widthLine = MapPreferences.polylineWidthGood;
            } else if(event.points[i]['PM10_predicted'] < InkaValues.pm10Regular){
              theColor = InkaValues.inkaColorRegular;
              widthLine = MapPreferences.polylineWidthRegular;
            } else if(event.points[i]['PM10_predicted'] < InkaValues.pm10Mala){
              theColor = InkaValues.inkaColorMala;
              widthLine = MapPreferences.polylineWidthBad;
            } else{
              theColor = InkaValues.inkaColorMuyMala;
              widthLine = MapPreferences.polylineWidthTooBad;
            } 
            final theRoute = Polyline(
              polylineId:  PolylineId(event.points[i]['id']),
              color: theColor,
              // color: Colors.red,
              width: widthLine,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: newPointX,
              geodesic: true,
            );
            currentPolylines[event.points[i]['id']] = theRoute;
            newPointX = [];
          } //x
        
        
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
