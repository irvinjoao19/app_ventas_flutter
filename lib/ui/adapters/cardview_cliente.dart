import 'package:flutter/material.dart';

import 'package:app_ventas/constants.dart';
import 'package:app_ventas/data/models/sync_model.dart';

class CardViewCliente extends StatelessWidget {
  final List<Cliente> cliente;

  CardViewCliente({
    @required this.cliente,
  });

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.75,
      child: ListView.builder(
        itemCount: cliente.length,
        itemBuilder: (context, i) => _tarjetas(context, cliente[i]),
      ),
    );
  }

  Widget _tarjetas(BuildContext context, Cliente cli) {
    final tarjeta = InkWell(
      onTap: () => Navigator.pushNamed(context, 'info', arguments: cli),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.50,
            vertical: kDefaultPadding * 0.95),
        child: Row(
          children: [
            Icon(Icons.account_circle),

            /*  Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(cli.),
                ),
                
              ],
            ), */
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            cli.nombreCliente,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Opacity(
                          opacity: 0.64,
                          child: Text(cli.documento),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        cli.direccion,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        cli.nombreDistrito,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        "Ultima visita :${cli.fechaVisita}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1,
                      // indent: 10,
                      // endIndent: 10,
                    ),
                  ],
                ),
              ),
            ),
            Divider()
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
