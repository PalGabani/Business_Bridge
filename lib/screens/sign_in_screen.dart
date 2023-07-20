import 'package:business_bridge/models/business_category.dart';
import 'package:business_bridge/provider/category_provider.dart';
import 'package:business_bridge/screens/b_categories.dart';
import 'package:business_bridge/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:business_bridge/provider/category_provider.dart';

import '../data/dummy_data.dart';


class Signin_screen extends StatefulWidget {
  @override
  State<Signin_screen> createState() => _Signin_screenState();
}

class _Signin_screenState extends State<Signin_screen> {


  String? chooseItem;
  List listitem = [
    "Afghanistan",
    "Algeria",
    "Angola",
    "Argentina",
    "Bangladesh",
    "Brazil",
    "Canada",
    "China",
    "Colombia",
    "Congo",
    "Egypt",
    "Ethiopia",
    "France",
    "Germany",
    "Ghana",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Italy",
    "Japan",
    "Kenya",
    "Madagascar",
    "Malaysia",
    "Mexico",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Nepal",
    "Nigeria",
    "Pakistan"
  ];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

   // final availablecategory = ref.watch(mealsProvider);
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
                        'assets/images/Group 50.png'),
                    maxRadius: 70,
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
                          'Sign in',
                          //textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        //------------  business Name ---------------------------------//

                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please Enter business name';
                            }
                            return null;
                          },
                          //controller: ,
                          keyboardType: TextInputType.name,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          decoration: InputDecoration(
                            hintText: 'Enter Business Name:',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            label: Text(
                              'Business Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            prefixIcon: Icon(
                              Icons.work_sharp,
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
                          height: 10,
                        ),
                        //------------  Country  ---------------------------------//
                        DropdownButtonFormField(

                          decoration: InputDecoration(
                            hintText: 'Choose Your Country',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            label: Text(
                              'Country',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                color:
                                Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.flag,
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
                          value: chooseItem,
                          onChanged: (newValue) {
                            setState(() {
                              chooseItem = newValue as String? ;
                            });
                          },
                          items: listitem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),

                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //------------  License no./Gst no.  ---------------------------------//
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please Enter License no./Gst no.';
                            }
                            return null;
                          },
                          //controller: ,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          decoration: InputDecoration(
                            hintText: 'Enter License no./Gst no.:',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            label: Text(
                              'License no./Gst no.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            prefixIcon: Icon(
                              Icons.insert_page_break_sharp,
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
                          height: 10,
                        ),
                        //------------  set user name.  ---------------------------------//
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please Enter User name';
                            }
                            return null;
                          },
                          //controller: ,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          decoration: InputDecoration(
                            hintText: 'Enter User Name:',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            label: Text(
                              'Set User Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            prefixIcon: Icon(
                              Icons.perm_identity_sharp,
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
                          height: 10,
                        ),
                        //------------  set PassWord  ---------------------------------//
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
                          // controller: passController,
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
                              'Set Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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

                        //
                        // SizedBox(
                        //   height: 20,
                        // ),

                        //------------  Login in goto  ---------------------------------//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have an Account?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return Login_screen();
                                      }));
                                },
                                child: Text(
                                  "Log IN ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //      // return category_page(availableMeals:availablecategory );
                            //     }));
                          },
                          child: Text(
                            'Sign In',
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
