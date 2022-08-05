part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final CameraPosition lastCameraPosition;
  static const CameraPosition defualCamPosition = CameraPosition(target: LatLng(0, 0));
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;




  const MapState({
    this.lastCameraPosition = defualCamPosition,
    this.isMapInitialized = false,
     this.isFollowingUser = true,
     Map<String, Polyline>? polylines,
     Map<String, Marker>? markers,
     }): polylines = polylines ?? const {}, markers = markers ?? const {};

  MapState copyWith(
    {
     CameraPosition? lastCameraPosition,
     bool? isMapInitialized,
     bool? isFollowingUser,
     Map<String, Polyline>? polylines,
     Map<String, Marker>? markers,
     }) => MapState(
        lastCameraPosition: lastCameraPosition ?? this.lastCameraPosition,
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        polylines: polylines ?? this.polylines,
        markers: markers ?? this.markers,
      );
  @override
  List<Object> get props => [lastCameraPosition, isMapInitialized, isFollowingUser,polylines, markers];
}
