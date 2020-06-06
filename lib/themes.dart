import 'package:flutter/material.dart';
final ThemeData themeData=_buildTheme();

ThemeData _buildTheme(){
  const Color primaryColor=Color(0xFF26A69A);
  const Color secondaryColor = Color(0xFF80CBC4);
  ColorScheme colorScheme=ColorScheme(primary: primaryColor,secondary: secondaryColor);
  return ThemeData.dark().copyWith(colorScheme:  colorScheme);
}