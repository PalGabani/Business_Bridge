import 'package:business_bridge/screens/login_page_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forget_password_user extends StatefulWidget{
  @override
  State<forget_password_user> createState() => _forget_password_userState();
}

class _forget_password_userState extends State<forget_password_user> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();


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
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  // -------------- upper part --------------------
                  Container(
                    //color: Colors.brown,
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
                            // height: 80,
                            //width: 250,
                            color: Colors.transparent,
                            // padding: EdgeInsets.all(30),
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
                                    color:
                                    Theme.of(context).colorScheme.onTertiary,
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
                              offset: Offset(0, 5),),],
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
                                  Text('Enter your email for the verification process,'
                                      '\nwe will send mail to your email.',
                                    style: TextStyle(
                                      fontSize: 16
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
                                  ),
                                  SizedBox(
                                    height: 300,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // ---------------------- check email is registered in database or not ----------------------
                                      // if( emailController != )
                                      //   showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) => AlertDialog(
                                      //   title: const Text(''),
                                      //   backgroundColor: Theme.of(context).colorScheme.background,
                                      //   elevation: 5,
                                      //   content: const Text('Enter valid email address'),
                                      //   actions: <Widget>[
                                      //     TextButton(
                                      //       child: const Text('OK'),
                                      //       onPressed: () {
                                      //         Navigator.push(
                                      //           //Navigator.pushanduntill
                                      //           context,
                                      //           MaterialPageRoute(
                                      //             builder: (context) {
                                      //               return Login_page() ;
                                      //             },
                                      //           ),
                                      //           //(route)=>false
                                      //         );
                                      //       },
                                      //     ),
                                      //   ],
                                      // ),
                                      //   );
                                      // else
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                            title: const Text('Send successfully'),
                                            backgroundColor: Theme.of(context).colorScheme.background,
                                            elevation: 5,
                                            content: const Text('We sent a mail to your email address , check your email and complete the process to change your password.'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('OK'),
                                                onPressed: () {
                                                  //Navigator.push(
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return Login_page() ;
                                                      },
                                                    ),
                                                    (route)=>false
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                      );
                                      // Navigator.push(
                                      //   //Navigator.pushanduntill
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return Login_page() ;
                                      //     },
                                      //   ),
                                      //   //(route)=>false
                                      // );
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
                                        child: Text(
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