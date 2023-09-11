import 'package:business_bridge/models/user_model.dart';
import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:business_bridge/screens/sector_page.dart';
import 'package:business_bridge/utils/utility.dart';

import 'package:business_bridge/widgets/pop_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signin_page extends StatefulWidget {
  Signin_page({
    required this.sector,
  });

  final String sector;

  @override
  State<Signin_page> createState() => _Signin_pageState(sector: sector);
}

class _Signin_pageState extends State<Signin_page> {
  _Signin_pageState({required this.sector,});
final String sector;

  String? chooseItem;
  List listitem = [
    " 🇦🇫  Afghanistan",
    " 🇩🇿  Algeria",
    " 🇦🇴  Angola",
    " 🇦🇷  Argentina",
    " 🇧🇩  Bangladesh",
    " 🇧🇷  Brazil",
    " 🇨🇦  Canada",
    " 🇨🇳  China",
    " 🇨🇴  Colombia",
    " 🇨🇬  Congo",
    " 🇪🇬  Egypt",
    " 🏴󠁧󠁢󠁥󠁮󠁧󠁿  England",
    " 🇪🇹 Ethiopia",
    " 🇫🇷 France",
    " 🇩🇪 Germany",
    " 🇬🇭 Ghana",
    " 🇮🇳 India",
    " 🇮🇩 Indonesia",
    " 🇮🇷 Iran",
    " 🇮🇶 Iraq",
    " 🇮🇹 Italy",
    " 🇯🇵 Japan",
    " 🇰🇪 Kenya",
    " 🇲🇬 Madagascar",
    " 🇲🇾 Malaysia",
    " 🇲🇽 Mexico",
    " 🇲🇦 Morocco",
    " 🇲🇿 Mozambique",
    " 🇲🇲 Myanmar",
    " 🇳🇵 Nepal",
    " 🇳🇿 New Zealand",
        " 🇳🇬 Nigeria",
    " 🇳🇴 Norway",
    " 🇵🇰 Pakistan",
    " 🇵🇭 Philippines",
    " 🇵🇹 Portugal",
    " 🇵🇱 Poland",
    " 🇷🇺 Russia",
    " 🇸🇦 Saudi Arabia",
    " 🏴󠁧󠁢󠁳󠁣󠁴󠁿 Scotland",
    " 🇸🇬 Singapore",
    " 🇿🇦 South Africa",
    " 🇪🇸 Spain",
    " 🇱🇰 Sri Lanka",
    " 🇸🇪 Sweden",
    " 🇸🇾 Syria",
    " 🇺🇦 Ukraine",
    " 🇦🇪 United Arab Emirates",
    " 🇬🇧 United Kingdom",
    " 🇺🇸 United States",
    " 🇻🇳 Vietnam",
    " 🇿🇲 Zambia",
    " 🇿🇼 Zimbabwe",
  ];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obsecureText = true;
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('users');

  final TextEditingController idController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController licenseNoController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Signup() async {
    setState(() {
      loading = true;
    });

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );

      // User has been successfully created here, and you can access userCredential.user
      final fuid = FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid);
      // Store user data in Firestore
      await fireStore.doc(userCredential.user!.uid).set({
        "id": fuid.toString().trim(),
        "image": "",
        "bname": businessNameController.text.trim(),
        "sector":sector.toString().trim(),
        "email": emailController.text.trim(),
        "contact": contactNoController.text.trim(),
        "country": chooseItem,
        "license": licenseNoController.text.trim(),
        "username": userNameController.text.trim(),
        "password": passwordController.text.trim(),
      });
Navigator.push(context, MaterialPageRoute(builder: (contex){return Login_page();}));
      // Handle successful sign up here
      Utiles().toastmessege("Sign up sucessful");


    } catch (error) {
      // Handle errors here
      Utiles().toastmessege("Email Already Used!");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

    // final _db = FirebaseFirestore.instance;
    //
    // createUser(UserModel user) async {
    //   await _db.collection("users").add(user.toJson());
    // }

    // final UserModel user = UserModel(
    //   id: " ",
    //   BusinessName: businessNameController.text.trim(),
    //   email: emailController.text.trim(),
    //   contact_no: contactNoController.text.trim(),
    //
    //   // country: chooseItem,
    //   license_no: licenseNoController.text.trim(),
    //   userName: userNameController.text.trim(),
    //   password: passwordController.text.trim(),
    // );
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
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Container(
                            color: Colors.transparent,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                ),
                                Text(
                                  "\"Dream big, act bold, achieve more.\"",
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
                            child: Form(
                              key: formkey,
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
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'please Enter business name';
                                              }
                                              return null;
                                            },
                                            controller: businessNameController,
                                            keyboardType: TextInputType.name,
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Business Name:',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                              label: Text(
                                                'Business Name',
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
                                                Icons.work_sharp,
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
                                          height: 15,
                                        ),

                                        // ----------------- email ---------------------------//
                                        Container(
                                          height: 60,
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
                                          height: 15,
                                        ),

                                        // ------------------- contact no ----------------------//
                                        Container(
                                          height: 60,
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
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Enter contact no.';
                                              } else if (value.length != 10) {
                                                return 'Contact no. must be 10 characters long.';
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: contactNoController,
                                            keyboardType: TextInputType.phone,
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Contact no :',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                              label: Text(
                                                'Contact no',
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
                                                Icons.phone,
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
                                          height: 15,
                                        ),

                                        //------------  Country  ---------------------------------//
                                        Container(
                                          height: 60,
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
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Choose Your Country',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                              label: Text(
                                                'Country',
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
                                                Icons.flag,
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
                                            value: chooseItem,
                                            onChanged: (newValue) {
                                              setState(() {
                                                chooseItem =
                                                    newValue as String?;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select an item';
                                              }
                                              return null;
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
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'please Enter License no./Gst no.';
                                              }
                                              return null;
                                            },
                                            //controller: ,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            controller: licenseNoController,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Enter License no./Gst no.:',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                              label: Text(
                                                'License no./Gst no.',
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
                                                Icons.insert_page_break_sharp,
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
                                          height: 15,
                                        ),
                                        //------------  set user name.  ---------------------------------//
                                        Container(
                                          height: 60,
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
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'please Enter User name';
                                              }
                                              return null;
                                            },
                                            controller: userNameController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            decoration: InputDecoration(
                                              hintText: 'Enter User Name:',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                              label: Text(
                                                'Set User Name',
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
                                                Icons.perm_identity_sharp,
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
                                          height: 15,
                                        ),

                                        //------------  set PassWord  ---------------------------------//
                                        Container(
                                          height: 60,
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
                                            controller: passwordController,
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
                                                'Set Password',
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
                                        ),

                                        SizedBox(
                                          height: 25,
                                        ),

                                        //--------button-------///
                                        GestureDetector(
                                          onTap: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              Signup();
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
                                                    'Sign UP',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (loading)
                                                Positioned.fill(
                                                  child: Container(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 40,
                                        ),
                                        //------------  Login in goto  ---------------------------------//
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Already Have an Account?',
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
