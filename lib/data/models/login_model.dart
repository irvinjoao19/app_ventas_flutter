// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.response,
        this.data,
    });

    Response response;
    Usuario data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        response: Response.fromJson(json["response"]),
        data: Usuario.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "data": data.toJson(),
    };
}

class Usuario {
    Usuario({
        this.usuarioId,
        this.usuario,
        this.token,
    });

    int usuarioId;
    String usuario;
    String token;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        usuarioId: json["usuarioId"],
        usuario: json["usuario"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "usuario": usuario,
        "token": token,
    };
}

class Response {
    Response({
        this.codigo,
        this.descripcion,
        this.comentario,
    });

    String codigo;
    String descripcion;
    String comentario;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        comentario: json["comentario"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "descripcion": descripcion,
        "comentario": comentario,
    };
}
