
import 'package:bmi_calculator/buttonContent.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottomButtonWidget.dart';
import 'calculator.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;
  int height = 190;
  int weight = 74;
  int age = 24;

  // 1 = male,2 = female
  void updateCard(int gender){
    if (gender == 1){
      if (maleColor == inactiveCardColor){
        maleColor = activeCardColor;
        femaleColor = inactiveCardColor;
      }
      else{
        maleColor = inactiveCardColor;
      }
    }
    if(gender == 2){
      if(femaleColor == inactiveCardColor){
        femaleColor = activeCardColor;
        maleColor = inactiveCardColor;
      }
      else{
        femaleColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
                      onPressed: (){
                        setState(() {
                          updateCard(1);
                        });
                      },
                      colour: maleColor,
                      cardWidget: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReuseableCard(
                        onPressed: (){
                          setState(() {
                            updateCard(2);
                          });
                        },
                    colour: femaleColor,
                    cardWidget: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: inactiveCardColor,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style: cardTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style: numberStyle,),
                        Text('cm',style: cardTextStyle,),
                      ],
                    ),
                    Slider(
                      min: 100.0,
                      max: 220.0,
                      value: height.toDouble(),
                       onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReuseableCard(
                        cardWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',style: cardTextStyle,),
                            Text(weight.toString(),style: numberStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyButton(
                                  icon:FontAwesomeIcons.minus,
                                onPressed: (){
                                    setState(() {
                                      weight--;
                                      if(weight<=0){
                                        weight = 0;
                                      }
                                    });
                                },
                                ),
                                SizedBox(width: 10.0,),
                                MyButton(
                                  icon:FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                    colour: inactiveCardColor,
                  )),
                  Expanded(
                      child: ReuseableCard(
                    colour: inactiveCardColor,
                        cardWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',style: cardTextStyle,),
                            Text(age.toString(),style: numberStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyButton(
                                  icon:FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                      if(age<=0){
                                        age = 0;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0,),
                                MyButton(
                                  icon:FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                  )),
                ],
              ),
            ),
            BottomButtonWidget(
              title: 'CALCULATE YOUR BMI',
              onTap: (){
                Calculator calc = Calculator(height: height,weight: weight);
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bminumber: calc.calculateBMI(),
                    inter: calc.getInterpretation(),
                    shortstring: calc.getResult(),
                  )
                ));
              }
            )
          ],
        ));
  }
}




