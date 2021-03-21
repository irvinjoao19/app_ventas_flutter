import 'package:app_ventas/data/db_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'package:app_ventas/data/models/sync_model.dart';

class IdentidadDao implements DBProvider {
  Future<int> nuevoIdentidad(Identidad nuevoIdentidad) async {
    final db = await database;
    final res = await db.insert('Identidad', nuevoIdentidad.toJson());
    return res;
  }

  Future<Identidad> getIdentidadById(int id) async {
    final db = await database;
    final res =
        await db.query('Identidad', where: 'IdentidadId = ?', whereArgs: [id]);
    return res.isNotEmpty ? Identidad.fromJson(res.first) : null;
  }

  Future<Identidad> getIdentidad() async {
    final db = await database;
    final res = await db.query('Identidad');
    return res.isNotEmpty ? Identidad.fromJson(res.first) : null;
  }

  Future<List<Identidad>> getIdentidads() async {
    final db = await database;
    final res = await db.query('Identidad');
    return res.isNotEmpty ? res.map((e) => Identidad.fromJson(e)).toList() : [];
  }

  Future<List<Identidad>> getIdentidadsByTipo(String token) async {
    final db = await database;
    final res =
        await db.query('Identidad', where: 'token = ?', whereArgs: [token]);
    return res.isNotEmpty ? res.map((e) => Identidad.fromJson(e)).toList() : [];
  }

  Future<int> updateIdentidad(Identidad nuevoIdentidad) async {
    final db = await database;
    final res = await db.update('Identidad', nuevoIdentidad.toJson(),
        where: 'IdentidadId = ?', whereArgs: [nuevoIdentidad.codigo]);
    return res;
  }

  Future<int> deleteIdentidad(int id) async {
    final db = await database;
    final res =
        await db.delete('Identidad', where: 'IdentidadId = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllIdentidad() async {
    final db = await database;
    final res = await db.delete('Identidad');
    return res;
  }

  @override
  Future<Database> get database => DBProvider.db.database;

  @override
  Future<Database> initDB() {
    return DBProvider.db.initDB();
  }
}
