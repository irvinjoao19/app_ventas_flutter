import 'package:app_ventas/data/dao/producto_dao.dart';
import 'package:app_ventas/data/api_rest.dart';
import 'package:flutter/material.dart';

import 'package:app_ventas/data/dao/login_dao.dart';
import 'package:app_ventas/data/models/producto_model.dart';

import 'dart:async';

import 'package:http/http.dart' as http;

class ProductoProvider with ChangeNotifier {
  List<Producto> _productos = [];

  final _productoStreamController =
      StreamController<List<Producto>>.broadcast();

  Function(List<Producto>) get productosSink =>
      _productoStreamController.sink.add;

  Stream<List<Producto>> get productoStream => _productoStreamController.stream;

  void disposeStreams() {
    _productoStreamController?.close();
  }

  getProductos() async {
    final u = await LoginDao().getUsuario();

    final resp = await http.get('$url//GetProductos?local=${u.localId}');

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return [];
    }

    final response = productosFromJson(resp.body);
    await ProductoDao().insertProductos(response);

    final productos = await ProductoDao().getProductos();
    this._productos = [...productos];
    productosSink(_productos);
    notifyListeners();
  }
}
