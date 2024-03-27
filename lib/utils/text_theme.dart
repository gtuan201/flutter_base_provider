import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeData{
  static TextTheme textTheme = TextTheme(
    bodyMedium: GoogleFonts.nunito(color: Colors.white)
  );
  static TextStyle italicGrey = GoogleFonts.nunito(color: Colors.grey, textStyle: const TextStyle(
    fontStyle: FontStyle.italic,fontWeight: FontWeight.w600,fontSize: 16
  ),);
  static TextStyle mediumStyle = GoogleFonts.nunito(fontSize: 18,fontWeight: FontWeight.w600);
}