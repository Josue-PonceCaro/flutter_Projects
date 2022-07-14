part of 'gps_bloc.dart';

@immutable
abstract class GpsEvent {
  const GpsEvent();
}

class GpsAndPermissionEvent extends GpsEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;
  

  const GpsAndPermissionEvent(
      {required this.isGpsEnabled, required this.isGpsPermissionGranted});
}
