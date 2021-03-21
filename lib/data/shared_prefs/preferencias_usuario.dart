import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get themeDark {
    return _prefs.getBool('themeDark') ?? false;
  }

  set themeDark(bool value) {
    _prefs.setBool('themeDark', value);
  }

  get login {
    return _prefs.getString('login') ?? 'login';
  }

  set login(String value) {
    _prefs.setString('login', value);
  }
}
