import 'package:app4/blocs/blocs.dart';
import 'package:app4/screens/gps_access_screen.dart';
import 'package:app4/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  static const String pageRoute = 'LoadingMap';
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllGranted ? const MapScreen() : const GpsAccessScreen();
      },
    ));
  }
}
