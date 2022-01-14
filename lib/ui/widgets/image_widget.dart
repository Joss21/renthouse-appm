import 'package:RentHouse/models/post-details.dart';
import 'package:RentHouse/ui/screens/home-details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
/* import 'package:renthouse/models/post-details.dart';
import 'package:renthouse/ui/screens/home-details.dart'; */

class ImageWidget extends StatelessWidget {
  final House house;
  final int imgpathindex;

  ImageWidget(
    this.house,
    this.imgpathindex,
  );

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("##,##,###", "en_INR");
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PropertyDetails(
                  this.house,
                  this.imgpathindex,
                ),
              ),
            );
          },
          child: Container(
            height: 160,
            width: screenWidth,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(house.imageUrl),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
            bottom: 10,
          ),
          child: Row(
            children: <Widget>[
              Text(
                house.address,
                style: GoogleFonts.notoSans(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "USD " + "${oCcy.format(house.price)}",
                style: GoogleFonts.notoSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 10,
          ),
          child: Text(
            house.bedrooms.toString() +
                " Dormitorios / " +
                house.bathrooms.toString() +
                " Baños / ... ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
