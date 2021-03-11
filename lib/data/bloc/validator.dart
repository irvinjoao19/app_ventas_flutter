import 'dart:async';

class Validator {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.length > 3) {
      sink.add(email);
    } else {
      sink.addError('Más de 3 caracteres por favor');
    }

/*     Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    } */
  });

  final validarPass =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.isNotEmpty) {
      sink.add(pass);
    } else {
      sink.addError('Más de 3 caracteres por favor');
    }
  });
}
