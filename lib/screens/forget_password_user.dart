import 'package:business_bridge/screens/login_page_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forget_password_user extends StatefulWidget{
  @override
  State<forget_password_user> createState() => _forget_password_userState();
}

class _forget_password_userState extends State<forget_password_user> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  bool emailSent = false;
  bool isSendingEmail = false; // Added variable to track email sending state
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Function to simulate sending a reset password email
  // Future<void> sendResetPasswordEmail(String email) async {
  //   _auth.sendPasswordResetEmail(email: emailController.text.toString());
  //   // Here you can implement the logic to send the reset password email.
  //   // You might want to use a backend service or an API to send the email.
  //   // For this example, we'll just simulate the process with a delay.
  //   await Future.delayed(Duration(seconds: 1));
  // }


  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  // -------------- upper part --------------------
                  Container(
                    color: Colors.transparent,
                    height: 220,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Forget Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //--------------- main part ----------------------
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff9DB2BF).withOpacity(0.8),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                30, 30, 30, keyBoardSpace + 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Enter your email for the verification process,'
                                      '\nwe will send mail to your email.',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff232855)
                                            .withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(2, 7),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please Enter E-mail';
                                      }
                                      if (!RegExp(
                                          "^[a-zA-z0-9+_.-]+@[gmail.com]")
                                          .hasMatch(value)) {
                                        return 'Enter valid E-mail';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Email ID:',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                      label: Text(
                                        'Email',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (!isSendingEmail &&
                                        formkey.currentState!.validate()) {
                                      setState(() {
                                        isSendingEmail = true;
                                      });

                                      _auth.sendPasswordResetEmail(email: emailController.text.toString());

                                      setState(() {
                                        emailSent = true;
                                        isSendingEmail = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff9DB2BF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff232855)
                                              .withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(2, 7),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: isSendingEmail
                                          ? CircularProgressIndicator(
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                            Colors.white),
                                      )
                                          : Text(
                                        'Forget Password',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (emailSent)
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      'A password reset email has been sent to your email address.',
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}