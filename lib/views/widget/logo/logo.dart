import 'package:flutter/material.dart';
import 'package:new_sql_playground/utilitys/extensions/decorative_extension.dart';
import '../../../utilitys/constants/sql_constants.dart';
import '../text/tile_text.dart';


class TextLogo extends StatelessWidget {
  const TextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          logo,
          height: 40,
          width: 40,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.ac_unit_rounded);
          },
        ),
        12.hSpace,
        const TitleText(
          'SQL Playground',
        ),
      ],
    );
  }
}
