
import 'package:business_bridge/screens/login_screen.dart';
import 'package:business_bridge/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(172, 130, 131, 132),
  ),
  textTheme:GoogleFonts.vt323TextTheme()
);

void main(){
runApp(MaterialApp(

  theme: _theme,
  home: Login_screen(),
));
}