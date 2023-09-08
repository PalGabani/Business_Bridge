

import 'package:business_bridge/screens/splash_screen.dart';
import 'package:business_bridge/widgets/NoInternet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

final _theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xFF303845),
  ),
  textTheme:GoogleFonts.latoTextTheme()
);


Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}


Future<void> showNoInternetDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Disallow dismissing the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('No Internet Connection'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Please turn on your internet or Wi-Fi.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown
//   ]);
//   runApp(
//      ProviderScope(
//       child: App(
//
//       ),
//
//     ),
//   );
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  final hasInternet = await checkInternetConnection();

  runApp(
    ProviderScope(
      child: App(
        hasInternet: hasInternet,
      ),
    ),
  );
}


// class App extends StatelessWidget {
//   const App({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: _theme,
//       home: SplashScreen(),
//     );
//   }
// }

class App extends StatelessWidget {
  final bool hasInternet;

  const App({Key? key, required this.hasInternet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: hasInternet ? SplashScreen() : NoInternetScreen(),
    );
  }
}
