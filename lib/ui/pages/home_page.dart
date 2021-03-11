import 'package:app_amsys/src/providers/usuario_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:app_amsys/src/pages/tab1_page.dart';
import 'package:app_amsys/src/pages/tab2_page.dart';
import 'package:app_amsys/src/pages/tab3_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        appBar: AppBar(
          title: _Titulo(),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _confirmLogout(context, usuarioProvider),
            ),
          ],
        ),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }

  void _confirmLogout(BuildContext context, UsuarioProvider usuarioProvider) {
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
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return Text(navegacionModel._titulo);
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Principal"),
        BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: "Avisos"),
        BottomNavigationBarItem(
            icon: Icon(Icons.grading), label: "Inspecciones"),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page(),
        Tab3Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  String _titulo = 'Principal';

  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;
  String get titulo => this._titulo;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    this._titulo = (valor == 0)
        ? 'Principal'
        : (valor == 1)
            ? 'Avisos'
            : 'Inspecciones';
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
