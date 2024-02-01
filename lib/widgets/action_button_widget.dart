import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final Color color;
  final Color strokeColor;
  final String text;
  final double width;
  final double height;
  final double strokeSize;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key,
      required this.color,
      required this.strokeColor,
      required this.text,
      required this.width,
      required this.height,
      required this.onTap,
      required this.strokeSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: strokeColor, width: strokeSize),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
