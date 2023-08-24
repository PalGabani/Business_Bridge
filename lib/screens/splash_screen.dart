import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Splashservices splashservices=Splashservices() ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('WElcome',style: TextStyle(fontSize: 30),)),
    );
  }

}