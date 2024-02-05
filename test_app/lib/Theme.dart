import 'package:flutter/material.dart';


List<int> colorStrengths = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]; //List of strengths for each color

MaterialColor getMaterialColor(Color color) {
  ///This method will get the strength of each colour

  List strengths = <double>[0.05]; //List of strengths divided by 1000
  Map swatch = <int, Color>{};
  final int r = color.red,
      g = color.green,
      b = color.blue;

  for (int i = 1, len = 9; i <= len; i++) { //From 1 to 9
    strengths.add(0.1 * i); //Add the strength to the list
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;

    swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1);
  }

  return MaterialColor(color.value, swatch as Map<int, Color>);
}



class TestAppColour extends ColorScheme{

  static const Color primaryBlue = Color(0xFF6A98BC);
  static const Color babyBlue = Color(0xFFB8DAF8);
  static const Color primaryGrey = Color(0xFFC5C4C8);
  static const Color primaryYellow = Color(0xFFFFF351);
  static const Color primaryPink = Color(0xFFFF66C4);
  static const Color primaryGreen = Color(0xFFC0E2C3);
  static const Color primaryPurple = Color(0xFF5E17EB);

  TestAppColour({

    Color primary = primaryBlue,
    Color secondary = primaryPurple,

    required super.brightness,
    required super.onPrimary,
    required super.onSecondary,
    required super.error,
    required super.onError,
    required super.background,
    required super.onBackground,
    required super.surface,
    required super.onSurface}) : super(primary: primary, secondary: secondary);
}



