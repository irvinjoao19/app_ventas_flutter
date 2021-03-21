import 'package:app_ventas/data/db_provider.dart';
import 'package:app_ventas/data/models/producto_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ProductoDao implements DBProvider {
  Future<void> insertProductos(List<Producto> productos) async {
    final db = await database;
    productos.forEach((c) async {
      final p = await getProductoById(c.productoId);
      if (p != null) {
        await updateProducto(p);
      } else {
        await db.insert('Producto', c.toJson());
      }
    });
  }

  Future<Producto> getProductoById(int id) async {
    final db = await database;
    final res =
        await db.query('Producto', where: 'productoId = ?', whereArgs: [id]);
    return res.isNotEmpty ? Producto.fromJson(res.first) : null;
  }

  Future<Producto> getProducto() async {
    final db = await database;
    final res = await db.query('Producto');
    return res.isNotEmpty ? Producto.fromJson(res.first) : null;
  }

  Future<List<Producto>> getProductos() async {
    final db = await database;
    final res = await db.query('Producto');
    return res.isNotEmpty ? res.map((e) => Producto.fromJson(e)).toList() : [];
  }

  Future<List<Producto>> getProductosByTipo(String token) async {
    final db = await database;
    final res =
        await db.query('Producto', where: 'token = ?', whereArgs: [token]);
    return res.isNotEmpty ? res.map((e) => Producto.fromJson(e)).toList() : [];
  }

  Future<int> updateProducto(Producto c) async {
    final db = await database;
    final res = await db.update('Producto', c.toJson(),
        where: 'productoId = ?', whereArgs: [c.productoId]);
    return res;
  }

  Future<int> deleteProducto(int id) async {
    final db = await database;
    final res =
        await db.delete('Producto', where: 'productoId = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllProducto() async {
    final db = await database;
    final res = await db.delete('Producto');
    return res;
  }

  @override
  Future<Database> get database => DBProvider.db.database;

  @override
  Future<Database> initDB() {
    return DBProvider.db.initDB();
  }
}
