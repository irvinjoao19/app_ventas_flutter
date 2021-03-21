// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.usuarioId,
    this.documento,
    this.apellidos,
    this.nombres,
    this.tipo,
    this.cargoId,
    this.nombreCargo,
    this.telefono,
    this.email,
    this.login,
    this.pass,
    this.envioOnline,
    this.perfil,
    this.descripcionPerfil,
    this.estado,
    this.localId,
  });

  int usuarioId;
  String documento;
  String apellidos;
  String nombres;
  int tipo;
  int cargoId;
  String nombreCargo;
  String telefono;
  String email;
  String login;
  String pass;
  String envioOnline;
  int perfil;
  String descripcionPerfil;
  int estado;
  int localId;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        usuarioId: json["usuarioId"],
        documento: json["documento"],
        apellidos: json["apellidos"],
        nombres: json["nombres"],
        tipo: json["tipo"],
        cargoId: json["cargoId"],
        nombreCargo: json["nombreCargo"],
        telefono: json["telefono"],
        email: json["email"],
        login: json["login"],
        pass: json["pass"],
        envioOnline: json["envioOnline"],
        perfil: json["perfil"],
        descripcionPerfil: json["descripcionPerfil"],
        estado: json["estado"],
        localId: json["localId"],
      );

  Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "documento": documento,
        "apellidos": apellidos,
        "nombres": nombres,
        "tipo": tipo,
        "cargoId": cargoId,
        "nombreCargo": nombreCargo,
        "telefono": telefono,
        "email": email,
        "login": login,
        "pass": pass,
        "envioOnline": envioOnline,
        "perfil": perfil,
        "descripcionPerfil": descripcionPerfil,
        "estado": estado,
        "localId": localId,
      };
}
