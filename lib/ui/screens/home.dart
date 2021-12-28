import 'package:flutter/material.dart';
import 'package:renthouse/bloc/settings_bloc_provider.dart';

import '../pallete.dart';
import 'add-posts.dart';
import 'home_page.dart';
import 'settings_screen.dart';
//import 'package:renthouse/bloc/settings_bloc_provider.dart';
//import 'package:renthouse/ui/pallete.dart';
//import 'package:renthouse/ui/screens/home_page.dart';
//import 'package:renthouse/ui/screens/screens.dart';
//import 'package:renthouse/ui/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Home()));
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomePage(),
      AddPost(),
      SettingsBlocProvider(child: SettingsScreen())
    ];

    final List<String> _titles = [
      "RentHouse Quito",
      "Describir inmueble",
      "Ajustes"
    ];

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kOrange,
          title: Text(_titles[_currentIndex],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white))),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              backgroundColor: kOrange,
              label: 'Inicio'),
          BottomNavigationBarItem(
            backgroundColor: kOrange,
            icon: new Icon(Icons.add),
            label: 'Publicar',
          ),
          BottomNavigationBarItem(
              backgroundColor: kOrange,
              icon: Icon(Icons.settings),
              label: 'Ajustes')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
