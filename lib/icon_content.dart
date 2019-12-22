import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  IconWidget({this.isActive, @required this.text, @required this.iconData});

  bool isActive = false;

  final String text;
  final IconData iconData;

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Icon(widget.iconData, size: 65.0, color: widget.isActive ? Colors.white : Color(0xFF8F8E97)
      ),
      SizedBox(height: 18),
      Text(widget.text, 
      style: TextStyle(fontSize: 15, color: widget.isActive ? Colors.white : Color(0xFF8F8E97),
      fontWeight: FontWeight.bold,
      ),),
    ],);
  }
}