import 'package:flutter/material.dart';

import '../pallete.dart';
import 'reset_password_form_data.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: kOrange,
        title: Text("Cambiar contraseña",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white))),
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: ResetPasswordForm()));
  }
}
