import 'package:RentHouse/bloc/login_bloc.dart';
import 'package:RentHouse/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
