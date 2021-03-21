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

    return await openDatabase(path, version: 4, onOpen: (db) {},
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
    });
  }
}
