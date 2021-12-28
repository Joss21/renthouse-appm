import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renthouse/bloc/logout_bloc_provider.dart';
import 'package:renthouse/bloc/reset_password_bloc_provider.dart';
import 'package:renthouse/bloc/settings_bloc.dart';
import 'package:renthouse/bloc/settings_bloc_provider.dart';
import 'package:renthouse/ui/screens/screens.dart';
/* import 'package:renthouse/bloc/logout_bloc_provider.dart';
import 'package:renthouse/bloc/reset_password_bloc_provider.dart';
import 'package:renthouse/bloc/settings_bloc.dart';
import 'package:renthouse/bloc/settings_bloc_provider.dart';
import 'package:renthouse/ui/pallete.dart';
import 'package:renthouse/ui/screens/reset_password.dart'; */

import 'about_us.dart';
import 'help.dart';
import 'logout_dialog.dart';

class SettingsScreen extends StatefulWidget {
  @override
  SettingScreenState createState() {
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingsScreen> {
  SettingsBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = SettingsBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
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
                child: Column(
                  children: <Widget>[
                    Container(
                      // A fixed-height child
                      //height: 250.0,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          /* Container(
                            margin: EdgeInsets.all(20),
                          ), */
                          //Container(child: userImage(), height: 100,),
                          Container(
                            margin: EdgeInsets.all(20),
                          ),
                          Text('Perfil',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          Container(
                            child: userNameText(),
                            height: 50,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Column(
                          //
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                            ),
                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Cambiar la contraseña',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ResetPasswordBlocProvider(
                                                  child:
                                                      ResetPasswordScreen()))),
                                ),
                                height: 80),
                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Ayuda',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => Help())),
                                ),
                                height: 80),
                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Acerca de',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => AboutUs())),
                                ),
                                height: 80),
                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Salir',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return LogoutBlocProvider(
                                            child: LogoutPopUp(),
                                          );
                                        });
                                  },
                                ),
                                height: 80),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget userNameText() {
    return StreamBuilder(
        stream: _bloc.getUserName(),
        initialData: null,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data,
                style: TextStyle(color: Colors.black, fontSize: 21));
          } else {
            return CircularProgressIndicator();
          }
        });
  }

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
              return Image.asset("assets/img/user.png",
                  fit: BoxFit.cover, height: 100, width: 100);
            }
          } else {
            return Image.asset("assets/img/user.png",
                fit: BoxFit.cover, height: 100, width: 100);
          }
        });
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
