import 'package:flutter/material.dart';

import 'package:app_ventas/helper/apiRest.dart';
import 'package:app_ventas/data/dao/login_dao.dart';
import 'package:app_ventas/data/dao/cliente_dao.dart';

import 'package:app_ventas/data/models/sync_model.dart';
import 'package:app_ventas/data/models/login_model.dart';
import 'package:app_ventas/data/shared_prefs/preferencias_usuario.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:package_info/package_info.dart';

class UsuarioProvider with ChangeNotifier {
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    //final info = await PackageInfo.fromPlatform();

    final authData = {
      "login": email,
      "pass": password,
      "imei": "123",
      "version": "2.7"
    };

    final resp = await http.post('$url/LoginNew',
        body: json.encode(authData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      _prefs.login = 'login';
      return {'ok': false, 'mensaje': resp.body};
    }

    final loginResponse = usuarioFromJson(resp.body);
    await LoginDao().nuevoUsuario(loginResponse);
    _prefs.login = 'home';
    return {'ok': true};
  }

  Future<Map<String, dynamic>> logout() async {
    final u = await LoginDao().getUsuario();
    final authData = {"login": u.login};

    final resp = await http.post('$url/Logout',
        body: json.encode(authData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return {'ok': false, 'mensaje': resp.body};
    }

    await LoginDao().deleteAllUsuario();
    await ClienteDao().deleteAllCliente();
    _prefs.login = 'login';
    return {'ok': true};
  }

  Future<Map<String, dynamic>> sincronizacion() async {
    final u = await LoginDao().getUsuario();

    final resp =
        await http.get('$url/Sync?operarioId=${u.usuarioId}&version=2.7');

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      _prefs.login = 'login';
      return {'ok': false, 'mensaje': resp.body};
    }

    final syncResponse = syncFromJson(resp.body);
    await ClienteDao().insertClientes(syncResponse.clientes);
    _prefs.login = 'home';
    return {'ok': true};
  }
}
