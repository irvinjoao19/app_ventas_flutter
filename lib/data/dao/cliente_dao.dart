import 'package:app_ventas/data/db_provider.dart';
import 'package:app_ventas/data/models/sync_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ClienteDao implements DBProvider {
  Future<void> insertClientes(List<Cliente> clientes) async {
    final db = await database;
    clientes.forEach((c) async {
      await db.insert('Cliente', c.toJson());
    });
  }

  Future<void> insertCliente(Cliente cliente) async {
    final db = await database;
    await db.insert('Cliente', cliente.toJson());
  }

  Future<Cliente> getClienteById(int id) async {
    final db = await database;
    final res =
        await db.query('Cliente', where: 'clienteId = ?', whereArgs: [id]);
    return res.isNotEmpty ? Cliente.fromJson(res.first) : null;
  }

  Future<Cliente> getCliente() async {
    final db = await database;
    final res = await db.query('Cliente');
    return res.isNotEmpty ? Cliente.fromJson(res.first) : null;
  }

  Future<List<Cliente>> getClientes() async {
    final db = await database;
    final res = await db.query('Cliente');
    return res.isNotEmpty ? res.map((e) => Cliente.fromJson(e)).toList() : [];
  }

  Future<List<Cliente>> getClientesByTipo(String token) async {
    final db = await database;
    final res =
        await db.query('Cliente', where: 'token = ?', whereArgs: [token]);
    return res.isNotEmpty ? res.map((e) => Cliente.fromJson(e)).toList() : [];
  }

  Future<int> updateCliente(Cliente c) async {
    final db = await database;
    final res = await db.update('Cliente', c.toJson(),
        where: 'clienteId = ?', whereArgs: [c.clienteId]);
    return res;
  }

  Future<int> deleteCliente(int id) async {
    final db = await database;
    final res =
        await db.delete('Cliente', where: 'clienteId = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllCliente() async {
    final db = await database;
    final res = await db.delete('Cliente');
    return res;
  }

  @override
  Future<Database> get database => DBProvider.db.database;

  @override
  Future<Database> initDB() {
    return DBProvider.db.initDB();
  }
}
