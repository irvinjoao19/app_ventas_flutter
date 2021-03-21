import 'package:flutter/material.dart';

import 'package:app_ventas/data/models/producto_model.dart';

import 'package:app_ventas/data/repository/producto_provider.dart';
import 'package:app_ventas/ui/adapters/cardview_producto.dart';

import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    productoProvider.getProductos();
    return Container(
      child: StreamBuilder(
        stream: productoProvider.productoStream,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List<Producto> productos = snapshot.data;
            return CardViewProducto(
              producto: productos,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
