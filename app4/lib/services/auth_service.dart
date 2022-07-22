import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl_Mikel = 'f2c4-190-42-109-81.ngrok.io';
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


  Future<String?> loginUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl_FireBase, '/v1/accounts:signInWithPassword',
        {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    print('-----------SINCE HERE----------------');
    print(resp.body);
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
    return null;
  }
  Future<String?> createUser({ 
    required String email, 
    required String name, 
    required String phone, 
    required String password, 
    required String birthday, 
    required String gender
    }) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      "name": name,
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
  Future<Map<String, dynamic>> lookUpUser(String idToken) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    final url = Uri.https(_baseUrl_Mikel, '/auth/user');
    final resp = await http.get(url, headers: head);
    // {"birthdate":"01-01-1900",
    //"email":"j.ponce@qairadrones.com",
    //"first_name":"Cose",
    //"gender":"Otros",
    //"last_name":" - ","
    //phone_number":"+51943453453"}
    print('LookUp User-------');
    print(resp);
    print(resp.body);

    try {
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('email') || decodeResp.containsKey('phone_number')) {
        return decodeResp;
      } else {
        print(decodeResp);
      }
    } on Exception catch (e) {
      print(e);
    }
    return {};
  }





  Future<bool?> isEmailVerified(String idToken) async {
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

    try {
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('email_verified')) {
        return decodeResp['email_verified'];
      } else {
        print(decodeResp);
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> deleteUserAccount(String idToken) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    final url = Uri.https(_baseUrl_Mikel, '/auth/user');
    final resp = await http.delete(url, headers: head);
    print('Delete Account-------');
    // {"email_verified":false}
    print(resp);
    print(resp.body);

    try {
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('success')) {
        return true;
      } else {
        print(decodeResp);
      }
    } on Exception catch (e) {
      print(e);
    }
    return false;
  }



  Future<bool> changeUserData({
    required String email, 
    required String name, 
    required String phone, 
    required String birthday, 
    required String gender, 
    required String idToken
    }) async {
    final Map<String, dynamic> authData = {
      'email': email,
      "name": name,
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
    try {
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('success')) {
        return true;
      } else {
        print(decodeResp);
      }
    } on Exception catch (e) {
      print(e);
    }
    return false;
    
  }

  Future<bool> verifyEmail(String idToken) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
      }; 

    final url = Uri.https(_baseUrl_Mikel, '/auth/user/verify-email');
    final resp = await http.put(url,headers: head);
    // {"success":"A verification link will be sent to the email"}
    try {
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('success')) {
        return true;
      } else {
        print(decodeResp);
      }
    } on Exception catch (e) {
      print(e);
    }
    return false;
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
  Future<bool> changePassword(String idToken, String password) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
      }; 
    final Map<String, dynamic> authData = {'password': password};

    final url = Uri.https(_baseUrl_Mikel, '/auth/user/change-password');
    final resp = await http.put(url,headers: head, body: json.encode(authData));
    try {
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('success')) {
        return true;
      } else {
        print(decodeResp);
      }
    } on Exception catch (e) {
      print(e);
    }
    return false;
  }


}
