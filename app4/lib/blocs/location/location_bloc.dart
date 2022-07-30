import 'dart:async';

import 'package:app4/dataTest/map1.dart';
import 'package:app4/dataTest/pred1.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<OnStartFollowingUser>(
        (event, emit) => emit(state.copyWith(followingUser: true)));
    on<OnStopFollowingUser>(
        (event, emit) => emit(state.copyWith(followingUser: false)));

    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(
        lastKnownLocation: event.newLocation,
        myLocationHistory: [...state.myLocationHistory, event.newLocation],
      ));
      // state.myLocationHistory.isEmpty ? 
      // emit(state.copyWith(
      //   lastKnownLocation: event.newLocation,
      //   myLocationHistory: [...generatePoint(), event.newLocation],
      // ))
      // : 
      // emit(state.copyWith(
      //   lastKnownLocation: event.newLocation,
      //   myLocationHistory: [...state.myLocationHistory, event.newLocation],
      // ));

      // TODO: implement event handler
    });
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    print('Position: $position');
    // TODO: return an object with LatLng type
  }

  void startFollowingUser() {
    print('startFollowingUser');
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNewUserLocationEvent(
          LatLng(-12.047341, -77.031782)));
          // LatLng(position.latitude, position.longitude))); // MUST DECOMMENT THIS
    });
    add(OnStartFollowingUser());
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    add(OnStopFollowingUser());
    print('stopFollowingUser');
  }

  @override
  Future<void> close() {
    // TODO: implement close
    stopFollowingUser();
    return super.close();
  }
  List<LatLng> generatePoint(){
    List<LatLng> newPoint = [];
    for(int i = 0; i < datamapXX.length; i++){
    // for(int i = 0; i < datamap.length; i++){
      newPoint.add(LatLng(double.parse(datamapXX[i]['lat_node_1']), double.parse(datamapXX[i]['lon_node_1'])));
      newPoint.add(LatLng(double.parse(datamapXX[i]['lat_node_2']), double.parse(datamapXX[i]['lon_node_2'])));
    }
    print('ENDDD..........');
    print(datamapXX.length);
    print('ENDDD.....................');
    return newPoint;
  }
}
