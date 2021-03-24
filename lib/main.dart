import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:app_ventas/data/bloc/login_bloc.dart';
import 'package:app_ventas/data/shared_prefs/preferencias_usuario.dart';

import 'package:app_ventas/data/repository/usuario_provider.dart';
import 'package:app_ventas/data/repository/cliente_provider.dart';
import 'package:app_ventas/data/repository/producto_provider.dart';

import 'package:app_ventas/theme.dart';

import 'package:app_ventas/ui/pages/home_page.dart';
import 'package:app_ventas/ui/pages/login_page.dart';
import 'package:app_ventas/ui/pages/info_client_page.dart';
import 'package:app_ventas/ui/pages/register_client_page.dart';
import 'package:app_ventas/ui/pages/orden_page.dart';
import 'package:app_ventas/ui/pages/stock_productos_page.dart';

import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (_) => new ClienteProvider()),
        ChangeNotifierProvider(create: (_) => new ProductoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Amsys',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('es', 'ES'),
        ],
        initialRoute: prefs.login,
        theme:
            prefs.themeDark ? darkThemeData(context) : lightThemeData(context),
        darkTheme: darkThemeData(context),
        routes: {
          'login': (BuildContext contex) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'info': (BuildContext context) => InfoClientPage(),
          'client': (BuildContext context) => RegisterClientPage(),
          'orden': (BuildContext context) => OrdenPage(),
          'productos': (BuildContext context) => StockProductosPage(),
        },
      ),
    );
  }
}
