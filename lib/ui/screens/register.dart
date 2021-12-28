import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:renthouse/ui/widgets/widgets.dart';

import 'screens.dart';

class CrearCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      /* BackgroundImage(
        image: 'assets/img/sign.jpg',
      ), */

      Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment(0.0, 0.0),
              child: CrearCuentaForm()))
    ]);
  }
}
