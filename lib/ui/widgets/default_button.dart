import 'dart:ui';

import 'package:flutter/material.dart';

import '../pallete.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onClick;

  DefaultButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kOrange,
          border: new Border.all(color: kOrange, width: 2.0),
        ),
        height: size.height * 0.08,
        width: size.width * 0.8,
        child: new OutlinedButton(
          style: outlineButtonStyle,
          child: Text(
            text,
            style: kBodyText.copyWith(fontWeight: FontWeight.bold),
          ),
          onPressed: onClick,
        ));
  }

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    primary: kwhite,
    backgroundColor: kOrange,
    minimumSize: Size(280, 47),
    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    padding: EdgeInsets.symmetric(horizontal: 0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return BorderSide(
            color: Colors.grey,
            width: 2,
          );
        else
          return BorderSide(
            // color: Colors.black,
            width: 1,
          );
      },
    ),
  );
}
