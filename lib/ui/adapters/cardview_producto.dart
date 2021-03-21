import 'package:flutter/material.dart';

import 'package:app_ventas/constants.dart';
import 'package:app_ventas/data/models/producto_model.dart';

class CardViewProducto extends StatelessWidget {
  final List<Producto> producto;

  CardViewProducto({
    @required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.75,
      child: ListView.builder(
        itemCount: producto.length,
        itemBuilder: (context, i) => _tarjetas(context, producto[i]),
      ),
    );
  }

  Widget _tarjetas(BuildContext context, Producto p) {
    final tarjeta = InkWell(
      //onTap: () => Navigator.pushNamed(context, 'info', arguments: cli),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.50,
            vertical: kDefaultPadding * 0.95),
        child: Row(
          children: [
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
          // Navigator.pushNamed(context, 'detalle', arguments: a);
        });
  }
}
