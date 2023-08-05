import 'package:business_bridge/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class work_portal_page extends StatefulWidget{
  @override
  State<work_portal_page> createState() => _work_portal_pageState();
}

class _work_portal_pageState extends State<work_portal_page> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  int e = 0;
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity  ,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/workportal/workportalbg1.png',),
              fit: BoxFit.fitWidth,
              colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5),
                  BlendMode.saturation),
                       ),

          ),
          child: SingleChildScrollView(

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
                            'assets/images/Group 50.png'),
                        maxRadius: 80,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5),
                            child: Text(
                              'Add Employee',
                              //textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).colorScheme.background,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                              cursorColor: Theme.of(context).colorScheme.background,
                              decoration: InputDecoration(
                                hintText: 'Enter Email ID:',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                                label: Text(
                                  'Email',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Theme.of(context).colorScheme.background,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Theme.of(context).colorScheme.background,
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
                              cursorColor: Theme.of(context).colorScheme.background,
                              obscureText: _obsecureText,
                              decoration: InputDecoration(
                                hintText: 'Enter Password:',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                                label: Text(
                                  'Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline_sharp,
                                  color: Theme.of(context).colorScheme.background,
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
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Theme.of(context).colorScheme.background,
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
                                      color: Theme.of(context).colorScheme.background,
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

                            //------------ BUTTON  ---------------------------------//
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return homepage();
                                    }));
                              },
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
        ),
      ),
    );
  }
}