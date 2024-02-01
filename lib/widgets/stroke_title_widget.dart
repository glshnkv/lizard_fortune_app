import 'package:flutter/material.dart';

class StrokeTitleWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color strokeColor;

  const StrokeTitleWidget(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.textColor,
      required this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = strokeColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
