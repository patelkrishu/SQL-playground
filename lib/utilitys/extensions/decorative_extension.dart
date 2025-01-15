import 'package:flutter/cupertino.dart';

extension SizeExtension on num{
  SizedBox get vSpace => SizedBox(height: toDouble());
  SizedBox get hSpace => SizedBox(width: toDouble());
}