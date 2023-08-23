import 'package:business_bridge/screens/admin_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class admin_login extends StatefulWidget{
  @override
  State<admin_login> createState() => _admin_loginState();
}

class _admin_loginState extends State<admin_login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController loginidController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  int e = 0;
  bool _obsecureText = true;

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
                      child: Text("Admin",
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
                                    controller: loginidController,
                                    keyboardType:
                                    TextInputType.emailAddress,
                                    cursorColor: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Admin ID:',
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
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  //margin: EdgeInsets.only(top: 00),
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    e == 2
                                        ? "Please,Enter valid Login id and Password !"
                                        : " ",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                ),

                                //--------button-------///
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      //Navigator.pushanduntill
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          //return listdata();
                                          return admin_details();
                                        },
                                      ),
                                      //(route)=>false
                                    );
                                  },
                                  child: Container(
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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