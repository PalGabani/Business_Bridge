import 'dart:async';

import 'package:business_bridge/screens/executive_details.dart';
import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashservices {


  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
        Duration(seconds: 6),
            () =>
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homepage()),
            ),
      );
    } else {
      Timer(
        Duration(seconds: 6),
            () =>
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login_page()),
            ),
      );
    }
    //   if (user != null) {
    //     FirebaseFirestore.instance
    //         .collection('users') // Assuming your user data is stored in a 'users' collection
    //         .doc(user.uid) // Assuming you use the user's UID as the document ID
    //         .get()
    //         .then((DocumentSnapshot documentSnapshot) {
    //       if (documentSnapshot.exists) {
    //         Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;
    //         if (userData['userType'] == 'executive') {
    //           // If the user's userType is 'executive', navigate to the executive_home page
    //           Timer(
    //             Duration(seconds: 5),
    //                 () => Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => executive_details()),
    //             ),
    //           );
    //         } else {
    //           Timer(
    //                   Duration(seconds: 5),
    //                       () => Navigator.push(
    //                     context,
    //                     MaterialPageRoute(builder: (context) => homepage()),
    //                   ),
    //                 );
    //         }
    //       } else {
    //         // Handle the case where the document does not exist
    //         Timer(
    //                 Duration(seconds: 5),
    //                     () => Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => Login_page()),
    //                 ),
    //               );
    //       }
    //     });
    //   }
    //
    //   else{
    //       Timer(
    //         Duration(seconds: 5),
    //             () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => Login_page()),
    //         ),
    //       );
    //     }
    //
    // }
  }

}
