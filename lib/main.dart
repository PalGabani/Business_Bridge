
import 'package:business_bridge/screens/login_screen.dart';
import 'package:business_bridge/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(172, 130, 131, 132),
  ),
  textTheme:GoogleFonts.latoTextTheme()
);

void main() {
  runApp(
     ProviderScope(
      child: App(

      ),

    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: Login_screen(),
    );
  }
}

