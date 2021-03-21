// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

List<Producto> productosFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productosToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  Producto({
    this.productoId,
    this.codigoProducto,
    this.nombreProducto,
    this.descripcionProducto,
    this.abreviaturaProducto,
    this.stock,
    this.precio,
    this.nombreCategoria,
    this.nombreMarca,
    this.factor,
    this.precio2,
    this.precioMayMenor,
    this.precioMayMayor,
    this.rangoCajaHorizontal,
    this.rangoCajaMayorista,
  });

  int productoId;
  String codigoProducto;
  String nombreProducto;
  String descripcionProducto;
  String abreviaturaProducto;
  double stock;
  double precio;
  String nombreCategoria;
  String nombreMarca;
  double factor;
  double precio2;
  double precioMayMenor;
  double precioMayMayor;
  double rangoCajaHorizontal;
  double rangoCajaMayorista;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        productoId: json["productoId"],
        codigoProducto: json["codigoProducto"],
        nombreProducto: json["nombreProducto"],
        descripcionProducto: json["descripcionProducto"],
        abreviaturaProducto: json["abreviaturaProducto"],
        stock: json["stock"].toDouble(),
        precio: json["precio"].toDouble(),
        nombreCategoria: json["nombreCategoria"],
        nombreMarca: json["nombreMarca"],
        factor: json["factor"].toDouble(),
        precio2: json["precio2"].toDouble(),
        precioMayMenor: json["precioMayMenor"].toDouble(),
        precioMayMayor: json["precioMayMayor"].toDouble(),
        rangoCajaHorizontal: json["rangoCajaHorizontal"].toDouble(),
        rangoCajaMayorista: json["rangoCajaMayorista"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "productoId": productoId,
        "codigoProducto": codigoProducto,
        "nombreProducto": nombreProducto,
        "descripcionProducto": descripcionProducto,
        "abreviaturaProducto": abreviaturaProducto,
        "stock": stock,
        "precio": precio,
        "nombreCategoria": nombreCategoria,
        "nombreMarca": nombreMarca,
        "factor": factor,
        "precio2": precio2,
        "precioMayMenor": precioMayMenor,
        "precioMayMayor": precioMayMayor,
        "rangoCajaHorizontal": rangoCajaHorizontal,
        "rangoCajaMayorista": rangoCajaMayorista,
      };
}
