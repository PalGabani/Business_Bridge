
import 'package:business_bridge/screens/executive_login.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page_user.dart';

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

    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Login_page when the back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Login_page(); // Replace with your login page
            },
          ),
        );
        return true; // Return true to prevent default back button behavior
      },
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          // ),
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/workportal/workportalbg1.png',
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.saturation),
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.only(left: 30, top: 60),
              child: Text("Executive Portal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  )),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.only(left: 30, top: 400, right: 30),
              child: Text(
                  "\"Success is not one-time achievement,\nit's journey of continuous effort and improvement.\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120,top: 35),
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                          return executive_login();
                        }

                        ),
                        (route)=>route.isFirst
                    );
                  },
                  child: Text(
                    'NEXT',style: TextStyle(color: Colors.white, fontSize: 25,),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
