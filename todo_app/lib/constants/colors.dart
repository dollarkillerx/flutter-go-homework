import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalColors {
  static Color bgColor = Color(0xff3A7BFF);
  static Color prColor = Color(0xff3A7BFF).withOpacity(0.8);
  static Color errorColor = Colors.red;
}

class GlobalFont {
  static var fontPressStart2p = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  );

  static var fontRubikIso = GoogleFonts.rubikIso(
    // textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  );

  static var baseFont = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}