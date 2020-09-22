import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButtonWidget extends StatelessWidget {
  final Function onTap;
  final String title;

  BottomButtonWidget({@required this.title,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: pink,
        child: Center(child: Text(title,style: bottomContainerText)),
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        height: bottomContainerHeight,
      ),
    );
  }
}
