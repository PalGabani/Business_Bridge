import 'package:business_bridge/screens/executive_details.dart';
import 'package:business_bridge/utils/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class executive_login extends StatefulWidget{
  @override
  State<executive_login> createState() => _executive_loginState();
}

class _executive_loginState extends State<executive_login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController exidController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  int e = 0;
  bool _obsecureText = true;
  bool loading = false;




  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void login() {
    setState(() {
      loading = true;
    });

    String email = exidController.text.toString();
    String password = passController.text.toString();

    // Check if the user exists in the 'users' collection
    FirebaseFirestore.instance
        .collection('executive')
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
            return executive_details();
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
            .collection('user')
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


  //
  // Future<void> login(String exid, String password) async {
  //   try {
  //     // Query Firestore to get the executive's password
  //     final userDocument = await _firestore.collection('executive').doc(exid!).get();
  //     //print(userDocument);
  //
  //     if (userDocument.exists) {
  //
  //       // Handle case where exid doesn't exist
  //       Utiles().toastmessege("User Not Exists");
  //       return;
  //     }
  //
  //     final userPassword = userDocument.data()?['password'];
  //
  //     if (userPassword == password) {
  //       // Authentication was successful
  //       final customToken = await _createCustomToken(exid);
  //       if (customToken != null) {
  //         final userCredential = await _auth.signInWithCustomToken(customToken);
  //         final user = userCredential.user;
  //
  //         if (user != null) {
  //           // Successfully signed in using custom token
  //           // You can navigate to the desired screen here
  //           Utiles().toastmessege("Login Successful!");
  //           setState(() {
  //             loading = false;
  //           });
  //           Navigator.push(context, MaterialPageRoute(builder: (context) {
  //             return executive_details();
  //           }));
  //         } else {
  //           // Handle authentication failure
  //           Utiles().toastmessege("Error");
  //         }
  //       }
  //     } else {
  //       // Handle incorrect password
  //       Utiles().toastmessege("Password or Email incorrect!");
  //     }
  //   } catch (error) {
  //     // Handle errors here
  //     print(error.toString());
  //     Utiles().toastmessege(error.toString());
  //     // Display an error message or take appropriate action
  //   }
  // }
  //
  // Future<String?> _createCustomToken(String exid) async {
  //   try {
  //     final customToken = await _auth.currentUser!.getIdToken();
  //     return customToken;
  //   } catch (error) {
  //     print(error.toString());
  //     return null;
  //   }
  // }






  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 180,left: 30),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Text("Work Portal",
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          )),
                    ),
                  ),

                  // ----------------------- main part ------------------------
                  Expanded(
                      child: Container(
                        height: double.infinity,
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
                              key: formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                          return 'please Enter Login id';
                                        }
                                        if (!RegExp(
                                            "^[a-zA-z0-9+_.-]")
                                            .hasMatch(value)) {
                                          return 'Enter valid id';
                                        }
                                        return null;
                                      },
                                      controller: exidController,
                                      keyboardType:
                                      TextInputType.emailAddress,
                                      cursorColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Login ID:',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        label: Text(
                                          'Login id',
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
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    height: 060,
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
                                            _obsecureText = !_obsecureText;
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
                                  ),

                                  //------------  forgott password  ---------------------------------//
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {},
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


                                  //--------button-------///
                                  GestureDetector(
                                    onTap: () {
                                      if (formkey.currentState!
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
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