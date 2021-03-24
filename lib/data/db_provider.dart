import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'AppVentas.db');
    print(path);

    return await openDatabase(path, version: 5, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Usuario(
          usuarioId INTEGER PRIMARY KEY,
          documento TEXT,
          apellidos TEXT,
          nombres TEXT,
          tipo INTEGER,
          cargoId INTEGER,
          nombreCargo TEXT,
          telefono TEXT,
          email TEXT,
          login TEXT,
          pass TEXT,
          envioOnline TEXT,
          perfil INTEGER,
          descripcionPerfil TEXT,
          estado INTEGER,
          localId INTEGER)        
        ''');
      await db.execute('''
        CREATE TABLE Identidad(
          codigo TEXT PRIMARY KEY,
          descripcion TEXT)     
        ''');
      await db.execute('''
        CREATE TABLE Departamento(
          departamentoId INTEGER PRIMARY KEY,
          codigo TEXT,
          departamento TEXT)
        ''');

      await db.execute('''
        CREATE TABLE Provincia(
          provinciaId INTEGER PRIMARY KEY,
          codigo TEXT,
          provincia TEXT,
          codigoDeparmento TEXT)
        ''');

      await db.execute('''
        CREATE TABLE Distrito(
          distritoId INTEGER PRIMARY KEY,
          codigoProvincia TEXT,
          codigoDepartamento TEXT,
          codigoDistrito TEXT,
          nombre TEXT)
        ''');
      await db.execute('''
        CREATE TABLE Negocio(
          negocioId INTEGER PRIMARY KEY,
          nombre TEXT)       
        ''');
      await db.execute('''
        CREATE TABLE Cliente(
          clienteId INTEGER PRIMARY KEY,
          empresaId INTEGER,
          codigoInterno TEXT,   
          tipoClienteId INTEGER,
          tipo TEXT,
          documentoIdentidad TEXT,
          documento TEXT,
          nombreCliente TEXT,
          departamentoId INTEGER,
          provinciaId INTEGER,
          distritoId INTEGER ,
          direccion TEXT,
          nroCelular TEXT,
          giroNegocioId INTEGER,
          email TEXT,
          motivoNoCompra TEXT,
          productoInteres TEXT,
          personalVendedorId INTEGER,
          latitud TEXT,
          longitud TEXT,
          estado INTEGER,
          condFacturacion INTEGER,
          fechaVisita TEXT,
          nombreDepartamento TEXT,
          nombreProvincia TEXT,
          nombreDistrito TEXT,
          nombreGiroNegocio TEXT,
          tipoPersonal INTEGER,
          identity INTEGER)
        ''');
      await db.execute('''
        CREATE TABLE Producto(
          productoId INTEGER PRIMARY KEY, 
          codigoProducto TEXT,
          nombreProducto TEXT,
          descripcionProducto TEXT,
          abreviaturaProducto TEXT,
          stock NUMERIC,
          precio NUMERIC,
          nombreCategoria TEXT,
          nombreMarca TEXT,
          factor NUMERIC,
          precio2 NUMERIC,
          precioMayMenor NUMERIC,
          precioMayMayor NUMERIC,
          rangoCajaHorizontal NUMERIC,
          rangoCajaMayorista NUMERIC)
        ''');
      await db.execute('''
        CREATE TABLE Pedido(
          pedidoId INTEGER PRIMARY KEY, 
          empresaId INTEGER, 
          numeroPedido TEXT,
          numeroPedido TEXT,
          codigoInternoSuministro TEXT,
          almacenId INTEGER,
          tipoDocumento INTEGER,
          puntoVentaId INTEGER,
          cuadrillaId INTEGER,
          personalVendedorId INTEGER,
          formaPagoId INTEGER,
          monedaId INTEGER,
          tipoCambio NUMERIC,
          codigoInternoCliente TEXT,
          clienteId INTEGER,
          direccionPedido TEXT,
          porcentajeIgv NUMERIC,
          observacion TEXT,
          latitud TEXT,
          longitud TEXT,
          estado INTEGER,
          subtotal NUMERIC,
          totalIgv NUMERIC,
          totalNeto NUMERIC,
          numeroDocumento TEXT,
          fechaFacturaPedido TEXT,
          localId INTEGER,
          identity INTEGER,
          nombreCliente TEXT,
          tipoPersonal INTEGER
        )
        ''');
      await db.execute('''
        CREATE TABLE PedidoDetalle(
          pedidoDetalleId INTEGER PRIMARY KEY,
          pedidoId INTEGER,
          pedidoItem INTEGER,
          productoId INTEGER,
          precioVenta NUMERIC,
          porcentajeDescuento NUMERIC,
          descuentoPedido NUMERIC,
          cantidad NUMERIC,
          porcentajeIgv NUMERIC,
          totalPedido NUMERIC,
          numeroPedido TEXT,
          identity INTEGER,
          identityDetalle INTEGER,
          localId INTEGER,
          codigo TEXT,
          nombre TEXT,
          descripcion TEXT,
          abreviaturaProducto TEXT,
          unidadMedida NUMERIC,
          stockMinimo NUMERIC,
          subTotal NUMERIC,
          factor NUMERIC,
          precio1 NUMERIC,
          precio2 NUMERIC,
          precioMayMenor NUMERIC,
          precioMayMayor NUMERIC,
          rangoCajaHorizontal NUMERIC,
          rangoCajaMayorista NUMERIC,
          estado INTEGER,
          active INTEGER
        )
        ''');
    });
  }
}
