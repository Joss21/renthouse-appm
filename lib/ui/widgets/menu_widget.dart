import 'package:flutter/material.dart';
import '../pallete.dart';

class MenuWidget extends StatelessWidget {
  final IconData iconImg;
  final Color iconColor;
  final Color conBackColor;
  final Function() onbtnTap;

  MenuWidget({
    Key key,
    @required this.iconImg,
    @required this.iconColor,
    this.conBackColor,
    this.onbtnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onbtnTap();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: kOrange,
          border: Border.all(
            color: kOrange,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          iconImg,
          color: iconColor,
        ),
      ),
    );
  }
}
