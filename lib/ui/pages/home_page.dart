import 'package:app_ventas/helper/utils.dart';
import 'package:app_ventas/ui/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:app_ventas/data/repository/usuario_provider.dart';
import 'package:provider/provider.dart';

import 'package:app_ventas/ui/tabs/client_page.dart';
import 'package:app_ventas/ui/tabs/pedido_page.dart';
import 'package:app_ventas/ui/tabs/product_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pagina = 0;
  List<Widget> lista = [];

  @override
  void initState() {
    super.initState();
    lista.add(IconButton(
      icon: Icon(Icons.add),
      onPressed: () => goClienteNew(),
    ));
    lista.add(IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ));
  }

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _titulo(_pagina),
        actions: _acciones(context, usuarioProvider, _pagina),
      ),
      body: _paginas(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Text _titulo(int pagina) {
    final title = (pagina == 0)
        ? 'Clientes'
        : (pagina == 1)
            ? 'Productos'
            : (pagina == 2)
                ? 'Pedidos'
                : 'Info';

    return Text(title);
  }

  List<Widget> _acciones(
      BuildContext context, UsuarioProvider usuarioProvider, int pagina) {
    lista = [];

    switch (pagina) {
      case 3:
        lista.add(IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => confirmLogout(context, usuarioProvider),
        ));
        break;
      case 0:
        lista.add(IconButton(
          icon: Icon(Icons.add),
          onPressed: () => goClienteNew(),
        ));
        lista.add(IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ));
        break;
      default:
        lista.add(IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ));
        break;
    }
    setState(() {});

    return lista;
  }

  PageView _paginas() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: [
        ClientPage(),
        ProductPage(),
        PedidoPage(),
        InfoPage(),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _pagina,
      onTap: (i) => bottomTapped(i),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Clientes"),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Productos"),
        BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining), label: "Pedidos"),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
      ],
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      _pagina = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _pagina = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void goClienteNew() {
    Navigator.pushNamed(context, 'client');
  }
}
