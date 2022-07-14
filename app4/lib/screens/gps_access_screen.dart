import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          print('state $state');
          return !state.isGPSEnabled
              ? const _EnableGpsMessage()
              : const _AccessButton();
        },
      )
          //  _AccessButton(),
          ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Is mandatory to have acces to the GPS',
        ),
        MaterialButton(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
            // final gpsBloc = context.read<GpsBloc>();
          },
          splashColor: Colors.transparent,
          color: Colors.black,
          elevation: 0,
          shape: const StadiumBorder(),
          child: const Text('Ask for Access',
              style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Must Enable the GPS',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
