import 'package:app4/blocs/blocs.dart';
import 'package:app4/views/views.dart';
import 'package:app4/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class MapScreen extends StatefulWidget {
  // To use it life cycle

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  TileOverlay? _tileOverlay;
  @override
  void initState() {
    // When want to clean all when it finishes
    // TODO: implement initState
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
     _addTileOverlay();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    // TODO: implement dispose
    super.dispose();
  }

  void _addTileOverlay() {
    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: const TileOverlayId('tile_overlay_1'),
      tileProvider: _DebugTileProvider(),
    );
    setState(() {
      _tileOverlay = tileOverlay;
    });
  }
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Set<TileOverlay> overlays = <TileOverlay>{
      if (_tileOverlay != null) _tileOverlay!,
    };
    _addTileOverlay();

    return Scaffold(
      key: _globalKey,
      body: BlocBuilder<LocationBloc, LocationState>(
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
                      onverlay: overlays,
                      ),
                      const SearchBar(),
                      const ManualMarker(),
                      Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.list,
                            size: 40,
                            ),
                          onPressed: () {
                            print('oPen DRAWER....');
                            _globalKey.currentState?.openDrawer();
                          }, ),
                      ),
                    ],
                  ),
                );
          },
        );
      },
    ),
    drawer: const SideMenu(),
    floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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





class _DebugTileProvider implements TileProvider {
  _DebugTileProvider() {
    boxPaint.isAntiAlias = true;
    boxPaint.color = Colors.green;
    //boxPaint.strokeWidth = 2.0;
    boxPaint.style = PaintingStyle.stroke;
  }

  static const int width = 100;
  static const int height = 100;
  static final Paint boxPaint = Paint();
  static const TextStyle textStyle = TextStyle(
    color: Colors.red,
    fontSize: 20,
  );

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    print("====Tile info zoom: $zoom - x: $x -y: $y");
   
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final paint = Paint()..color = Colors.red.withOpacity(0.3);

    //var int_zoom = zoom ?? 2;
    //int_zoom = int_zoom - 2;
    // ui.Image images = await getAssetImage('assets/logos/logoLimaWhite.png');
    // ui.Image images = await getAssetImage('assets/tiles/$zoom/$x/$y.png');
    paint.color = Color.fromARGB(204, 160, 42, 42);
    // canvas.drawImage(images, Offset(0, 0), paint);
    //textPainter.paint(canvas, offset);
    canvas.drawRect(
        Rect.fromLTRB(0, 0, width.toDouble(), width.toDouble()), boxPaint);
    final ui.Picture picture = recorder.endRecording();
    final Uint8List byteData = await picture
        .toImage(width, height)
        .then((ui.Image image) =>
        image.toByteData(format: ui.ImageByteFormat.png))
        .then((ByteData? byteData) => byteData!.buffer.asUint8List());
    print('====Tile info END TILESSSSSS 1..........');
    return Tile(width, height, byteData);
  }
}

// Future<ui.Image> getAssetImage(String asset, {width, height}) async {
//   ByteData data = await rootBundle.load(asset);
//   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//       targetWidth: width, targetHeight: height);
//   ui.FrameInfo fi = await codec.getNextFrame();
//   return fi.image;
// }
