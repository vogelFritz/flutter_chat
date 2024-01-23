import 'dart:convert';

import 'package:chat/global/environment.dart';
import 'package:chat/models/usuarios_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat/models/usuario.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final uri = Uri.parse('${Environment.apiUrl}/usuarios');
      final resp = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken(),
      });

      final UsuariosResponse usuariosResponse =
          UsuariosResponse.fromJson(jsonDecode(resp.body));

      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
