import 'package:flutter/material.dart';
import 'package:renthouse/bloc/login_bloc.dart';
import 'package:renthouse/ui/widgets/widgets.dart';
/* import 'package:renthouse/bloc/login_bloc.dart';
import 'package:renthouse/ui/widgets/widgets.dart'; */
import 'login-forms.dart';

class Login extends StatelessWidget {
  LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      BackgroundImage(
        image: 'assets/img/quito.jpg',
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(padding: EdgeInsets.all(16.0), child: LoginForm())),
    ]);
  }
}
