import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl_Mikel = 'f0a8-190-42-109-81.ngrok.io';
  final String _baseUrl_FireBase = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAmbP60XAtmROaANoFkcx4Rv2V45quwtzs';
  // final String _firebaseToken = 'AIzaSyAs1yaOZNmEl5M63ero5XMJyQSwhm1wA_M';

  Future<String> lookUpUserF(String idTok) async {
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
    return '';
  }
  Future<String?> createUser(String email, String password, String name, String phone, String birthday, String gender) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      "first_name": name,
      "last_name": " - ",
      "phone_number": '+51$phone',
      "birthdate": birthday,
      "gender": gender,
    };
    final Map<String, String> head = {
      HttpHeaders.contentTypeHeader: 'application/json'
      }; 
    // {"success":"The user was succesfully created!"}
    // {"error":{"dd":["Unknown field."]}}
    // {"error":"Error while calling Auth service (INVALID_PHONE_NUMBER ). TOO_SHORT"}
    // {"error":"The user with the provided email already exists (EMAIL_EXISTS)."}
    // final url = Uri.https(_baseUrl_FireBase, '/v1/accounts:signUp', {'key': _firebaseToken});
    final url = Uri.https(_baseUrl_Mikel, '/auth/register');
    final resp = await http.post(url, headers: head, body: json.encode(authData));

    // final Map<String, dynamic> decodeResp = json.decode(resp.body);
    print('-----------SINCE HERE --------');
    try{
      final Map<String, dynamic> decodedResp = json.decode(resp.body);
      if(decodedResp.containsKey('success')){
        // TODO: save values to storage
        return null;
      }
      else{
        return decodedResp['error'];
      }
    } on Exception catch (e){
      return e.toString();
    }
  }
  Future<String> lookUpUser(String idToken) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    final url = Uri.https(_baseUrl_Mikel, '/auth/user');
    final resp = await http.get(url, headers: head);
    print('LookUp User-------');
    print(resp);
    print(resp.body);
    return '';
  }
  Future<String?> emailVerified(String idToken) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    final url = Uri.https(_baseUrl_Mikel, '/auth/user/email-verified');
    final resp = await http.get(url, headers: head);
    print('Verified EMAIL-------');
    // {"email_verified":false}
    print(resp);
    print(resp.body);
    return '';
  }
  Future<String?> changeUserData(String email, String name, String phone, String birthday, String gender, String idToken) async {
    final Map<String, dynamic> authData = {
      'email': email,
      "first_name": name,
      "last_name": " - ",
      "phone_number": '+51$phone',
      "birthdate": birthday,
      "gender": gender,
    };
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
      }; 
    final url = Uri.https(_baseUrl_Mikel, '/auth/user');
    final resp = await http.put(url, headers: head, body: json.encode(authData));
    print('Change User Data-------');
    print(resp);
    print(resp.body);
    return '';
    
  }

  Future<String?> verifyEmail(String idToken) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
      }; 

    final url = Uri.https(_baseUrl_Mikel, '/auth/user/verify-email');
    final resp = await http.put(url,headers: head);
    print('Verify EMAIL-------');
    // {"success":"A verification link will be sent to the email"}
    print(resp);
    print(resp.body);

    return null;
  }
  Future<String?> resetPassword(String email) async {
    final Map<String, dynamic> authData = {'email': email};
    final Map<String, String> head = {HttpHeaders.contentTypeHeader: 'application/json'}; 

    final url = Uri.https(_baseUrl_Mikel, '/auth/user/reset-password');
    final resp = await http.put(url,headers: head, body: json.encode(authData));
    print('resetPassword-------');
    print(resp);
    print(resp.body);

    return null;
  }
  Future<String?> changePassword(String idToken, String password) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
      }; 
    final Map<String, dynamic> authData = {'password': password};

    final url = Uri.https(_baseUrl_Mikel, '/auth/user/change-password');
    final resp = await http.put(url,headers: head, body: json.encode(authData));
    print('Change password-------');
    print(resp);
    print(resp.body);

    return null;
  }


}
