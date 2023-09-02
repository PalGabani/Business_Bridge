import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utility.dart';
import 'admin_details.dart';

class admin_ex_registration extends StatefulWidget{
  @override
  State<admin_ex_registration> createState() => _admin_ex_registrationState();
}

class _admin_ex_registrationState extends State<admin_ex_registration> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obsecureText = true;
  TextEditingController exidController = new TextEditingController();
  TextEditingController exnameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController contactController = new TextEditingController();


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
    " 🇳🇿 New Zealand"
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



  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('executive');


  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Registration() async {
    setState(() {
      loading = true;
    });

    try {
      final executiveCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passController.text.toString(),
      );

      // User has been successfully created here, and you can access userCredential.user
      final euid = FirebaseFirestore.instance
          .collection('executive')
          .doc(executiveCredential.user!.uid);
      // Store user data in Firestore
      await fireStore.doc(executiveCredential.user!.uid).set({
        "id": euid.toString().trim(),
        "image": "",
        "exid":exidController.text.trim(),
        "exname":exnameController.text.trim(),
        "password":passController.text.trim(),
        "country":chooseItem.toString().trim(),
        "email":emailController.text.trim(),
        "contact":contactController.text.trim(),

      });
      Navigator.push(context, MaterialPageRoute(builder: (contex){return admin_details();}));
      // Handle successful sign up here
      Utiles().toastmessege("Registration Sucessful");


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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
              child: Column(
                children: [

                  //---------------------------- uper part--------------------------------------//
                  Container(
                    //color: Colors.brown,
                    color: Colors.transparent,
                    height: 190,
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
                                  "Executive Registration",
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

                  //------------------------------ main part-----------------------------//
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
                              padding: EdgeInsets.fromLTRB(30, 30, 30, keyBoardSpace + 20),
                              child: Form(
                                key:  formkey,
                                child: Column(
                                  children: [
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
                                                  return 'please set executive id';
                                                }
                                                return null;
                                              },
                                              controller:exidController ,
                                              keyboardType: TextInputType.name,
                                              cursorColor: Theme.of(context).colorScheme.secondary,
                                              decoration: InputDecoration(
                                                hintText: 'Enter Executive id :',
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                  color: Theme.of(context).colorScheme.secondary,
                                                ),
                                                label: Text(
                                                  'Executive id',
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
                                                  return 'please Enter Executive name';
                                                }
                                                return null;
                                              },
                                              controller:exnameController ,
                                              keyboardType: TextInputType.emailAddress,
                                              cursorColor: Theme.of(context).colorScheme.secondary,
                                              decoration: InputDecoration(
                                                hintText: 'Enter Executive Name:',
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                  color: Theme.of(context).colorScheme.secondary,
                                                ),
                                                label: Text(
                                                  'Executive Name',
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
                                               controller: passController,
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
                                                hintText: 'Choose Country',
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
                                          //-----------------------  Email.  ---------------------------------//
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
                                                  return 'please Enter Executive E-mail';
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
                                                hintText: 'Enter Executive Email ID:',
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
                                            height: 20,
                                          ),

                                          // ---------------------- contact no -----------------------
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
                                                  return 'Enter Executive contact no.';
                                                }
                                                return null;
                                              },
                                              controller: contactController,
                                              keyboardType: TextInputType.phone,
                                              cursorColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              decoration: InputDecoration(
                                                hintText: 'Enter Executive Contact no :',
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
                                            height: 20,
                                          ),

                                          // ----------------------- submit ---------------------
                                          GestureDetector(
                                            onTap: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                Registration();
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
                                                      'Registration',
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
                                            height: 20,
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
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}