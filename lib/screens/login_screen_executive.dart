import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_screen_executive extends StatefulWidget {
  @override
  State<Login_screen_executive> createState() => _Login_screen_executiveState();
}

class _Login_screen_executiveState extends State<Login_screen_executive> {


  // FirebaseDatabase database = FirebaseDatabase.instance;

  // void _verifydata() async {
  //   DatabaseReference ref = FirebaseDatabase.instance.ref("User");
  //   DatabaseEvent d = await ref.once();
  //   Map temp = d.snapshot.value as Map;
  //   setState(() {});
  //   print("---- $temp");
  //   print(passController.text);
  //   temp.forEach((key, value) {
  //     if (temp[key]["email"] == emailController.text &&
  //         temp[key]["pass"] == passController.text) {
  //       print(temp[key]["email"] +
  //           temp[key]["pass"] +
  //           emailController.text +
  //           passController.text);
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => final_page()));
  //       e = 1;
  //       if (formkey.currentState!.validate()) {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => final_page()));
  //       } else {
  //         print("not valid");
  //       }
  //
  //     } else {
  //       e = 2;
  //     }
  //     // print(temp[key]["password"]);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(

        physics: BouncingScrollPhysics(),
        child: Container(

        ),
      ),
    );
  }
}
