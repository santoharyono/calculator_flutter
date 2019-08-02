import 'package:flutter/material.dart';

class CalculatorButtonText extends StatelessWidget {
  final String text;
  final Color color;

  CalculatorButtonText({@required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24.0, color: color),
    );
  }
}
