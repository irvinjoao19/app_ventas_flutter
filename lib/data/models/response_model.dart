// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  Response({
    this.codigo,
    this.codigoBase,
    this.codigoRetorno,
    this.codigoBaseCliente,
    this.codigoRetornoCliente,
    this.stock,
    this.mensaje,
  });

  int codigo;
  int codigoBase;
  int codigoRetorno;
  int codigoBaseCliente;
  int codigoRetornoCliente;
  double stock;
  String mensaje;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        codigo: json["codigo"],
        codigoBase: json["codigoBase"],
        codigoRetorno: json["codigoRetorno"],
        codigoBaseCliente: json["codigoBaseCliente"],
        codigoRetornoCliente: json["codigoRetornoCliente"],
        stock: json["stock"].toDouble(),
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "codigoBase": codigoBase,
        "codigoRetorno": codigoRetorno,
        "codigoBaseCliente": codigoBaseCliente,
        "codigoRetornoCliente": codigoRetornoCliente,
        "stock": stock,
        "mensaje": mensaje,
      };
}
