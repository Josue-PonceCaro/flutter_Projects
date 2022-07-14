import 'package:app4/blocs/blocs.dart';
import 'package:app4/views/views.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreen extends StatefulWidget {
  // To use it life cycle

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  @override
  void initState() {
    // When want to clean all when it finishes
    // TODO: implement initState
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationstate) {
        if (locationstate.lastKnownLocation == null) {
          return const Center(child: Text('Cargando el mapa...'));
        }

   
        return BlocBuilder<MapBloc, MapState>(
          builder: (context, mapState) {
            return SingleChildScrollView(
                  child: Stack(
                    children: [
                      MapView(
                      inicialLocation: locationstate.lastKnownLocation!,
                      polylines: mapState.polylines.values.toSet(),
                      )
                    ],
                  ),
                );
          },
        );
      },
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        BtnFollowUser(),
        BtnCurrentLocation(),
      ],
    ),
    );
  }
}
