import 'package:flutter/material.dart';

import '../pallete.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final Function onChange;
  final bool isSecure;
  final TextInputType type;
  // final IconData icon;

  DefaultTextField(this.hint, this.onChange, this.isSecure, this.type, icon);

  TextField build(BuildContext context) {
    return TextField(
      
     decoration: new InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kOrange, width: 2.0),
          borderRadius: BorderRadius.circular(16),
          
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        //hintStyle: kBodyText,
        hintText: hint,
      ), 
      onChanged: onChange,
      obscureText: isSecure,
      keyboardType: type,
      style: kBodyText,
     
    ); 
  }
  } 