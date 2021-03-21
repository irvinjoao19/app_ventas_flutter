import 'package:app_ventas/helper/utils.dart';
import 'package:flutter/material.dart';

import 'package:app_ventas/data/repository/cliente_provider.dart';
import 'package:app_ventas/constants.dart';

import 'package:app_ventas/data/models/sync_model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';

class RegisterClientPage extends StatefulWidget {
  @override
  _RegisterClientPageState createState() => _RegisterClientPageState();
}

class _RegisterClientPageState extends State<RegisterClientPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  TextEditingController _inputTipoController = new TextEditingController();
  TextEditingController _inputFechaController = new TextEditingController();
  Cliente cliente = new Cliente();

  @override
  Widget build(BuildContext context) {
    final Cliente cliData = ModalRoute.of(context).settings.arguments;
    final clienteProvider = Provider.of<ClienteProvider>(context);
    if (cliData != null) {
      cliente = cliData;
      _inputTipoController.text = cliente.tipo;
      _inputFechaController.text = cliente.fechaVisita;
    }

    return Scaffold(
      appBar: AppBar(
        key: _scaffoldKey,
        title: Text("Cliente"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => formRegister(clienteProvider),
          )
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _primeraFila(context),
              SizedBox(height: 20),
              _secundaFila(),
              SizedBox(height: 20),
              _terceraFila(),
              SizedBox(height: 20),
              _cuartaFila(),
              SizedBox(height: 20),
              _quintaFila(),
              SizedBox(height: 20),
              _sextaFila(),
              SizedBox(height: 20),
              _septimaFila(),
              SizedBox(height: 20),
              _octavaFila(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _primeraFila(context) {
    return Row(children: [
      Flexible(
        flex: 2,
        child: TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              labelText: 'Tipo',
              suffixIcon: Icon(Icons.arrow_drop_down),
              icon: Icon(Icons.account_circle)),
          enableInteractiveSelection: false,
          textCapitalization: TextCapitalization.sentences,
          controller: _inputTipoController,
          onSaved: (value) => cliente.tipo = value,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            showDemoDialog(
              context: context,
              child: _buildAlertDialogWithChildren(Theme.of(context), context),
            );
          },
          validator: (value) {
            if (value.isEmpty) {
              return "Seleccione Tipo";
            } else {
              return null;
            }
          },
        ),
      ),
      Flexible(
        child: Padding(
          padding: EdgeInsets.only(left: 5),
          child: TextFormField(
            initialValue: cliente.documento,
            onSaved: (value) => cliente.documento = value,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              labelText: 'Documento',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return "Ingrese";
              } else {
                return null;
              }
            },
          ),
        ),
      ),
    ]);
  }

  Widget _secundaFila() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      initialValue: cliente.nombreCliente,
      onSaved: (value) => cliente.nombreCliente = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Nombre Completo',
          icon: Icon(null)),
      validator: (value) {
        if (value.isEmpty) {
          return "Ingrese Nombre Completo";
        } else {
          return null;
        }
      },
    );
  }

  Widget _terceraFila() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      initialValue: cliente.tipo,
      onSaved: (value) => cliente.tipo = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Condición de Pago',
          suffixIcon: Icon(Icons.arrow_drop_down),
          icon: Icon(Icons.credit_card)),
    );
  }

  Widget _cuartaFila() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      initialValue: cliente.nombreDistrito,
      onSaved: (value) => cliente.nombreDistrito = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Distrito',
          suffixIcon: Icon(Icons.arrow_drop_down),
          icon: Icon(null)),
    );
  }

  Widget _quintaFila() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      initialValue: cliente.direccion,
      onSaved: (value) => cliente.direccion = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Dirección',
          icon: Icon(Icons.location_on)),
      validator: (value) {
        if (value.isEmpty) {
          return "Ingrese Dirección";
        } else {
          return null;
        }
      },
    );
  }

  Widget _sextaFila() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: false),
      initialValue: cliente.nroCelular,
      onSaved: (value) => cliente.nroCelular = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Telefono',
          icon: Icon(Icons.call)),
      validator: (value) {
        if (value.isEmpty) {
          return "Ingrese Telefono";
        } else {
          return null;
        }
      },
    );
  }

  Widget _septimaFila() {
    return TextFormField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      initialValue: cliente.email,
      onSaved: (value) => cliente.email = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),

      validator: (value) {
        if (value.isEmpty) {
          return "Ingrese Email";
        } else if (!validarEmail(value)) {
          return "Email no es el correcto";
        } else {
          return null;
        }
      },
    );
  }

  Widget _octavaFila(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFechaController,
      onSaved: (value) => cliente.fechaVisita = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Dia de visita',
          icon: Icon(Icons.date_range)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Seleccione Fecha  de Visita";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildAlertDialogWithChildren(ThemeData theme, BuildContext context) {
    return MaterialDialog(
      borderRadius: 8.0,
      enableCloseButton: false,
      title: Text("Tipo"),
      children: <Widget>[
        ListTile(
          title: const Text('Natural'),
          onTap: () {
            setState(() {
              cliente.tipo = "Natural";
              _inputTipoController.text = "Natural";
            });
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Juridico'),
          onTap: () {
            setState(() {
              cliente.tipo = "Juridico";
              _inputTipoController.text = "Juridico";
            });
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    if (picked != null) {
      setState(() {
        cliente.fechaVisita = dateFormat.format(picked);
        _inputFechaController.text = cliente.fechaVisita;
      });
    }
  }

  void formRegister(ClienteProvider clienteDao) async {
    //  if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    Map info = await clienteDao.crearCliente(cliente);

    if (info['ok']) {
      Navigator.pop(context);
    } else {
      mostrarAlerta(context, info['mensaje']);
    }
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('You selected: $value'),
        ));
      }
    });
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    _scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
