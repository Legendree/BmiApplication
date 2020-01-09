import 'package:flutter/material.dart';

class BmiCustomSlider extends StatefulWidget {
  BmiCustomSlider({@required this.bmiSlider});

  Slider bmiSlider;

  @override
  _BmiCustomSliderState createState() => _BmiCustomSliderState();
}

class _BmiCustomSliderState extends State<BmiCustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: Color(0xFF8D8E98),
          thumbColor: Color(0xFFEB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayColor: Color.fromARGB(125, 177, 16, 64),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
        ),
        child: widget.bmiSlider);
  }
}
