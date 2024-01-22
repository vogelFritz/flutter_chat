// To parse this JSON data, do
//
//     final mensajesResponse = mensajesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:chat/models/usuario.dart';

LoginResponse mensajesResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String mensajesResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final bool ok;
  final Usuario usuario;
  final String token;

  LoginResponse({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
      };
}
