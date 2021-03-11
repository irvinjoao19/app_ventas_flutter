import 'package:app_ventas/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:app_amsys/src/bloc/login_bloc.dart';
import 'package:app_amsys/src/providers/reporte_provider.dart';
import 'package:app_amsys/src/providers/usuario_provider.dart';
import 'package:app_amsys/src/providers/aviso_provider.dart';

import 'package:app_amsys/src/pages/home_page.dart';
import 'package:app_amsys/src/pages/login_page.dart';
import 'package:app_amsys/src/shared_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (_) => LoginBloc()),
        ChangeNotifierProvider(create: (_) => new UsuarioProvider()),
        ChangeNotifierProvider(create: (_) => new ReporteProvider()),
        ChangeNotifierProvider(create: (_) => new AvisoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Amsys',
        initialRoute: prefs.login,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        routes: {
          'login': (BuildContext contex) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
