import 'package:business_bridge/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  int e = 0;
  bool _obsecureText = false;

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
        child: Form(
          key: formkey,
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 90, 40, keyBoardSpace + 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ------------------login heading and Logo ---------------------//
                  CircleAvatar(
                    child: Image.asset(
                        'assets/WhatsApp Image 2023-07-11 at 6.13.16 PM.jpeg'),
                    maxRadius: 70,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Text(
                          'Login',
                          //textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  // ------------------ another components ---------------------//
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        //------------  Email ID ---------------------------------//
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     'Email ID',
                        //     textAlign: TextAlign.left,
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .titleMedium!
                        //         .copyWith(
                        //           color: Theme.of(context).colorScheme.primary,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 20,
                        //         ),
                        //   ),
                        // ),
                        TextFormField(

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please Enter E-mail';
                            }
                            if (!RegExp("^[a-zA-z0-9+_.-]+@[gmail.com]")
                                .hasMatch(value)) {
                              return 'Enter valid E-mail';
                            }
                            return null;
                          },
                          controller:emailController ,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          decoration: InputDecoration(
                            hintText: 'Enter Email ID:',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            label: Text(
                              'Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //------------  PassWord  ---------------------------------//
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     'Password',
                        //     textAlign: TextAlign.left,
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .titleMedium!
                        //         .copyWith(
                        //           color: Theme.of(context).colorScheme.primary,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 20,
                        //         ),
                        //   ),
                        // ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
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
                          cursorColor: Theme.of(context).colorScheme.primary,
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            hintText: 'Enter Password:',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            label: Text(
                              'Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outline_sharp,
                              color: Theme.of(context).colorScheme.primary,
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
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary,
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
                                  color: Theme.of(context).colorScheme.primary,
                                  // decoration: TextDecoration.underline,
                                ),
                              )),
                        ),
                        Container(
                          alignment: AlignmentDirectional.center,
                          margin: EdgeInsets.only(top: 00),
                          child: Text(
                            e == 2
                                ? "Please,Enter valid Username and Password !"
                                : " ",
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //------------  sign in goto  ---------------------------------//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return Signin_screen();
                                      }));
                                },
                                child: Text(
                                  "Sign IN ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).colorScheme.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        //------------  submit  ---------------------------------//
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'SUBMIT',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
