// To parse this JSON data, do
//
//     final sync = syncFromJson(jsonString);

import 'dart:convert';

Sync syncFromJson(String str) => Sync.fromJson(json.decode(str));

String syncToJson(Sync data) => json.encode(data.toJson());

class Sync {
  Sync({
    this.identidades,
    this.departamentos,
    this.provincias,
    this.distritos,
    this.negocios,
    this.clientes,
  });

  List<Identidad> identidades;
  List<Departamento> departamentos;
  List<Provincia> provincias;
  List<Distrito> distritos;
  List<Negocio> negocios;
  List<Cliente> clientes;

  factory Sync.fromJson(Map<String, dynamic> json) => Sync(
        identidades: List<Identidad>.from(
            json["identidades"].map((x) => Identidad.fromJson(x))),
        departamentos: List<Departamento>.from(
            json["departamentos"].map((x) => Departamento.fromJson(x))),
        provincias: List<Provincia>.from(
            json["provincias"].map((x) => Provincia.fromJson(x))),
        distritos: List<Distrito>.from(
            json["distritos"].map((x) => Distrito.fromJson(x))),
        negocios: List<Negocio>.from(
            json["negocios"].map((x) => Negocio.fromJson(x))),
        clientes: List<Cliente>.from(
            json["clientes"].map((x) => Cliente.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "identidades": List<dynamic>.from(identidades.map((x) => x.toJson())),
        "departamentos":
            List<dynamic>.from(departamentos.map((x) => x.toJson())),
        "provincias": List<dynamic>.from(provincias.map((x) => x.toJson())),
        "distritos": List<dynamic>.from(distritos.map((x) => x.toJson())),
        "negocios": List<dynamic>.from(negocios.map((x) => x.toJson())),
        "clientes": List<dynamic>.from(clientes.map((x) => x.toJson())),
      };
}

class Cliente {
  Cliente({
    this.clienteId,
    this.empresaId,
    this.codigoInterno,
    this.tipoClienteId,
    this.tipo,
    this.documentoIdentidad,
    this.documento,
    this.nombreCliente,
    this.departamentoId,
    this.provinciaId,
    this.distritoId,
    this.direccion,
    this.nroCelular,
    this.giroNegocioId,
    this.email,
    this.motivoNoCompra,
    this.productoInteres,
    this.personalVendedorId,
    this.latitud,
    this.longitud,
    this.estado,
    this.condFacturacion,
    this.fechaVisita,
    this.nombreDepartamento,
    this.nombreProvincia,
    this.nombreDistrito,
    this.nombreGiroNegocio,
    this.tipoPersonal,
    this.identity,
  });

  int clienteId;
  int empresaId;
  String codigoInterno;
  int tipoClienteId;
  String tipo;
  String documentoIdentidad;
  String documento;
  String nombreCliente;
  int departamentoId;
  int provinciaId;
  int distritoId;
  String direccion;
  String nroCelular;
  int giroNegocioId;
  String email;
  String motivoNoCompra;
  String productoInteres;
  int personalVendedorId;
  String latitud;
  String longitud;
  int estado;
  int condFacturacion;
  String fechaVisita;
  String nombreDepartamento;
  String nombreProvincia;
  String nombreDistrito;
  String nombreGiroNegocio;
  int tipoPersonal;
  int identity;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        clienteId: json["clienteId"],
        empresaId: json["empresaId"],
        codigoInterno: json["codigoInterno"],
        tipoClienteId: json["tipoClienteId"],
        tipo: json["tipo"],
        documentoIdentidad: json["documentoIdentidad"],
        documento: json["documento"],
        nombreCliente: json["nombreCliente"],
        departamentoId: json["departamentoId"],
        provinciaId: json["provinciaId"],
        distritoId: json["distritoId"],
        direccion: json["direccion"],
        nroCelular: json["nroCelular"],
        giroNegocioId: json["giroNegocioId"],
        email: json["email"],
        motivoNoCompra: json["motivoNoCompra"],
        productoInteres: json["productoInteres"],
        personalVendedorId: json["personalVendedorId"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        estado: json["estado"],
        condFacturacion: json["condFacturacion"],
        fechaVisita: json["fechaVisita"],
        nombreDepartamento: json["nombreDepartamento"],
        nombreProvincia: json["nombreProvincia"],
        nombreDistrito: json["nombreDistrito"],
        nombreGiroNegocio: json["nombreGiroNegocio"],
        tipoPersonal: json["tipoPersonal"],
        identity: json["identity"],
      );

  Map<String, dynamic> toJson() => {
        "clienteId": clienteId ?? 0,
        "empresaId": empresaId ?? 0,
        "codigoInterno": codigoInterno ?? "",
        "tipoClienteId": tipoClienteId ?? 0,
        "tipo": tipo ?? "",
        "documentoIdentidad": documentoIdentidad ?? "",
        "documento": documento ?? "",
        "nombreCliente": nombreCliente ?? "",
        "departamentoId": departamentoId ?? 0,
        "provinciaId": provinciaId ?? 0,
        "distritoId": distritoId ?? 0,
        "direccion": direccion ?? "",
        "nroCelular": nroCelular ?? "",
        "giroNegocioId": giroNegocioId ?? 0,
        "email": email ?? "",
        "motivoNoCompra": motivoNoCompra ?? "",
        "productoInteres": productoInteres ?? "",
        "personalVendedorId": personalVendedorId ?? 0,
        "latitud": latitud ?? "",
        "longitud": longitud ?? "",
        "estado": estado ?? 0,
        "condFacturacion": condFacturacion,
        "fechaVisita": fechaVisita ?? "",
        "nombreDepartamento": nombreDepartamento ?? "",
        "nombreProvincia": nombreProvincia ?? "",
        "nombreDistrito": nombreDistrito ?? "",
        "nombreGiroNegocio": nombreGiroNegocio ?? "",
        "tipoPersonal": tipoPersonal ?? 0,
        "identity": identity ?? 0
      };
}

class Departamento {
  Departamento({
    this.departamentoId,
    this.codigo,
    this.departamento,
  });

  int departamentoId;
  String codigo;
  String departamento;

  factory Departamento.fromJson(Map<String, dynamic> json) => Departamento(
        departamentoId: json["departamentoId"],
        codigo: json["codigo"],
        departamento: json["departamento"],
      );

  Map<String, dynamic> toJson() => {
        "departamentoId": departamentoId,
        "codigo": codigo,
        "departamento": departamento,
      };
}

class Distrito {
  Distrito({
    this.distritoId,
    this.codigoProvincia,
    this.codigoDepartamento,
    this.codigoDistrito,
    this.nombre,
  });

  int distritoId;
  String codigoProvincia;
  String codigoDepartamento;
  String codigoDistrito;
  String nombre;

  factory Distrito.fromJson(Map<String, dynamic> json) => Distrito(
        distritoId: json["distritoId"],
        codigoProvincia: json["codigoProvincia"],
        codigoDepartamento: json["codigoDepartamento"],
        codigoDistrito: json["codigoDistrito"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "distritoId": distritoId,
        "codigoProvincia": codigoProvincia,
        "codigoDepartamento": codigoDepartamento,
        "codigoDistrito": codigoDistrito,
        "nombre": nombre,
      };
}

class Identidad {
  Identidad({
    this.codigo,
    this.descripcion,
  });

  String codigo;
  String descripcion;

  factory Identidad.fromJson(Map<String, dynamic> json) => Identidad(
        codigo: json["codigo"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "descripcion": descripcion,
      };
}

class Negocio {
  Negocio({
    this.negocioId,
    this.nombre,
  });

  int negocioId;
  String nombre;

  factory Negocio.fromJson(Map<String, dynamic> json) => Negocio(
        negocioId: json["negocioId"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "negocioId": negocioId,
        "nombre": nombre,
      };
}

class Provincia {
  Provincia({
    this.provinciaId,
    this.codigo,
    this.provincia,
    this.codigoDeparmento,
  });

  int provinciaId;
  String codigo;
  String provincia;
  String codigoDeparmento;

  factory Provincia.fromJson(Map<String, dynamic> json) => Provincia(
        provinciaId: json["provinciaId"],
        codigo: json["codigo"],
        provincia: json["provincia"],
        codigoDeparmento: json["codigoDeparmento"],
      );

  Map<String, dynamic> toJson() => {
        "provinciaId": provinciaId,
        "codigo": codigo,
        "provincia": provincia,
        "codigoDeparmento": codigoDeparmento,
      };
}
