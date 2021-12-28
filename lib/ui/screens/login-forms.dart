import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renthouse/bloc/login-bloc-provide.dart';
import 'package:renthouse/ui/widgets/default_button.dart';
/* import 'package:renthouse/bloc/login-bloc-provide.dart';
import 'package:renthouse/ui/widgets/default_button.dart';
import 'package:renthouse/ui/widgets/default_text_field.dart';
import 'package:renthouse/ui/widgets/widgets.dart'; */

import '../pallete.dart';
import 'screens.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  LoginBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = LoginBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                child: Column(children: <Widget>[
                  Flexible(
                    child: Center(
                      child: Text(
                        'RentHouse Quito',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                      ),
                    ),
                  ),
                  Container(
                      // A fixed-height child.
                      height: 400.0,
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            emailField(),
                            Container(
                              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            ),
                            passwordField(),
                            Container(
                                margin:
                                    EdgeInsets.only(top: 20.0, bottom: 20.0)),
                            submitButton()
                          ])),
                  SizedBox(height: 10),
                  registerNavigationButton()
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _showPassword = false;

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        initialData: null,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            onChanged: _bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              labelText: "Contraseña",
              filled: true,
              fillColor: Colors.grey,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: kOrange),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
            ),
          );
        });
  }

  Widget emailField() {
    //TextStyle(color: Colors.purple, backgroundColor: Colors.lightBlue);
    return StreamBuilder(
        stream: _bloc.email,
        initialData: null,
        builder: (context, snapshot) {
          return TextField(
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            onChanged: _bloc.changeEmail,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              labelText: "Correo Electrónico",
              filled: true,
              fillColor: Colors.grey,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: kOrange),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              prefixIcon: const Icon(Icons.email, color: Colors.white),
            ),
          );

          /* Container(
            //"Correo electrónico",
            child: TextFormField(decoration: InputDecoration(
              hintText: "Correo electrónico",_bloc.changeEmail
              ),)
            _bloc.changeEmail,
            false,
            TextInputType.emailAddress,
            Icon(Icons.email),
          ); */
        });
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: _bloc.signInStatus,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button();
          } else {
            print(snapshot.data);
            if (!snapshot.data) {
              return button();
            }
            return CircularProgressIndicator();
          }
        });
  }

  Widget button() {
    return DefaultButton("Entrar", () {
      String result = _bloc.validateFields();
      if (result == "") {
        authenticateUser();
      } else {
        showErrorMessage(result);
      }
    });
  }

  void authenticateUser() {
    _bloc.showProgressBar(true);
    _bloc.submit().then((value) {
      print("value -------> $value");
      _bloc.showProgressBar(false);
      if (value == 1) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    });
  }

  Widget registerNavigationButton() {
    return MaterialButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => CrearCuenta()));
        },
        child: Text("Crear Cuenta", style: kBodyText));
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
