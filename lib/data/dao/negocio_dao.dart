import 'package:app_ventas/data/db_provider.dart';
import 'package:app_ventas/data/models/login_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class LoginDao implements DBProvider {
  Future<int> nuevoUsuario(Usuario nuevoUsuario) async {
    final db = await database;
    final res = await db.insert('Usuario', nuevoUsuario.toJson());
    return res;
  }

  Future<Usuario> getUsuarioById(int id) async {
    final db = await database;
    final res =
        await db.query('Usuario', where: 'usuarioId = ?', whereArgs: [id]);
    return res.isNotEmpty ? Usuario.fromJson(res.first) : null;
  }

  Future<Usuario> getUsuario() async {
    final db = await database;
    final res = await db.query('Usuario');
    return res.isNotEmpty ? Usuario.fromJson(res.first) : null;
  }

  Future<List<Usuario>> getUsuarios() async {
    final db = await database;
    final res = await db.query('Usuario');
    return res.isNotEmpty ? res.map((e) => Usuario.fromJson(e)).toList() : [];
  }

  Future<List<Usuario>> getUsuariosByTipo(String token) async {
    final db = await database;
    final res =
        await db.query('Usuario', where: 'token = ?', whereArgs: [token]);
    return res.isNotEmpty ? res.map((e) => Usuario.fromJson(e)).toList() : [];
  }

  Future<int> updateUsuario(Usuario nuevoUsuario) async {
    final db = await database;
    final res = await db.update('Usuario', nuevoUsuario.toJson(),
        where: 'usuarioId = ?', whereArgs: [nuevoUsuario.usuarioId]);
    return res;
  }

  Future<int> deleteUsuario(int id) async {
    final db = await database;
    final res =
        await db.delete('Usuario', where: 'usuarioId = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllUsuario() async {
    final db = await database;
    final res = await db.delete('Usuario');
    return res;
  }

  @override
  Future<Database> get database => DBProvider.db.database;

  @override
  Future<Database> initDB() {
    return DBProvider.db.initDB();
  }
}
