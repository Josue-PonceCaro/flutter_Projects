part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final CameraPosition lastCameraPosition;
  static const CameraPosition defualCamPosition = CameraPosition(target: LatLng(0, 0));
  final Map<String, Polyline> polylines;




  const MapState({
    this.lastCameraPosition = defualCamPosition,
    this.isMapInitialized = false,
     this.isFollowingUser = true,
     Map<String, Polyline>? polylines
     }): polylines = polylines ?? const {};

  MapState copyWith(
    {
     CameraPosition? lastCameraPosition,
     bool? isMapInitialized,
     bool? isFollowingUser,
     Map<String, Polyline>? polylines
     }) => MapState(
        lastCameraPosition: lastCameraPosition ?? this.lastCameraPosition,
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        polylines: polylines ?? this.polylines
      );
  @override
  List<Object> get props => [lastCameraPosition, isMapInitialized, isFollowingUser,polylines];
}
