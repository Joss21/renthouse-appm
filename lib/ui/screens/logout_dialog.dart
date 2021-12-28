import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renthouse/bloc/logout_bloc.dart';
import 'package:renthouse/bloc/logout_bloc_provider.dart';
/* import 'package:renthouse/bloc/logout_bloc.dart';
import 'package:renthouse/bloc/logout_bloc_provider.dart';
import 'package:renthouse/ui/pallete.dart'; */

import '../pallete.dart';
import 'login.dart';

class LogoutPopUp extends StatefulWidget {
  LogoutPopUp();

  @override
  _LogoutPopUpState createState() {
    return _LogoutPopUpState();
  }
}

class _LogoutPopUpState extends State<LogoutPopUp> {
  LogoutBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = LogoutBlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 170,
          child: Column(
            children: <Widget>[
              Container(
                  height: 50,
                  color: kOrange,
                  child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Salir',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ],
                      ))),
              Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('¿Estás seguro de que quieres cerrar sesión? ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                        ],
                      ))),
              Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () => {
                                    _bloc.logoutUser().then((value) => {
                                          Navigator.pop(context),
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (_) => Login()))
                                        })
                                  },
                              child: Text("Si",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              style:
                                  ElevatedButton.styleFrom(primary: kOrange)),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              style: ElevatedButton.styleFrom(
                                  primary: kOrange // This is what you need!
                                  )),
                        ],
                      )))
            ],
          ),
        ));
  }
}
