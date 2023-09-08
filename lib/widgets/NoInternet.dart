import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/splash_screen.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.white.withOpacity(0.8),
      appBar:AppBar(
        title: Text('No Internet', style: TextStyle()),
      //  centerTitle: true, // Set this property to true
        backgroundColor: Colors.blueGrey.withOpacity(0.2),
      ),

      body: Container(
        height: double.infinity,
        color: Colors.blueGrey.withOpacity(0.2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No internet connection!',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Or',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Check Your internet Connection!',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  // Retry button to check for internet again
                  checkInternetConnection().then((hasInternet) {
                    if (hasInternet) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    }
                  });
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
