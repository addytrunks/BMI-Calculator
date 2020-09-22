import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'bottomButtonWidget.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String shortstring;
  final String bminumber;
  final String inter;

  ResultPage({this.shortstring,this.bminumber,this.inter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULTS'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text('Your Results',style: titleText,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: activeCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(shortstring,style: resultText,),
                  Text(bminumber,style: resultsNumberText,),
                  Text(inter,style: bodyTextStyle,textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButtonWidget(
              title: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
