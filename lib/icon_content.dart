import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25,),
        Icon(
          icon,
          size: 90.0,
        ),
        SizedBox(height: 15),
        Text(
          text,
          style: cardTextStyle,
        )
      ],
    );
  }
}
