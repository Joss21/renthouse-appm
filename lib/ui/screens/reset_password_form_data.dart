import 'package:flutter/material.dart';
import 'package:renthouse/bloc/reset_password_bloc.dart';
import 'package:renthouse/bloc/reset_password_bloc_provider.dart';
import 'package:renthouse/ui/widgets/default_button.dart';
import 'package:renthouse/ui/widgets/default_text_field.dart';
/* import 'package:renthouse/bloc/reset_password_bloc.dart';
import 'package:renthouse/bloc/reset_password_bloc_provider.dart';
import 'package:renthouse/ui/widgets/default_button.dart';
import 'package:renthouse/ui/widgets/default_text_field.dart'; */

class ResetPasswordForm extends StatefulWidget {
  @override
  ResetPasswordFormState createState() {
    return ResetPasswordFormState();
  }
}

class ResetPasswordFormState extends State<ResetPasswordForm> {
  ResetPasswordBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = ResetPasswordBlocProvider.of(context);
  }

  @override
  void dispose() {
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
                    child: Column(children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: oldPasswordField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: passwordField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: reEnterPasswordField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: button(),
                      )
                    ]),
                  )));
        },
      ),
    );
  }
/* 
  Widget userImage() {
    return StreamBuilder(
        stream: _bloc.getUserImage(),
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.toString() != "N/A") {
              return Image.network(snapshot.data.toString(),
                  fit: BoxFit.cover, height: 100, width: 100);
            } else {
              return Image.asset("assets/img/Imagen5.png",
                  color: Colors.red,
                  fit: BoxFit.cover, height: 100, width: 100);
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  } */

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Contraseña nueva", _bloc.changePassword,
              true, TextInputType.text, Icon(Icons.lock));
        });
  }

  Widget oldPasswordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Contraseña actual", _bloc.changeOldPassword,
              true, TextInputType.text, Icon(Icons.lock));
        });
  }

  Widget reEnterPasswordField() {
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

  Widget button() {
    return DefaultButton("Guardar", () {
      String result = _bloc.validateFields();
      if (result.toString() == "") {
        _bloc
            .updatePassword()
            .then((value) => {print("al - $value"), showMessage(value)});
      } else {
        showMessage(result);
      }
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: Duration(seconds: 5)));
  }
}
