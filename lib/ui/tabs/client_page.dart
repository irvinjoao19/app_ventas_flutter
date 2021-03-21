import 'package:app_ventas/data/models/sync_model.dart';
import 'package:flutter/material.dart';

import 'package:app_ventas/data/repository/cliente_provider.dart';
import 'package:app_ventas/ui/adapters/cardview_cliente.dart';

import 'package:provider/provider.dart';

class ClientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clienteProvider = Provider.of<ClienteProvider>(context);
    clienteProvider.getClientes();
    return Container(
      child: StreamBuilder(
        stream: clienteProvider.clientStream,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List<Cliente> clientes = snapshot.data;
            return CardViewCliente(
              cliente: clientes,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
