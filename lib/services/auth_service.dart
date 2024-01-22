import 'dart:convert';

import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;

  // Create storage
  final _storage = const FlutterSecureStorage();

  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  // Getters del token de forma estática
  static Future<String> getToken() async {
    final token = await const FlutterSecureStorage().read(key: 'token');
    return token ?? 'No hay token';
  }

  static Future<void> deleteToken() async {
    await const FlutterSecureStorage().delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    _autenticando = true;
    final data = {
      'email': email,
      'password': password,
    };

    final uri = Uri.parse('${Environment.apiUrl}/login');

    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    _autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(json.decode(resp.body));
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      return true;
    }
    return false;
  }

  Future<dynamic> register(String nombre, String email, String password) async {
    _autenticando = true;
    final data = {'nombre': nombre, 'email': email, 'password': password};
    final uri = Uri.parse('${Environment.apiUrl}/login/new');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    _autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(json.decode(resp.body));
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      return true;
    }
    return jsonDecode(resp.body)['msg'];
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    final uri = Uri.parse('${Environment.apiUrl}/login/renew');
    final resp = await http.get(uri,
        headers: {'Content-Type': 'application/json', 'x-token': token!});
    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(json.decode(resp.body));
      usuario = loginResponse.usuario;
      await _guardarToken(token);
      return true;
    }
    _logout();
    return false;
  }

  Future<void> _guardarToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> _logout() async {
    await _storage.delete(key: 'token');
  }
}
