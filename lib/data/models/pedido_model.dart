// To parse this JSON data, do
//
//     final pedido = pedidoFromJson(jsonString);

import 'dart:convert';

Pedido pedidoFromJson(String str) => Pedido.fromJson(json.decode(str));

String pedidoToJson(Pedido data) => json.encode(data.toJson());

class Pedido {
  Pedido({
    this.pedidoId,
    this.empresaId,
    this.numeroPedido,
    this.codigoInternoSuministro,
    this.almacenId,
    this.tipoDocumento,
    this.puntoVentaId,
    this.cuadrillaId,
    this.personalVendedorId,
    this.formaPagoId,
    this.monedaId,
    this.tipoCambio,
    this.codigoInternoCliente,
    this.clienteId,
    this.direccionPedido,
    this.porcentajeIgv,
    this.observacion,
    this.latitud,
    this.longitud,
    this.estado,
    this.subtotal,
    this.totalIgv,
    this.totalNeto,
    this.numeroDocumento,
    this.fechaFacturaPedido,
    this.localId,
    this.identity,
    this.nombreCliente,
    this.tipoPersonal,
    this.detalles,
  });

  int pedidoId;
  int empresaId;
  String numeroPedido;
  String codigoInternoSuministro;
  int almacenId;
  int tipoDocumento;
  int puntoVentaId;
  int cuadrillaId;
  int personalVendedorId;
  int formaPagoId;
  int monedaId;
  double tipoCambio;
  String codigoInternoCliente;
  int clienteId;
  String direccionPedido;
  double porcentajeIgv;
  String observacion;
  String latitud;
  String longitud;
  int estado;
  double subtotal;
  double totalIgv;
  double totalNeto;
  String numeroDocumento;
  String fechaFacturaPedido;
  int localId;
  int identity;
  String nombreCliente;
  int tipoPersonal;
  List<PedidoDetalle> detalles;

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        pedidoId: json["pedidoId"],
        empresaId: json["empresaId"],
        numeroPedido: json["numeroPedido"],
        codigoInternoSuministro: json["codigoInternoSuministro"],
        almacenId: json["almacenId"],
        tipoDocumento: json["tipoDocumento"],
        puntoVentaId: json["puntoVentaId"],
        cuadrillaId: json["cuadrillaId"],
        personalVendedorId: json["personalVendedorId"],
        formaPagoId: json["formaPagoId"],
        monedaId: json["monedaId"],
        tipoCambio: json["tipoCambio"].toDouble(),
        codigoInternoCliente: json["codigoInternoCliente"],
        clienteId: json["clienteId"],
        direccionPedido: json["direccionPedido"],
        porcentajeIgv: json["porcentajeIGV"].toDouble(),
        observacion: json["observacion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        estado: json["estado"],
        subtotal: json["subtotal"].toDouble(),
        totalIgv: json["totalIgv"].toDouble(),
        totalNeto: json["totalNeto"].toDouble(),
        numeroDocumento: json["numeroDocumento"],
        fechaFacturaPedido: json["fechaFacturaPedido"],
        localId: json["localId"],
        identity: json["identity"],
        nombreCliente: json["nombreCliente"],
        tipoPersonal: json["tipoPersonal"],
        detalles: List<PedidoDetalle>.from(
            json["detalles"].map((x) => PedidoDetalle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pedidoId": pedidoId ?? 0,
        "empresaId": empresaId ?? 0,
        "numeroPedido": numeroPedido ?? "",
        "codigoInternoSuministro": codigoInternoSuministro ?? "",
        "almacenId": almacenId ?? 0,
        "tipoDocumento": tipoDocumento ?? 0,
        "puntoVentaId": puntoVentaId ?? 0,
        "cuadrillaId": cuadrillaId ?? 0,
        "personalVendedorId": personalVendedorId ?? 0,
        "formaPagoId": formaPagoId ?? 0,
        "monedaId": monedaId ?? 0,
        "tipoCambio": tipoCambio ?? 0.0,
        "codigoInternoCliente": codigoInternoCliente ?? "",
        "clienteId": clienteId ?? 0,
        "direccionPedido": direccionPedido ?? "",
        "porcentajeIGV": porcentajeIgv ?? 0.0,
        "observacion": observacion ?? "",
        "latitud": latitud ?? "",
        "longitud": longitud ?? "",
        "estado": estado ?? 0,
        "subtotal": subtotal ?? 0.0,
        "totalIgv": totalIgv ?? 0.0,
        "totalNeto": totalNeto ?? 0.0,
        "numeroDocumento": numeroDocumento ?? "",
        "fechaFacturaPedido": fechaFacturaPedido ?? "",
        "localId": localId ?? 0,
        "identity": identity ?? 0,
        "nombreCliente": nombreCliente ?? "",
        "tipoPersonal": tipoPersonal ?? 0,
        "detalles": List<dynamic>.from(detalles.map((x) => x.toJson())),
      };
      
  Map<String, dynamic> toInsert() => {
        "pedidoId": pedidoId ?? 0,
        "empresaId": empresaId ?? 0,
        "numeroPedido": numeroPedido ?? "",
        "codigoInternoSuministro": codigoInternoSuministro ?? "",
        "almacenId": almacenId ?? 0,
        "tipoDocumento": tipoDocumento ?? 0,
        "puntoVentaId": puntoVentaId ?? 0,
        "cuadrillaId": cuadrillaId ?? 0,
        "personalVendedorId": personalVendedorId ?? 0,
        "formaPagoId": formaPagoId ?? 0,
        "monedaId": monedaId ?? 0,
        "tipoCambio": tipoCambio ?? 0.0,
        "codigoInternoCliente": codigoInternoCliente ?? "",
        "clienteId": clienteId ?? 0,
        "direccionPedido": direccionPedido ?? "",
        "porcentajeIGV": porcentajeIgv ?? 0.0,
        "observacion": observacion ?? "",
        "latitud": latitud ?? "",
        "longitud": longitud ?? "",
        "estado": estado ?? 0,
        "subtotal": subtotal ?? 0.0,
        "totalIgv": totalIgv ?? 0.0,
        "totalNeto": totalNeto ?? 0.0,
        "numeroDocumento": numeroDocumento ?? "",
        "fechaFacturaPedido": fechaFacturaPedido ?? "",
        "localId": localId ?? 0,
        "identity": identity ?? 0,
        "nombreCliente": nombreCliente ?? "",
        "tipoPersonal": tipoPersonal ?? 0       
      };
}

class PedidoDetalle {
  PedidoDetalle({
    this.pedidoDetalleId,
    this.pedidoId,
    this.pedidoItem,
    this.productoId,
    this.precioVenta,
    this.porcentajeDescuento,
    this.descuentoPedido,
    this.cantidad,
    this.porcentajeIgv,
    this.totalPedido,
    this.numeroPedido,
    this.identity,
    this.identityDetalle,
    this.localId,
    this.codigo,
    this.nombre,
    this.descripcion,
    this.abreviaturaProducto,
    this.unidadMedida,
    this.stockMinimo,
    this.subTotal,
    this.factor,
    this.precio1,
    this.precio2,
    this.precioMayMenor,
    this.precioMayMayor,
    this.rangoCajaHorizontal,
    this.rangoCajaMayorista,
    this.estado,
    this.active,
  });

  int pedidoDetalleId;
  int pedidoId;
  int pedidoItem;
  int productoId;
  double precioVenta;
  double porcentajeDescuento;
  double descuentoPedido;
  double cantidad;
  double porcentajeIgv;
  double totalPedido;
  String numeroPedido;
  int identity;
  int identityDetalle;
  int localId;
  String codigo;
  String nombre;
  String descripcion;
  String abreviaturaProducto;
  double unidadMedida;
  double stockMinimo;
  double subTotal;
  double factor;
  double precio1;
  double precio2;
  double precioMayMenor;
  double precioMayMayor;
  double rangoCajaHorizontal;
  double rangoCajaMayorista;
  int estado;
  int active;

  factory PedidoDetalle.fromJson(Map<String, dynamic> json) => PedidoDetalle(
        pedidoDetalleId: json["pedidoDetalleId"],
        pedidoId: json["pedidoId"],
        pedidoItem: json["pedidoItem"],
        productoId: json["productoId"],
        precioVenta: json["precioVenta"].toDouble(),
        porcentajeDescuento: json["porcentajeDescuento"].toDouble(),
        descuentoPedido: json["descuentoPedido"].toDouble(),
        cantidad: json["cantidad"].toDouble(),
        porcentajeIgv: json["porcentajeIGV"].toDouble(),
        totalPedido: json["totalPedido"].toDouble(),
        numeroPedido: json["numeroPedido"],
        identity: json["identity"],
        identityDetalle: json["identityDetalle"],
        localId: json["localId"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        abreviaturaProducto: json["abreviaturaProducto"],
        unidadMedida: json["unidadMedida"].toDouble(),
        stockMinimo: json["stockMinimo"].toDouble(),
        subTotal: json["subTotal"].toDouble(),
        factor: json["factor"].toDouble(),
        precio1: json["precio1"].toDouble(),
        precio2: json["precio2"].toDouble(),
        precioMayMenor: json["precioMayMenor"].toDouble(),
        precioMayMayor: json["precioMayMayor"].toDouble(),
        rangoCajaHorizontal: json["rangoCajaHorizontal"].toDouble(),
        rangoCajaMayorista: json["rangoCajaMayorista"].toDouble(),
        estado: json["estado"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "pedidoDetalleId": pedidoDetalleId ?? 0,
        "pedidoId": pedidoId ?? 0,
        "pedidoItem": pedidoItem ?? 0,
        "productoId": productoId ?? 0,
        "precioVenta": precioVenta ?? 0.0,
        "porcentajeDescuento": porcentajeDescuento ?? 0.0,
        "descuentoPedido": descuentoPedido ?? 0.0,
        "cantidad": cantidad ?? 0.0,
        "porcentajeIGV": porcentajeIgv ?? 0.0,
        "totalPedido": totalPedido ?? 0.0,
        "numeroPedido": numeroPedido ?? "",
        "identity": identity ?? 0,
        "identityDetalle": identityDetalle ?? 0,
        "localId": localId ?? 0,
        "codigo": codigo ?? "",
        "nombre": nombre ?? "",
        "descripcion": descripcion ?? "",
        "abreviaturaProducto": abreviaturaProducto ?? "",
        "unidadMedida": unidadMedida ?? 0.0,
        "stockMinimo": stockMinimo ?? 0.0,
        "subTotal": subTotal ?? 0.0,
        "factor": factor ?? 0.0,
        "precio1": precio1 ?? 0.0,
        "precio2": precio2 ?? 0.0,
        "precioMayMenor": precioMayMenor ?? 0.0,
        "precioMayMayor": precioMayMayor ?? 0.0,
        "rangoCajaHorizontal": rangoCajaHorizontal ?? 0.0,
        "rangoCajaMayorista": rangoCajaMayorista ?? 0.0,
        "estado": estado ?? 0,
        "active": active ?? 0,
      };
}
