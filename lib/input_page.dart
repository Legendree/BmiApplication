import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 60.0;
const sexContainerColor = Color(0xFF1D1E33);
const bmiContainerColor = Color(0xFF101427);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                child: ReusableCard(color: sexContainerColor,
                cardChild: IconWidget(text: 'MALE', isActive: true, iconData: FontAwesomeIcons.mars),
                ),
              ),
              Expanded(
                child: ReusableCard(color: sexContainerColor,
                cardChild: IconWidget(text: 'FEMALE', isActive: false, iconData: FontAwesomeIcons.venus),
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
                child:  ReusableCard(color: bmiContainerColor),
              ),
              Expanded(
                child:  ReusableCard(color: bmiContainerColor),
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