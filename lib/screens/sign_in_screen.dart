import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signin_screen extends StatefulWidget {
  @override
  State<Signin_screen> createState() => _Signin_screenState();
}

class _Signin_screenState extends State<Signin_screen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    bool _obsecureText=true;
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(

        physics: BouncingScrollPhysics(),
        child: Form(
          key: formkey,
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 50, 40, keyBoardSpace + 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ------------------login heading and Logo ---------------------//
                  CircleAvatar(
                    child: Image.asset(
                        'assets/WhatsApp Image 2023-07-11 at 6.13.16 PM.jpeg'),
                    maxRadius: 50,
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
                          'Sign in',
                          //textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),

                  // ------------------ another components ---------------------//
                  // Container(
                  //   decoration: BoxDecoration(),
                  //   child: Column(
                  //     children: [
                  //       //------------  business Name ---------------------------------//
                  //
                  //       TextFormField(
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return 'please Enter E-mail';
                  //           }
                  //           return null;
                  //         },
                  //         //controller: ,
                  //         keyboardType: TextInputType.emailAddress,
                  //         cursorColor: Theme.of(context).colorScheme.primary,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter Business Name:',
                  //           hintStyle: Theme.of(context)
                  //               .textTheme
                  //               .titleMedium!
                  //               .copyWith(
                  //                 color: Theme.of(context).colorScheme.primary,
                  //               ),
                  //           label: Text(
                  //             'Business Name',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .titleMedium!
                  //                 .copyWith(
                  //                   color:
                  //                       Theme.of(context).colorScheme.primary,
                  //                 ),
                  //           ),
                  //           prefixIcon: Icon(
                  //             Icons.mail,
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //             borderSide: BorderSide(
                  //               width: 2,
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       // SizedBox(
                  //       //   height: 20,
                  //       // ),
                  //
                  //       //------------  Country  ---------------------------------//
                  //       Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: Text(
                  //           'Country',
                  //           textAlign: TextAlign.left,
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .titleMedium!
                  //               .copyWith(
                  //                 color: Theme.of(context).colorScheme.primary,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 20,
                  //               ),
                  //         ),
                  //       ),
                  //       TextFormField(
                  //         keyboardType: TextInputType.visiblePassword,
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return "Please Enter Password";
                  //           }
                  //           if (value.trim().length < 8) {
                  //             return 'Password should be in 8 characters in length';
                  //           }
                  //           return null;
                  //         },
                  //        // controller: passController,
                  //         cursorColor: Theme.of(context).colorScheme.primary,
                  //        // obscureText: _obsecureText,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter Password:',
                  //           hintStyle: Theme.of(context)
                  //               .textTheme
                  //               .titleMedium!
                  //               .copyWith(
                  //                 color: Theme.of(context).colorScheme.primary,
                  //               ),
                  //           label: Text(
                  //             'Country',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .titleMedium!
                  //                 .copyWith(
                  //                   color:
                  //                       Theme.of(context).colorScheme.primary,
                  //                 ),
                  //           ),
                  //           prefixIcon: Icon(
                  //             Icons.lock_outline_sharp,
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           suffixIcon: GestureDetector(
                  //             onTap: () {
                  //             //  _obsecureText = !_obsecureText;
                  //               setState(() {});
                  //             },
                  //             // child: Icon(
                  //             //  // _obsecureText
                  //             //    //   ? Icons.visibility
                  //             //     //  : Icons.visibility_off,
                  //             //   //color: Theme.of(context).colorScheme.primary,
                  //             // ),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //             borderSide: BorderSide(
                  //               width: 2,
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       //------------  License no./Gst no.  ---------------------------------//
                  //       TextFormField(
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return 'please Enter License no./Gst no.';
                  //           }
                  //           return null;
                  //         },
                  //         //controller: ,
                  //         keyboardType: TextInputType.emailAddress,
                  //         cursorColor: Theme.of(context).colorScheme.primary,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter License no./Gst no.:',
                  //           hintStyle: Theme.of(context)
                  //               .textTheme
                  //               .titleMedium!
                  //               .copyWith(
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           label: Text(
                  //             'License no./Gst no.',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .titleMedium!
                  //                 .copyWith(
                  //               color:
                  //               Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //           prefixIcon: Icon(
                  //             Icons.mail,
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //             borderSide: BorderSide(
                  //               width: 2,
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       //------------  set user name.  ---------------------------------//
                  //       TextFormField(
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return 'please Enter User name';
                  //           }
                  //           return null;
                  //         },
                  //         //controller: ,
                  //         keyboardType: TextInputType.emailAddress,
                  //         cursorColor: Theme.of(context).colorScheme.primary,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter User Name:',
                  //           hintStyle: Theme.of(context)
                  //               .textTheme
                  //               .titleMedium!
                  //               .copyWith(
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           label: Text(
                  //             'Set User Name',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .titleMedium!
                  //                 .copyWith(
                  //               color:
                  //               Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //           prefixIcon: Icon(
                  //             Icons.mail,
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //             borderSide: BorderSide(
                  //               width: 2,
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       //------------  set PassWord  ---------------------------------//
                  //       TextFormField(
                  //         keyboardType: TextInputType.visiblePassword,
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return "Please Enter Password";
                  //           }
                  //           if (value.trim().length < 8) {
                  //             return 'Password should be in 8 characters in length';
                  //           }
                  //           return null;
                  //         },
                  //         //controller: passController,
                  //         cursorColor: Theme.of(context).colorScheme.primary,
                  //         obscureText: _obsecureText,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter Password:',
                  //           hintStyle: Theme.of(context)
                  //               .textTheme
                  //               .titleMedium!
                  //               .copyWith(
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           label: Text(
                  //             'Password',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .titleMedium!
                  //                 .copyWith(
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //           prefixIcon: Icon(
                  //             Icons.lock_outline_sharp,
                  //             color: Theme.of(context).colorScheme.primary,
                  //           ),
                  //           suffixIcon: GestureDetector(
                  //             onTap: () {
                  //               _obsecureText = !_obsecureText;
                  //               setState(() {});
                  //             },
                  //             child: Icon(
                  //               _obsecureText
                  //                   ? Icons.visibility
                  //                   : Icons.visibility_off,
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //             borderSide: BorderSide(
                  //               width: 2,
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       //
                  //       // SizedBox(
                  //       //   height: 20,
                  //       // ),
                  //
                  //       //------------  Login in goto  ---------------------------------//
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             'Already Have an Account?',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               color: Theme.of(context).colorScheme.primary,
                  //             ),
                  //           ),
                  //           TextButton(
                  //               onPressed: () {},
                  //               child: Text(
                  //                 "Log IN ",
                  //                 style: TextStyle(
                  //                   fontSize: 15,
                  //                   color:
                  //                       Theme.of(context).colorScheme.primary,
                  //                   decoration: TextDecoration.underline,
                  //                 ),
                  //               )),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         height: 30,
                  //       ),
                  //
                  //       //------------  submit  ---------------------------------//
                  //       ElevatedButton(
                  //         onPressed: () {},
                  //         child: Text(
                  //           'Sign In',
                  //           style:
                  //               Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //                     color: Theme.of(context)
                  //                         .colorScheme
                  //                         .onPrimaryContainer,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
