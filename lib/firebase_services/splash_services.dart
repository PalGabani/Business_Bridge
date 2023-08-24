import 'dart:async';

import 'package:business_bridge/screens/login_page_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashservices {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login_page()),
      ),
    );
  }
}
