import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(
    this.title, {
    super.key,
    this.color,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
  });

  final String title;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
