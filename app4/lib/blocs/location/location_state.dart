part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followingUser;
  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;
  // TODO:
  // ultimo geolocation
  // history
  const LocationState(
      {this.followingUser = false, this.lastKnownLocation, myLocationHistory})
      : myLocationHistory = myLocationHistory ?? const [];
  LocationState copyWith(
          {bool? followingUser,
          LatLng? lastKnownLocation,
          List<LatLng>? myLocationHistory}) =>
      LocationState(
        followingUser: followingUser ?? this.followingUser,
        lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
      );

  @override
  List<Object?> get props =>
      [followingUser, lastKnownLocation, myLocationHistory];
}


// we estends from Equetable to compare values on the future
// and we must add all propertires into the props, then to use it for comparison