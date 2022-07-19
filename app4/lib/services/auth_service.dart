import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl_Mikel = '80af-190-42-109-81.ngrok.io';
  final String _baseUrl_FireBase = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAmbP60XAtmROaANoFkcx4Rv2V45quwtzs';
  // final String _firebaseToken = 'AIzaSyAs1yaOZNmEl5M63ero5XMJyQSwhm1wA_M';

  Future<String> lookUpUser(String idTok) async {
    final Map<String, dynamic> authData = {'idToken': idTok};
    final url = Uri.https(
        _baseUrl_FireBase, '/v1/accounts:lookup', {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    print(resp);
    print(resp.body);
    return '';
  }


  Future<String> loginUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl_FireBase, '/v1/accounts:signInWithPassword',
        {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    // final resp = await http.post(url,
    //     headers: <String, String>{
    //       'Content-Type': 'application/json',
    //     },
    //     body: json.encode(authData));
    print('-----------SINCE HERE----------------');
    try {
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('idToken')) {
        print(decodeResp['idToken']);
        return decodeResp['idToken'];
      } else {
        print(decodeResp);
      }
    } on Exception catch (e) {
      print(e);
    }
    // print(resp);
    // print(resp.body);
    // print(resp.body);
    return '';
  }
  Future<String> createUser(String email, String password, String name, String phone, String birthday, String gender) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      "first_name": name,
      "last_name": " - ",
      "phone_number": '+51$phone',
      "birthdate": birthday,
      "gender": gender,
    };
    // {"success":"The user was succesfully created!"}
    // {"error":{"dd":["Unknown field."]}}
    // {"error":"Error while calling Auth service (INVALID_PHONE_NUMBER ). TOO_SHORT"}
    // {"error":"The user with the provided email already exists (EMAIL_EXISTS)."}
    final url = Uri.https(_baseUrl_Mikel, '/auth/register');
    // final url =
    //     Uri.https(_baseUrl_FireBase, '/v1/accounts:signUp', {'key': _firebaseToken});
    final resp = await http.post(url, headers:  <String, String>{
      'Content-Type': 'application/json',
    }, body: json.encode(authData));

    // final Map<String, dynamic> decodeResp = json.decode(resp.body);
    print('-----------SINCE HERE --------');
    print(resp.body);
    return '';
  }
  Future<String> lookUpUser2(String idTok) async {
    // final Map<String, dynamic> authData = {'Authorization': idTok};
    final url = Uri.https(_baseUrl_Mikel, '/auth/user');
    final resp = await http.get(url, headers: <String, String>{
      HttpHeaders.authorizationHeader: idTok,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
      // HttpHeaders.authorizationHeader: 'Token $idTok',
      // HttpHeaders.contentTypeHeader: 'application/json',
      // 'Authorization': idTok,
    print(resp);
    print(resp.body);
    return '';
  }
}
