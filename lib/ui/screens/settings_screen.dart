import 'package:RentHouse/bloc/logout_bloc_provider.dart';
import 'package:RentHouse/bloc/reset_password_bloc_provider.dart';
import 'package:RentHouse/bloc/settings_bloc.dart';
import 'package:RentHouse/bloc/settings_bloc_provider.dart';
import 'package:RentHouse/ui/pallete.dart';
import 'package:RentHouse/ui/screens/editposts.dart';
import 'package:RentHouse/ui/screens/myposts.dart';
import 'package:RentHouse/ui/screens/screens.dart';
import 'package:flutter/material.dart';

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
                          Text('Mi Perfil',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
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
                          //child: Divider()
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                            ),
                            const Divider(
                              height: 10,
                              thickness: 1,
                              indent: 30,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                            SizedBox(
                                child: TextButton(
                                    child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.post_add_outlined,
                                                color: kOrange),
                                            Text(' Mis publicaciones',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18)),
                                          ],
                                        )),
                                    onPressed: () => Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (context) => MyPosts()))),
                                height: 80),
                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.password, color: kOrange),
                                          Text(' Cambiar la contraseña',
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
                                          Icon(Icons.contact_phone,
                                              color: kOrange),
                                          Text(' Contactar con soporte',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => Contact())),
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
                                          Icon(
                                            Icons.info,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(' Acerca de',
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
                                          Icon(
                                              Icons
                                                  .subdirectory_arrow_right_outlined,
                                              color: Colors.red),
                                          Text(' Salir',
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

  /* Widget userImage() {
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
  } */

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
