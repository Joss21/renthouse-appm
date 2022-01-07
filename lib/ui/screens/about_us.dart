import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pallete.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Text("Nombre: RenthHouse Quito",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Text(
                      "RentHouse Quito es una aplicación móvil sencilla para publicar y buscar los inmuebles en la ciudad de Quito, esto es un gran ahorro de tiempo cuando necesita moverse rápidamente en alquilar de una propiedad, a través de esta aplicación pueden incrementar sus valores para sus clientes brindándoles información valiosa que ayude a guiar.",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Text("Versión : 1.0.0",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  )
                ])));
  }
}
