import 'package:flutter/material.dart';

import '../pallete.dart';
//import 'package:renthouse/ui/pallete.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: kOrange,
            title: Text("App Soporte",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))),
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                    "¿Tienes alguna duda respecto a la aplicación de RentHouse Quito?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.alternate_email_rounded, color: kOrange),
                      Container(
                        margin: EdgeInsets.all(10),
                      ),
                      Text('soporte-renthouse@gmail.com',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.local_phone_outlined, color: kOrange),
                      Container(
                        margin: EdgeInsets.all(10),
                      ),
                      Text('+593 920 112 016',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ))
            ])));
  }
}
