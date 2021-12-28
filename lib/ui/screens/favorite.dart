import 'package:flutter/material.dart';

import '../pallete.dart';

class Favorito extends StatefulWidget {
  @override
  _FavoritoState createState() => new _FavoritoState();
}

class _FavoritoState extends State<Favorito> {

@override
Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
        
          appBar: AppBar(
           
            elevation: 0,
            leading: IconButton( 
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kwhite,
                ),
            ),
            title: Text(
              'Favoritos',
              style: kBodyText,
            ),
            centerTitle: true,
             backgroundColor: kOrange,
            ),
            body: Column(
              children:[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text('... ',
                      style: kBodyText,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    
                    
                  ],
                ),
              )
            ]),
            )
      ],
    );
  }
}