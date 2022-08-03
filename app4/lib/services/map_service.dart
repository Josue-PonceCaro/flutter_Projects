import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:app4/services/principal_config.dart';
class MapService extends ChangeNotifier {

    Future<List<Map<String, dynamic>>> getAllPoints({ 
    required String idToken,
    required String type, 
    LatLng? upLeft, 
    LatLng? downRight, 
    }) async {
    final mapParams = {
      'type': type,
      'up_left': upLeft != null ? '${upLeft.latitude}_${upLeft.longitude}' : '0.0_0.0',
      'down_right': downRight != null ? '${downRight.latitude}_${downRight.longitude}' : '0.0_0.0',
    };
    final Map<String, String> head = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: idToken,
      }; 
    final url = Uri.https(PrincipalConfig.baseUrl, '/maps/predictions', mapParams);    
    try{
      final resp = await http.get(url, headers: head);

      // final Map<String, dynamic> decodeResp = json.decode(resp.body);
      print('-----------SINCE HERE --------');
      print('URL IS-------');
      print(url);
      print(resp);
      print(resp.body);
      print('----------------------== BOSY TYPE==-----------------');
      print(resp.body.runtimeType);
      final decodedResp = json.decode(resp.body);
      try{
        final List<Map<String,dynamic>> finalDecoded = decodedResp?.cast<Map<String,dynamic>>() ?? [{'error':0}];
        return finalDecoded;
      }on Exception catch (e){
        print('The error is 1111:________________');
        print(e);
        return [{'error':1}];
    }
      
 
    } on Exception catch (e){
        print('The error is 2222:________________');
        print(e);
        return [{'error':2}];
    }
  }
}

