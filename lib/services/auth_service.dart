import 'dart:convert';

import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario.dart';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class AuthService with ChangeNotifier {
  late Usuario usuario;

  Future login(String email, String password) async {
    final data = {"email": email, "password": password};

    final resp = await http.post(Uri.parse("${Environment.apiUrl}/login"),
        body: jsonEncode(data), headers: {"Content-Type": "application/json"});

    print(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;
    }
  }
}
