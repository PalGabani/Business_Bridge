import 'package:business_bridge/screens/forget_password_user.dart';
import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/screens/sector_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utility.dart';
import '../widgets/pop_up.dart';

class Login_page extends StatefulWidget {
  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  int e = 0;
  bool _obsecureText = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  // void login() {
  //   setState(() {
  //     loading = true;
  //   });
  //   _auth
  //       .signInWithEmailAndPassword(
  //           email: emailController.text.toString(),
  //           password: passController.text.toString())
  //       .then((value) {
  //        // Utiles().toastmessege(value.user!.email.toString());
  //     Utiles().toastmessege("Login SucessFul!");
  //     setState(() {
  //       loading = false;
  //     });
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return homepage();
  //     }));
  //   }).onError((error, stackTrace) {
  //     debugPrint(error.toString());
  //     Utiles().toastmessege(error.toString());
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }
  void login() {
    setState(() {
      loading = true;
    });

    String email = emailController.text.toString();
    String password = passController.text.toString();

    // Check if the user exists in the 'users' collection
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Utiles().toastmessege("Login Successful!");
          setState(() {
            loading = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return homepage();
          }));
        }).onError((error, stackTrace) {
          debugPrint(error.toString());
          Utiles().toastmessege(error.toString());
          setState(() {
            loading = false;
          });
        });
      } else {
        // Check if the user exists in the 'executive' collection
        FirebaseFirestore.instance
            .collection('executive')
            .where('email', isEqualTo: email)
            .get()
            .then((QuerySnapshot executiveSnapshot) {
          if (executiveSnapshot.docs.isNotEmpty) {
            // User is in the 'executive' collection, perform executive login logic here
            // For example:
            // _auth.signInWithEmailAndPassword(...);
            // Navigate to executive page...
            Utiles().toastmessege("User not found.");
            setState(() {
              loading = false;
            });
          } else {
            // User not found in either collection
            Utiles().toastmessege("User not found.");
            setState(() {
              loading = false;
            });
          }
        });
      }
    });
  }

  final _form = GlobalKey<FormState>();
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(backgroundColor: Colors.transparent,
        //
        //   automaticallyImplyLeading: false,
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_login.png'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    //---------------------------- uper part--------------------------------------//
                    Container(
                      //color: Colors.brown,
                      color: Colors.transparent,
                      height: 250,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              color: Colors.transparent,
                              height: 110,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // width: 30,
                                    // height: 30,
                                    color: Colors.transparent,
                                    child: Popup(),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Container(
                              // height: 80,
                              //width: 250,
                              color: Colors.transparent,
                              // padding: EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiary,
                                        ),
                                  ),
                                  Text(
                                    "\"Welcome Back\"",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
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
                    //---------------------------------------- main part-----------------------------//
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
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
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                30, 50, 30, keyBoardSpace + 20),
                            child: Form(
                              key: _form,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // ------------------ another components ---------------------//
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        Container(
                                         // height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: emailController,
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
                                                onSaved: (value) {},
                                                keyboardType:
                                                    TextInputType.emailAddress,
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
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),


                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        //------------  PassWord  ---------------------------------//

                                        Container(
                                         // height: 060,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.visiblePassword,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Password";
                                                  }
                                                  if (value.trim().length < 8) {
                                                    return 'Password should be in 8 characters in length';
                                                  }
                                                  return null;
                                                },
                                                controller: passController,
                                                cursorColor: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                obscureText: _obsecureText,
                                                decoration: InputDecoration(
                                                  hintText: 'Enter Password:',
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                      ),
                                                  label: Text(
                                                    'Password',
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
                                                    Icons.lock_outline_sharp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                                  suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      _obsecureText =
                                                          !_obsecureText;
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      _obsecureText
                                                          ? Icons.visibility
                                                          : Icons.visibility_off,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                      width: 2,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //------------  forgott password  ---------------------------------//
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return forget_password_user();
                                                }));
                                              },
                                              child: Text(
                                                "Forgot password?",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff9DB2BF),
                                                    fontWeight: FontWeight
                                                        .bold // decoration: TextDecoration.underline,
                                                    ),
                                              )),
                                        ),
                                        //-----------error msg show------------------------------///
                                        Container(
                                          alignment:
                                              AlignmentDirectional.center,
                                          //margin: EdgeInsets.only(top: 00),
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            e == 2
                                                ? "Please,Enter valid Username and Password !"
                                                : " ",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 13),
                                          ),
                                        ),

                                        //--------button-------///
                                        GestureDetector(
                                          onTap: () {
                                            if (_form.currentState!
                                                .validate()) {
                                              login();
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                  child: Text(
                                                    'Login',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (loading) // Show CircularProgressIndicator when loading is true
                                                Positioned.fill(
                                                  child: Container(

                                                    color: Colors.white.withOpacity(0.5),
                                                    child: Center(
                                                      child: CircularProgressIndicator(color: Colors.blueGrey,),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),

                                        //------------ login with google,.....-----//
                                        Container(
                                            // height: 20,
                                            //color: Colors.lightBlueAccent,
                                            child: Column(
                                          children: [
                                            // Divider(
                                            //  height: 5,
                                            //   color: Colors.black,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Container(
                                                    height: 1.0,
                                                    width: 90,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                // SizedBox(height: 10,),
                                                Text(
                                                  'or Login With',
                                                  //textAlign: Alignment.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onBackground,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Container(
                                                    height: 1.0,
                                                    width: 90,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                //google
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: 145,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(),
                                                        color: Colors.white54),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                15, 10, 15, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 20,
                                                              width: 20,
                                                              child: Image.asset(
                                                                  'assets/images/icon/google.png'),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'Google',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                //facebook
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: 145,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(),
                                                        color: Colors.white54),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                15, 10, 15, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 20,
                                                              width: 20,
                                                              child: Image.asset(
                                                                  'assets/images/icon/linkedin.png'),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'LinkedIn',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                // fontWeight: FontWeight.bold,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                        SizedBox(
                                          height: 30,
                                        ),

                                        //------------  sign in goto  ---------------------------------//
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Don\'t have an account ?',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return sector_page();
                                                  }));
                                                },
                                                child: Text(
                                                  "Sign UP ",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff9DB2BF),
                                                      // color: Color(0xffbadb6e),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
