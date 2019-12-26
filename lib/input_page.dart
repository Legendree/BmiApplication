import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 60.0;
const sexContainerColor = Color(0xFF1D1E33);
const bmiContainerColor = Color(0xFF101427);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isMaleSelected = true;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
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
                  color: sexContainerColor,
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
                  color: sexContainerColor,
                  cardChild: IconWidget(
                      text: 'FEMALE',
                      isActive: isFemaleSelected,
                      iconData: FontAwesomeIcons.venus),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(color: bmiContainerColor),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(color: bmiContainerColor),
              ),
              Expanded(
                child: ReusableCard(color: bmiContainerColor),
              )
            ],
          )),
          Container(
            color: Color(0xFFEA1556),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
