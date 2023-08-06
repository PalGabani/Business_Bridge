import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:business_bridge/screens/sector_page.dart';
import 'package:business_bridge/screens/sign_in_screen.dart';
import 'package:business_bridge/widgets/pop_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signin_page extends StatefulWidget {
  @override
  State<Signin_page> createState() => _Signin_pageState();
}

class _Signin_pageState extends State<Signin_page> {

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  //-------------------uper part ---------------------------------------------------//
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
                         padding: const EdgeInsets.fromLTRB(10,10,10,0),
                         child: Container(
                           color: Colors.transparent,
                           height: 70,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               IconButton(onPressed: (){

                               },
                               icon:  Icon(Icons.arrow_back,color: Colors.white,),
                               ),
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
                                 "Registration",
                                 style: Theme.of(context)
                                     .textTheme
                                     .headlineLarge!
                                     .copyWith(
                                   color:
                                   Theme.of(context).colorScheme.onTertiary,
                                 ),
                               ),
                               Text(
                                 "\"Dream big, act bold, achieve more.\"",

                                 style: Theme.of(context)
                                     .textTheme
                                     .bodyLarge !
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
                  //--------------------------------main part--------------------------------------------//
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
                        child: Container(
                           child: Padding(
                            padding: EdgeInsets.fromLTRB(
                            30, 30, 30, keyBoardSpace + 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //  crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // ------------------login heading and Logo ---------------------//

                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      //------------  business Name ---------------------------------//

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
                                              return 'please Enter business name';
                                            }
                                            return null;
                                          },
                                          //controller: ,
                                          keyboardType: TextInputType.name,
                                          cursorColor: Theme.of(context).colorScheme.secondary,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Business Name:',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            label: Text(
                                              'Business Name',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                color:
                                                Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.work_sharp,
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      //------------  Country  ---------------------------------//
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
                                        child: DropdownButtonFormField(

                                          decoration: InputDecoration(
                                            hintText: 'Choose Your Country',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            label: Text(
                                              'Country',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                color:
                                                Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.flag,
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Theme.of(context).colorScheme.secondary,
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
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      //------------  License no./Gst no.  ---------------------------------//
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
                                              return 'please Enter License no./Gst no.';
                                            }
                                            return null;
                                          },
                                          //controller: ,
                                          keyboardType: TextInputType.emailAddress,
                                          cursorColor: Theme.of(context).colorScheme.secondary,
                                          decoration: InputDecoration(
                                            hintText: 'Enter License no./Gst no.:',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            label: Text(
                                              'License no./Gst no.',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                color:
                                                Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.insert_page_break_sharp,
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      //------------  set user name.  ---------------------------------//
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
                                              return 'please Enter User name';
                                            }
                                            return null;
                                          },
                                          //controller: ,
                                          keyboardType: TextInputType.emailAddress,
                                          cursorColor: Theme.of(context).colorScheme.secondary,
                                          decoration: InputDecoration(
                                            hintText: 'Enter User Name:',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            label: Text(
                                              'Set User Name',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                color:
                                                Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.perm_identity_sharp,
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),

                                      //------------  set PassWord  ---------------------------------//
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
                                          cursorColor: Theme.of(context).colorScheme.secondary,
                                          obscureText: _obsecureText,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Password:',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            label: Text(
                                              'Set Password',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                color:
                                                Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock_outline_sharp,
                                              color: Theme.of(context).colorScheme.secondary,
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
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),


                                      SizedBox(
                                        height: 25,
                                      ),

                                      //--------button-------///
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            //Navigator.pushanduntill
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return sector_page() ;
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
                                              'Sign UP',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      //------------  Login in goto  ---------------------------------//
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Already Have an Account?',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) {
                                                      return Login_page();
                                                    }));
                                              },
                                              child: Text(
                                                "Log IN ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff9DB2BF),

                                                  //decoration: TextDecoration.underline,
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
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
    );
  }
}
