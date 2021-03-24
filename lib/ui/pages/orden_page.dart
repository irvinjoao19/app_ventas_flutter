import 'package:flutter/material.dart';

import 'package:app_ventas/constants.dart';

class OrdenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genera una Orden"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => goProductos(context),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding * 0.5),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Buscar Cliente',
                    suffixIcon: Icon(Icons.search),
                  ),
                  enableInteractiveSelection: false,
                  textCapitalization: TextCapitalization.sentences,
                  /* controller: _inputTipoController,
          onSaved: (value) => cliente.tipo = value, */
                  onTap: () {
                    /*     FocusScope.of(context).requestFocus(new FocusNode());
            showDemoDialog(
              context: context,
              child: _buildAlertDialogWithChildren(Theme.of(context), context),
            ); */
                  },
                  /*     validator: (value) {
                    if (value.isEmpty) {
                      return "Seleccione Tipo";
                    } else {
                      return null;
                    }
                  }, */
                ),
              ),
              IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
            ],
          ),
          /*  ListView.builder(itemBuilder: 

          ), */
        ],
      ),
    );
  }

  void goProductos(context) {
    Navigator.pushNamed(context, 'productos');
  }
}
