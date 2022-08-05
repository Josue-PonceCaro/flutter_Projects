import 'package:animate_do/animate_do.dart';
import 'package:app4/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ManualMarker extends StatelessWidget {
  const ManualMarker({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: ((context, state) {
        return state.displayManualMarker ? const _ManualMarkerBody() : const SizedBox();
    } )
    );
  }
}



class _ManualMarkerBody extends StatelessWidget {
   
  const _ManualMarkerBody({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [

          const Positioned(
            top: 70,
            left: 20,
            child: _BtnBack(),
            ),

          Center(
            
            child: Transform.translate(
              offset: const Offset(0, 30),
              child: BounceInDown(
                from: 150,
                child: const Icon(Icons.location_on_rounded, size: 40,),
                ),
            ),
          ),
          // CONFIMR BUTTOM
          Positioned(
            bottom: 10,
            right: 40,
            child: FadeInUp(
              child: MaterialButton(
                elevation: 0,
                shape: const StadiumBorder(),
                color: Colors.black,
                minWidth: size.width - 120,
                child: const  Text(
                  'Confirmar destino',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300 ),
                ),
                onPressed: () {
                // Confirmar Ubicacion
              },
            
              ),
            ),
            

            ),
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    Key? key,
  }) : super(key: key);
  void closeManualMarker(BuildContext context){
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    searchBloc.add(OnDeactivateManualMarkerEvent());
  }
  @override
  Widget build(BuildContext context) {
    return  FadeInLeft(
      // duration: const Duration(microseconds: 500),
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
          onPressed: () {
            // TODO: 
            // CANCELAR EL MARCADOR MANUAL
            closeManualMarker(context);
          },
        ),
      ),
    );
  }
}

