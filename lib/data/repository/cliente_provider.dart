import 'package:app_ventas/data/models/response_model.dart';
import 'package:flutter/material.dart';

import 'package:app_ventas/helper/apiRest.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:app_ventas/data/dao/cliente_dao.dart';
import 'package:app_ventas/data/models/sync_model.dart';

class ClienteProvider with ChangeNotifier {
  Cliente _cliente = new Cliente();
  List<Cliente> _clientes = [];

  final _clienteStreamController = StreamController<List<Cliente>>.broadcast();
  final _clientOneStreamController = StreamController<Cliente>.broadcast();

  Function(List<Cliente>) get clientsSink => _clienteStreamController.sink.add;

  Stream<List<Cliente>> get clientStream => _clienteStreamController.stream;

  Function(Cliente) get clientOneSink => _clientOneStreamController.sink.add;

  Stream<Cliente> get clientOneStream => _clientOneStreamController.stream;

  void disposeStreams() {
    _clienteStreamController?.close();
    _clientOneStreamController?.close();
  }

  getClientes() async {
    final clients = await ClienteDao().getClientes();
    this._clientes = [...clients];
    clientsSink(_clientes);
    notifyListeners();
  }

  Future<Map<String, dynamic>> crearCliente(Cliente c) async {
    final _body = json.encode(c.toJson());

    final resp = await http
        .post('$url/SaveCliente', body: _body, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return {'ok': false, 'mensaje': resp.body};
    }

    final response = responseFromJson(resp.body);
    c.identity = response.codigoRetorno;

    if (c.clienteId == 0) {
      await ClienteDao().insertCliente(c);
      this._clientes.add(c);
      clientsSink(this._clientes);
      notifyListeners();
    } else {
      await ClienteDao().updateCliente(c);
      this._cliente = c;
      clientOneSink(this._cliente);
      notifyListeners();
    }

    return {'ok': true};
  }

  getCliente(Cliente c) async {
    this._cliente = c;
    clientOneSink(this._cliente);
  }
}
