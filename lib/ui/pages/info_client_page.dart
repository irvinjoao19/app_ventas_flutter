import 'package:flutter/material.dart';

import 'package:app_ventas/constants.dart';
import 'package:app_ventas/data/repository/cliente_provider.dart';

import 'package:app_ventas/data/models/sync_model.dart';
import 'package:provider/provider.dart';

class InfoClientPage extends StatefulWidget {
  @override
  _InfoClientPageState createState() => _InfoClientPageState();
}

class _InfoClientPageState extends State<InfoClientPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ClienteProvider clienteProvider = Provider.of<ClienteProvider>(context);
    Cliente cliData = ModalRoute.of(context).settings.arguments;
    clienteProvider.getCliente(cliData);

    return Scaffold(
      body: StreamBuilder(
        stream: clienteProvider.clientOneStream,
        builder: (BuildContext context, AsyncSnapshot<Cliente> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    _crearAppBar(snapshot.data),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(height: 30.0),
                          _body(snapshot.data),
                        ],
                      ),
                    ),
                  ],
                ),
                new Positioned(
                  top: 256.0,
                  right: 16.0,
                  child: new FloatingActionButton(
                    onPressed: () => Navigator.pushNamed(context, 'client',
                        arguments: snapshot.data),
                    child: new Icon(Icons.edit),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  SliverAppBar _crearAppBar(Cliente cliente) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 256.0,
      floating: true,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          cliente.nombreCliente,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: Image(
          image: AssetImage("assets/material_flat.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining), label: "Pedidos"),
        BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Foto"),
        BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Galeria"),
      ],
    );
  }

  Widget _body(Cliente cliente) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_box),
              SizedBox(width: kDefaultPadding * 0.4),
              Expanded(
                child: Text(cliente.tipo),
              ),
              Text(cliente.documento),
            ],
          ),
          SizedBox(height: kDefaultPadding * 0.5),
          Row(children: [
            Icon(Icons.credit_card),
            SizedBox(width: kDefaultPadding * 0.4),
            Text(cliente.nombreGiroNegocio),
          ]),
          SizedBox(height: kDefaultPadding * 0.5),
          Row(children: [
            Icon(Icons.add_location),
            SizedBox(width: kDefaultPadding * 0.4),
            Expanded(child: Text(cliente.nombreDepartamento)),
            Text(
              cliente.nombreDistrito,
              overflow: TextOverflow.ellipsis,
            ),
          ]),
          Row(children: [
            Icon(null),
            SizedBox(width: kDefaultPadding * 0.4),
            Text(cliente.nombreProvincia),
          ]),
          Row(children: [
            Icon(null),
            SizedBox(width: kDefaultPadding * 0.4),
            Expanded(
              child: Text(
                cliente.direccion,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
          SizedBox(height: kDefaultPadding * 0.5),
          Row(children: [
            Icon(Icons.call),
            SizedBox(width: kDefaultPadding * 0.4),
            Text(cliente.nroCelular),
          ]),
          SizedBox(height: kDefaultPadding * 0.5),
          Row(children: [
            Icon(Icons.email),
            SizedBox(width: kDefaultPadding * 0.4),
            Text(cliente.email),
          ]),
          SizedBox(height: kDefaultPadding * 0.5),
          Row(children: [
            Icon(Icons.date_range),
            SizedBox(width: kDefaultPadding * 0.4),
            Text(cliente.fechaVisita),
          ]),
        ],
      ),
    );
  }
}
