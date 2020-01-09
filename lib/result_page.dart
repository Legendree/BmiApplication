import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:simpleproject/constants.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  double calculatedBmi = 22.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'), elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Text('Your Result',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: ReusableCard(
                color: Color(0xFF1D1F33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('NORMAL',
                        style: TextStyle(
                            color: kBmiNormalRangeColor, fontSize: 18)),
                    SizedBox(height: 25),
                    Text(calculatedBmi.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 80,
                            color: Colors.white)),
                    Text('Normal BMI range:',
                        style:
                            TextStyle(color: Color(0xFF858894), fontSize: 18)),
                    Text('18,5 - 25 kg/m2',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 35),
                    Text('You have a normal body weight. \nGood job!',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center),
                    SizedBox(height: 15),
                    FlatButton(
                      color: Color(0xFF181927),
                      child: Text('SAVE RESULT',
                          style: TextStyle(
                              color: Colors.white, letterSpacing: 2.5)),
                      onPressed: () {},
                      padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFEA1556),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 70,
            child: Text(
              'RE-CALCULATE YOUR BMI',
              style: TextStyle(
                letterSpacing: 2.5,
                color: Colors.white,
                fontSize: 16
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
