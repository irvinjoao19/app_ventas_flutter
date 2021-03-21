import 'package:app_ventas/data/repository/usuario_provider.dart';
import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(mensaje),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

void confirmLogout(BuildContext context, UsuarioProvider usuarioProvider) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Mensaje'),
        content: Text('Deseas salir del app ?'),
        actions: [
          FlatButton(
            child: Text('NO'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text('SI'),
            onPressed: () => _logout(context, usuarioProvider),
          )
        ],
      );
    },
  );
}

_logout(BuildContext context, UsuarioProvider usuarioProvider) async {
  await usuarioProvider.logout();
  Navigator.pushReplacementNamed(context, 'login');
}

bool validarEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}
