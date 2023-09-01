import 'dart:async';

import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashservices {


  void isLogin(BuildContext context) {

    FirebaseAuth auth=FirebaseAuth.instance;


    final user=auth.currentUser;
    if(user!=null){
      Timer(
        Duration(seconds: 2),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        ),
      );
    }else{
      Timer(
        Duration(seconds: 2),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login_page()),
        ),
      );
    }

  }
}
