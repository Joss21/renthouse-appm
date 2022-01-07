import 'package:RentHouse/models/post-details.dart';
import 'package:RentHouse/ui/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pallete.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomePage _bloc;
  static List<House> houseList = List();
  House house;
  List<House> filteredHouses = List();
  final debouncer = Debouncer(milliseconds: 500);
  DatabaseReference db;
  FirebaseDatabase database;
  final firestoreInstance = Firestore.instance;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //_bloc = HomePageProvider.of(context);
  }

  @override
  void dispose() {
    //_bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    // var screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.orange),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5.0),
                  hintText: '',
                  labelText: 'Buscar',
                  prefixIcon: Icon(
                    Icons.search,
                    color: kOrange,
                  ),
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.notoSans(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextStyle(fontSize: 24),
                onChanged: (area) {
                  debouncer.run(() {
                    setState(() {
                      filteredHouses = houseList
                          .where((u) => (u.address
                              .toLowerCase()
                              .contains(area.toLowerCase())))
                          .toList();
                    });
                  });
                },
              ),
              Divider(
                color: Colors.yellow,
                thickness: .2,
              ),
              Container(
                height: 50,
                child: ListView(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: new FlatButton(
                              child: new Text(
                                'Precio 150-250',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  backgroundColor: Color(0xFF9065),
                                ),
                              ),
                              onPressed: () {
                                debouncer.run(() {
                                  setState(() {
                                    filteredHouses = houseList
                                        .where((u) => u.price <= 400)
                                        .toList();
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: new FlatButton(
                              child: new Text(
                                'Dormitorios 3-4',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                debouncer.run(() {
                                  setState(() {
                                    filteredHouses = houseList
                                        .where((u) =>
                                            u.bedrooms >= 3 && u.bedrooms <= 4)
                                        .toList();
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: new FlatButton(
                              child: new Text(
                                'Garaje',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                debouncer.run(() {
                                  setState(() {
                                    filteredHouses = houseList
                                        .where((u) => u.garages > 0)
                                        .toList();
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  filteredHouses.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ImageWidget(
                        filteredHouses[index],
                        index,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
