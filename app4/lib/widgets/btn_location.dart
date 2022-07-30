import 'package:app4/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.my_location,
            color: Colors.black,
          ),
          onPressed: () {
            final userLocation = locationBloc.state.lastKnownLocation;
            // TODO: implement the SNACKBAR
            // const snack = SnackBar(
            //   content: Text('Unicación no encontrada', style: TextStyle(fontSize: 20),),
            // );
            // ScaffoldMessenger.of(context).showSnackBar(snack);
            // return;
            if (userLocation == null) {
              return;
            }

            // mapBloc.moveCamera(userLocation); // THISCOMENT THIS IF COMMENTS THE OTHER LINE
            mapBloc.add(WillStartFollowingUser()); // This includes the movement Camera
          },
        ),
      ),
    );
  }
}
