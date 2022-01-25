import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pallete.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: kOrange,
            title: Text("Acerca de",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))),
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: Column(
                //
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('descripcion',
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ), */
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Información",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  new Center(
                    child: Image(
                        image: new AssetImage("assets/img/icoHome.png"),
                        height: 85),
                  ),
                  /* Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Text("RenthHouse Quito",
                        style: TextStyle(color: Colors.black, fontSize: 21)),
                  ), */
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Text(
                      "RentHouse Quito es una aplicación móvil sencilla para publicar y buscar los inmuebles en la ciudad de Quito, esto es un gran ahorro de tiempo cuando necesita moverse rápidamente en alquilar de una propiedad, dotando a esta aplicación con una gran variedad de viviendas en alquiler donde los usuarios tengan la capacidad de escoger la que sea de su mayor conveniencia.",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Text("Versión : 1.0.0",
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                  ),
                  Container(margin: EdgeInsets.only(top: 20.0, bottom: 20.0))
                ])));
  }
}
