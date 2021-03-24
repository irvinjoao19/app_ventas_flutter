import 'package:app_ventas/data/db_provider.dart';
import 'package:app_ventas/data/models/pedido_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PedidoDetalleDao implements DBProvider {
/*   Future<void> insertPedidos(List<Pedido> Pedidos) async {
    final db = await database;
    Pedidos.forEach((c) async {
      await db.insert('Pedido', c.toJson());
    });
  } */

  Future<void> insertPedido(PedidoDetalle pedido) async {
    final db = await database;
    await db.insert('PedidoDetalle', pedido.toJson());
  }

  Future<PedidoDetalle> getPedidoById(int id) async {
    final db = await database;
    final res =
        await db.query('PedidoDetalle', where: 'pedidoId = ?', whereArgs: [id]);
    return res.isNotEmpty ? PedidoDetalle.fromJson(res.first) : null;
  }

  Future<PedidoDetalle> getPedido() async {
    final db = await database;
    final res = await db.query('PedidoDetalle');
    return res.isNotEmpty ? PedidoDetalle.fromJson(res.first) : null;
  }

  Future<List<PedidoDetalle>> getPedidos() async {
    final db = await database;
    final res = await db.query('PedidoDetalle');
    return res.isNotEmpty
        ? res.map((e) => PedidoDetalle.fromJson(e)).toList()
        : [];
  }

  Future<List<PedidoDetalle>> getPedidosByTipo(String token) async {
    final db = await database;
    final res =
        await db.query('PedidoDetalle', where: 'token = ?', whereArgs: [token]);
    return res.isNotEmpty
        ? res.map((e) => PedidoDetalle.fromJson(e)).toList()
        : [];
  }

  Future<int> updatePedido(Pedido c) async {
    final db = await database;
    final res = await db.update('PedidoDetalle', c.toJson(),
        where: 'pedidoId = ?', whereArgs: [c.pedidoId]);
    return res;
  }

  Future<int> deletePedido(int id) async {
    final db = await database;
    final res = await db
        .delete('PedidoDetalle', where: 'pedidoId = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllPedido() async {
    final db = await database;
    final res = await db.delete('PedidoDetalle');
    return res;
  }

  @override
  Future<Database> get database => DBProvider.db.database;

  @override
  Future<Database> initDB() {
    return DBProvider.db.initDB();
  }
}
