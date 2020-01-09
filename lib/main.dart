import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData(
        primaryColor: Color(0xFF090C22),
        accentColor: Color(0xFFEA1556),
        scaffoldBackgroundColor: Color(0xFF090C22),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
        fontFamily: 'Lato'
      ),
    );
  }
}