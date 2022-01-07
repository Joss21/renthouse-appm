import 'dart:ui';

import 'package:RentHouse/bloc/register-bloc.dart';
import 'package:RentHouse/bloc/register_bloc_provider.dart';
import 'package:RentHouse/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/* import 'package:renthouse/bloc/register-bloc.dart';
import 'package:renthouse/bloc/register_bloc_provider.dart';
import 'package:renthouse/ui/widgets/default_button.dart';
import 'package:renthouse/ui/widgets/default_text_field.dart'; */

import '../pallete.dart';
import '../pallete.dart';

class CrearCuentaForm extends StatefulWidget {
  @override
  CrearCuentaFormState createState() {
    return CrearCuentaFormState();
  }
}

class CrearCuentaFormState extends State<CrearCuentaForm> {
  RegisterBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = RegisterBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(children: [
                        Container(
                            margin: EdgeInsets.only(top: 70.0, bottom: 5.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Crear Cuenta",
                                  //style: kBodyText,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 5.0)),
                        firstNameField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        lastNameField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        emailField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        phoneNumberField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        passwordField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        reEnterPasswordField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 35.0)),
                        submitButton(),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
/* 
  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Contraseña", _bloc.changePassword, true,
              TextInputType.text, Icon(Icons.lock));
        });
  } */

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: _bloc.changePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.orange),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                //prefixIcon: const Icon(Icons.email),
              ));
        });
  }

  Widget reEnterPasswordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: _bloc.changeRePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmar la Contraseña",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.orange),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                //prefixIcon: const Icon(Icons.email),
              ));
        });
  }

  Widget emailField() {
    return StreamBuilder(
        stream: _bloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: _bloc.changeEmail,
              decoration: InputDecoration(
                labelText: "Correo Electronico",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.orange),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                //prefixIcon: const Icon(Icons.email),
              ));
        });
  }

  Widget firstNameField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: _bloc.changeFirstName,
              decoration: InputDecoration(
                labelText: "Nombre",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.orange),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                //prefixIcon: const Icon(Icons.email),
              ));
        });
  }

  Widget lastNameField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: _bloc.changeLastName,
              decoration: InputDecoration(
                labelText: "Apellido",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.orange),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                //prefixIcon: const Icon(Icons.email),
              ));
        });
  }

  Widget phoneNumberField() {
    return StreamBuilder(
        stream: _bloc.phoneNumber,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
              keyboardType: TextInputType.number,
              onChanged: _bloc.changePhone,
              decoration: InputDecoration(
                labelText: "Numero de celular",
                prefixText: "+593 ",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.green[800]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.orange),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                //prefixIcon: const Icon(Icons.email),
              ));
        });
  }

  /*  Widget reEnterPasswordField() {
    return StreamBuilder(
        stream: _bloc.rePassword,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField(
              "Confirmar la contraseña",
              _bloc.changeRePassword,
              true,
              TextInputType.text,
              Icon(Icons.lock));
        });
  }

  Widget emailField() {
    return StreamBuilder(
        stream: _bloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Correo electrónico", _bloc.changeEmail,
              false, TextInputType.emailAddress, Icon(Icons.email));
        });
  }

  Widget firstNameField() {
    return StreamBuilder(
        stream: _bloc.firstName,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Nombre", _bloc.changeFirstName, false,
              TextInputType.name, Icon(Icons.person));
        });
  }

  Widget lastNameField() {
    return StreamBuilder(
        stream: _bloc.lastName,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Apellido", _bloc.changeLastName, false,
              TextInputType.name, Icon(Icons.person));
        });
  }

  Widget phoneNumberField() {
    return StreamBuilder(
        stream: _bloc.phoneNumber,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Número de celular", _bloc.changePhone, false,
              TextInputType.phone, Icon(Icons.phone));
        });
  }
*/
  Widget submitButton() {
    return StreamBuilder(
        stream: _bloc.processStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button();
          } else {
            print(snapshot.data);
            if (!snapshot.data) {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            }
            return CircularProgressIndicator();
          }
        });
  }

  Widget button() {
    return DefaultButton("Registrar", () {
      String result = _bloc.validateFields();
      if (result == "") {
        _bloc.showProgressBar(true);
        _bloc.registerUser().then((value) => {_bloc.showProgressBar(false)});
      } else {
        showErrorMessage(result);
      }
    });
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
