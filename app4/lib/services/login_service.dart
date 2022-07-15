import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService extends ChangeNotifier {
  final String _baseUrl_Mikel = '3a82-190-42-109-234.ngrok.io';
  final String _baseUrl_FireBase = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAs1yaOZNmEl5M63ero5XMJyQSwhm1wA_M';

  Future<String> loginUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    
    };
    final url = Uri.https(_baseUrl_Mikel, '/auth/register');
    // final url =
    //     Uri.https(_baseUrl_FireBase, '/v1/accounts:signUp', {'key': _firebaseToken});
    final resp = await http.post(url, headers:  <String, String>{
      'Content-Type': 'application/json',
    }, body: json.encode(authData));

    // final Map<String, dynamic> decodeResp = json.decode(resp.body);
    print('-----------SINCE HERE----------------');
    print(resp);
    print(resp.body);
    return '';
  }
}
