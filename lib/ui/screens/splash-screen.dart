import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renthouse/repository/repository.dart';

import 'home.dart';
import 'login.dart';
/* import 'package:renthouse/repository/repository.dart';
import 'package:renthouse/ui/screens/screens.dart'; */

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: new Image.asset("assets/img/home.jpg",
          fit: BoxFit.cover,
          height: 700,
          //width: 10.0,
          //alignment: Alignment.bottomRight,
          alignment: Alignment.center),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      _repository.isLoggedIn().then((value) => {
            if (value != null && value)
              {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomeScreen()))
              }
            else
              {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) => Login()))
              }
          });
    });
  }
}
