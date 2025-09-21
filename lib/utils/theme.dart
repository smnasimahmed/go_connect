import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeDataLight = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  textTheme: GoogleFonts.robotoTextTheme(
    ThemeData.dark().textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
  ),
  colorSchemeSeed: ConstColour.primaryColor,
);
