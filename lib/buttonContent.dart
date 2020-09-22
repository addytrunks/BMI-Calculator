import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class MyButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  MyButton({@required this.icon,@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: buttonColor,
      elevation: 6.0,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}
