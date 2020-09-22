//This page is for designing our theme.

import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';


void main(){
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: activeCardColor,
            thumbColor: pink,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayColor: Color(0x29EB1555),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            trackHeight:3
        ),
      ),
      home: SafeArea(child: InputPage()),
    );
  }
}

