import 'package:flutter/material.dart';

import 'package:app_amsys/src/bloc/login_bloc.dart';
import 'package:app_amsys/src/providers/usuario_provider.dart';
import 'package:app_amsys/src/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(context) {
    final bloc = Provider.of<LoginBloc>(context);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: 180.0)),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                Text('DATA ACQUISITION\n INTERFACE',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0)),
                _crearEmail(bloc),
                SizedBox(
                  height: 20.0,
                ),
                _crearPassword(bloc),
                SizedBox(
                  height: 20.0,
                ),
                _crearBoton(bloc, usuarioProvider),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle, color: Colors.blue),
                  //hintText: 'ejemplo@correo.com',
                  labelText: 'Ingrese usuario',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blue),
                labelText: 'Contraseña',
                //  counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc, UsuarioProvider usuarioProvider) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (context, snapshot) {
          return RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text('Ingresar'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 0.0,
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: snapshot.hasData
                  ? () => _login(bloc, usuarioProvider, context)
                  : null);
        });
  }

  _login(LoginBloc bloc, UsuarioProvider usuarioProvider,
      BuildContext context) async {
    Map info = await usuarioProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, info['mensaje']);
    }
  }

  Widget _crearFondo(context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(242, 242, 242, 2.0),
        Color.fromRGBO(242, 242, 242, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: [
        fondoMorado,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              SizedBox(height: 10.0, width: double.infinity)
            ],
          ),
        )
      ],
    );
  }
}
