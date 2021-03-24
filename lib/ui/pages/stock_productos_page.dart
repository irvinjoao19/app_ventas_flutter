import 'package:app_ventas/constants.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:app_ventas/data/models/producto_model.dart';
import 'package:app_ventas/data/repository/producto_provider.dart';

class StockProductosPage extends StatefulWidget {
  @override
  _StockProductosPageState createState() => _StockProductosPageState();
}

class _StockProductosPageState extends State<StockProductosPage> {
  List<int> selectedList = [];

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    productoProvider.getProductos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock de Productos"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _generatePedido(),
          )
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(productoProvider) {
    return Container(
      child: StreamBuilder(
        stream: productoProvider.productoStream,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List<Producto> productos = snapshot.data;
            return _cardviewStockProducto(productos);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _cardviewStockProducto(List<Producto> productos) {
    return Container(
      child: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, i) => _tarjetas(context, productos[i]),
      ),
    );
  }

  Widget _tarjetas(BuildContext context, Producto p) {
    final tarjeta = InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.50,
            vertical: kDefaultPadding * 0.95),
        child: Row(
          children: [
            Checkbox(
              value: selectedList.contains(p.productoId),
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  if (value) {
                    selectedList.add(p.productoId);
                  } else {
                    selectedList.remove(p.productoId);
                  }
                });
              },
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.nombreProducto,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Opacity(
                            opacity: 0.64,
                            child: Text(
                              p.codigoProducto,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Icon(Icons.attach_money),
                        Opacity(
                          opacity: 0.64,
                          child: Text(
                            p.precio.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.delivery_dining),
                        SizedBox(width: 10),
                        Opacity(
                          opacity: 0.64,
                          child: Text(
                            p.stock.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1,
                      //   indent: 10,
                      //   endIndent: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return GestureDetector(
        child: tarjeta,
        onTap: () {
          setState(() {
            if (selectedList.contains(p.productoId)) {
              selectedList.remove(p.productoId);
            } else {
              selectedList.add(p.productoId);
            }
          });
        });
  }

  _generatePedido() {}
}
