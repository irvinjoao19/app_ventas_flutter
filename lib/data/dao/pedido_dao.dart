import 'package:app_ventas/data/db_provider.dart';
import 'package:app_ventas/data/models/pedido_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PedidoDao implements DBProvider {
/*   Future<void> insertPedidos(List<Pedido> Pedidos) async {
    final db = await database;
    Pedidos.forEach((c) async {
      await db.insert('Pedido', c.toJson());
    });
  } */

  Future<void> insertPedido(Pedido pedido) async {
    final db = await database;
    await db.insert('Pedido', pedido.toInsert());
  }

  Future<Pedido> getPedidoById(int id) async {
    final db = await database;
    final res =
        await db.query('Pedido', where: 'pedidoId = ?', whereArgs: [id]);
    return res.isNotEmpty ? Pedido.fromJson(res.first) : null;
  }

  Future<Pedido> getPedido() async {
    final db = await database;
    final res = await db.query('Pedido');
    return res.isNotEmpty ? Pedido.fromJson(res.first) : null;
  }

  Future<List<Pedido>> getPedidos() async {
    final db = await database;
    final res = await db.query('Pedido');
    return res.isNotEmpty ? res.map((e) => Pedido.fromJson(e)).toList() : [];
  }

  Future<List<Pedido>> getPedidosByTipo(String token) async {
    final db = await database;
    final res =
        await db.query('Pedido', where: 'token = ?', whereArgs: [token]);
    return res.isNotEmpty ? res.map((e) => Pedido.fromJson(e)).toList() : [];
  }

  Future<int> updatePedido(Pedido c) async {
    final db = await database;
    final res = await db.update('Pedido', c.toInsert(),
        where: 'pedidoId = ?', whereArgs: [c.pedidoId]);
    return res;
  }

  Future<int> deletePedido(int id) async {
    final db = await database;
    final res =
        await db.delete('Pedido', where: 'pedidoId = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllPedido() async {
    final db = await database;
    final res = await db.delete('Pedido');
    return res;
  }

  @override
  Future<Database> get database => DBProvider.db.database;

  @override
  Future<Database> initDB() {
    return DBProvider.db.initDB();
  }
}
