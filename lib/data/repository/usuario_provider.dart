import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:app_amsys/src/dao/login_dao.dart';
import 'package:app_amsys/src/shared_prefs/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

import 'package:app_amsys/src/models/login_model.dart';

class UsuarioProvider with ChangeNotifier {
  final String _url = 'http://alphaman-001-site8.ftempurl.com/api';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {'User': email, 'Password': password};

    final resp = await http.post('$_url/usuario/login',
        body: json.encode(authData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    final loginResponse = loginModelFromJson(resp.body);

    if (loginResponse.response.codigo == "0000") {
      await LoginDao().nuevoUsuario(loginResponse.data);
      _prefs.login = 'home';
      return {'ok': true};
    } else {
      _prefs.login = 'login';
      return {'ok': false, 'mensaje': loginResponse.response.comentario};
    }
  }

  Future<void> logout() async {
    await LoginDao().deleteAllUsuario();
    _prefs.login = 'login';
  }
}
