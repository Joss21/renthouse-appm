import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HouseWidget extends StatelessWidget {
  final String number;
  final String type;
  HouseWidget({
    this.number,
    this.type,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                18.0,
              ),
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]),
            ),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.4),
                  )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      type,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
          )
        ]);

    /*  Text(
          type,
          style: GoogleFonts.notoSans(
            fontSize: 16,
            color: Colors.black,
          ),
        ), */
  }
}
