part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGPSEnabled;
  final bool isGpsPermissionGranted;
  bool get isAllGranted => isGPSEnabled && isGpsPermissionGranted;
  const GpsState(
      {required this.isGPSEnabled, required this.isGpsPermissionGranted});

  GpsState copyWith({
    bool? isGPSEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      GpsState(
          isGPSEnabled: isGPSEnabled ?? this.isGPSEnabled,
          isGpsPermissionGranted:
              isGpsPermissionGranted ?? this.isGpsPermissionGranted);

  @override
  List<Object> get props => [isGPSEnabled, isGpsPermissionGranted];

  @override
  String toString() {
    // TODO: implement toString
    return '{ isGpsEnabled: $isGPSEnabled and IsGpsPermissionGranted $isGpsPermissionGranted }';
  }
}
