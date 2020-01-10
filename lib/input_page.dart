import 'package:flutter/material.dart';
import 'package:simpleproject/result_page.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'CustomBmiSlider.dart';
import 'calculation.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isMaleSelected = true;
  bool isFemaleSelected = false;

  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      isMaleSelected = true;
                      isFemaleSelected = false;
                    });
                  },
                  color: kSexContainerColor,
                  cardChild: IconWidget(
                      text: 'MALE',
                      isActive: isMaleSelected,
                      iconData: FontAwesomeIcons.mars),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      isMaleSelected = false;
                      isFemaleSelected = true;
                    });
                  },
                  color: kSexContainerColor,
                  cardChild: IconWidget(
                      text: 'FEMALE',
                      isActive: isFemaleSelected,
                      iconData: FontAwesomeIcons.venus),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: kBmiContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kValueStyle,
                      ),
                      Text('cm', style: kTextStyle),
                    ],
                  ),
                  BmiCustomSlider(
                    bmiSlider: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 260.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: kBmiContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kTextStyle),
                      Text(weight.toString(), style: kValueStyle),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: Icons.add,
                            exec: () {
                              setState(() {
                                ++weight;
                                if (weight > 260) weight = 260;
                              });
                            },
                          ),
                          SizedBox(width: 15),
                          RoundIconButton(
                            icon: Icons.remove,
                            exec: () {
                              setState(() {
                                --weight;
                                if (weight < 15) weight = 15;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kBmiContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: kTextStyle),
                      Text(age.toString(), style: kValueStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: Icons.add,
                            exec: () {
                              setState(() {
                                ++age;
                                if (age > 120) age = 120;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                              icon: Icons.remove,
                              exec: () {
                                setState(() {
                                  --age;
                                  if (age < 3) age = 3;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
          Container(
            color: Color(0xFFEA1556),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Calculation bmiCalc = Calculation(height: height, weight: weight);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultPage(
                          calculatedBmi: bmiCalc.calculateBmi(),
                          bmiStatus: bmiCalc.getHealthStatus(),
                          advice: bmiCalc.getFeedback(),
                          statusColor: bmiCalc.statusColor(),
                        )));
                  },
                  child: Text("CALCULATE BMI",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.exec});

  final IconData icon;
  final Function exec;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.white, size: 32),
      shape: CircleBorder(),
      fillColor: kSexContainerColor,
      constraints: BoxConstraints.tightFor(width: 52, height: 52),
      onPressed: exec,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
    );
  }
}
