import 'dart:math';
import 'package:flutter/material.dart';

class Calculation {
  Calculation({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getHealthStatus() {
    if (_bmi > 26.00)
      return "OVERWEIGHT";
    else if (_bmi > 30.00)
      return "OBESE";
    else if (_bmi < 25.00 && _bmi > 18.5)
      return "NORMAL";
    else if (_bmi < 18.5) return "UNDERWEIGHT";
    return "EXTREMLY UNDERWEIGHT";
  }

  String getFeedback() {
    if (_bmi > 26.00)
      return "You should start balancing your carbs, fatty :)";
    else if (_bmi > 30.00)
      return "Avarage american, obese and ugly!";
    else if (_bmi < 25.00 && _bmi > 18.5)
      return "You're probably an european or so, perfect weight";
    else if (_bmi < 18.5) return "African boi";
    return "Holocaust survivor";
  }

  Color statusColor() {
    if (_bmi > 26.00)
      return Color(0xFFD1BA47);
    else if (_bmi > 30.00)
      return Color(0xFFC70039);
    else if (_bmi < 25.00 && _bmi > 18.5)
      return Color(0xFF75D147);
    else if (_bmi < 18.5) 
      return Color(0xFFFF5733);
    return Color(0xFF900C3F);
  }
}
