import 'dart:convert';
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
    on<UpdateUserPolylineEvent>(_onPolilyneNewPointPRO);
    // on<UpdateUserPolylineEvent>(_onPolilyneNewPoint);

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
    _mapController!.setMapStyle(jsonEncode(shadesGrey));
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
  void _onPolilyneNewPointPRO( UpdateUserPolylineEvent event, Emitter<MapState> emit) {
    
    
    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    if(currentPolylines.isEmpty){
      // for(int i = 0; i < 5000; i++){
      for(int i = 0; i < datamapXX.length/10; i++){
      // for(int i = 0; i < datamap.length; i++){
      
        List<LatLng> newPointX = [];
        newPointX.add(LatLng(double.parse(datamapXX[i]['lat_node_1']), double.parse(datamapXX[i]['lon_node_1'])));
        newPointX.add(LatLng(double.parse(datamapXX[i]['lat_node_2']), double.parse(datamapXX[i]['lon_node_2'])));
        final theColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
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
