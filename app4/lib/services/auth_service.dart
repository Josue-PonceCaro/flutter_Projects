import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app4/services/principal_config.dart';
class AuthService extends ChangeNotifier {


  Future<String> lookUpUserF(String idTok) async {
    final Map<String, dynamic> authData = {'idToken': idTok};
    final url = Uri.https(
        PrincipalConfig.baseUrlFireBase, '/v1/accounts:lookup', {'key': PrincipalConfig.firebaseToken});
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
    final url = Uri.https(PrincipalConfig.baseUrlFireBase, '/v1/accounts:signInWithPassword',
        {'key': PrincipalConfig.firebaseToken});
    try {
      final resp = await http.post(url, body: json.encode(authData));
      print('-----------SINCE HERE----------------');
      print(resp.body);
      
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
    // final url = Uri.https(_baseUrl_FireBase, '/v1/accounts:signUp', {'key': PrincipalConfig.firebaseToken});
    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/register');
    try{
      final resp = await http.post(url, headers: head, body: json.encode(authData));

      // final Map<String, dynamic> decodeResp = json.decode(resp.body);
      print('-----------SINCE HERE --------');
      
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
    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/user');
    try {
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
    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/user/email-verified');
    try {
      final resp = await http.get(url, headers: head);
      print('Verified EMAIL-------');
      // {"email_verified":false}
      print(resp);
      print(resp.body);

    
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
    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/user');
    try {
      final resp = await http.delete(url, headers: head);
      print('Delete Account-------');
      // {"email_verified":false}
      print(resp);
      print(resp.body);

    
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
    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/user');
    try {
      final resp = await http.put(url, headers: head, body: json.encode(authData));
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      print(decodeResp);
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

    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/user/verify-email');
    try {
      final resp = await http.put(url,headers: head);
    // {"success":"A verification link will be sent to the email"}
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

    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/user/reset-password');
    try{

      final resp = await http.put(url,headers: head, body: json.encode(authData));
      print('resetPassword-------');
      print(resp);
      print(resp.body);
    }on Exception catch (e) {
      print(e);
    }

    return null;
  }
  Future<bool> changePassword(String idToken, String password) async {
    final Map<String, String> head = {
      HttpHeaders.authorizationHeader: idToken,
      HttpHeaders.contentTypeHeader: 'application/json'
      }; 
    final Map<String, dynamic> authData = {'password': password};

    final url = Uri.https(PrincipalConfig.baseUrl, '/auth/user/change-password');
    try {
      final resp = await http.put(url,headers: head, body: json.encode(authData));
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
