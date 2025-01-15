import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';

// const myFont = GoogleFonts.robotoSerifTextTheme;
TextTheme darkTextTheme = GoogleFonts.poppinsTextTheme(
  TextTheme(
    titleMedium: TextStyle(color: lightText, fontSize: 18),
    titleLarge: const TextStyle(color: lightText, fontSize: 22),
  ),
);
TextTheme lightTextTheme = GoogleFonts.poppinsTextTheme(
  const TextTheme(
    titleMedium: TextStyle(color: darkText, fontSize: 18),
    titleLarge: TextStyle(color: darkText, fontSize: 22),
  ),
);
