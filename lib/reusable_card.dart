import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color colour;
  final Widget cardWidget;
  final Function onPressed;

  ReuseableCard({@required this.colour, this.cardWidget,this.onPressed});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardWidget,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
