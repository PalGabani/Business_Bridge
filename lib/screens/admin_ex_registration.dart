import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utility.dart';
import 'admin_details.dart';

class admin_ex_registration extends StatefulWidget {
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
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('executive');
  FirebaseAuth _auth = FirebaseAuth.instance;

  File? _imageFile;
  final picker = ImagePicker();
  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      // Image loading is done
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
        print("Path: ${pickedImage.path}");
      } else {
        print('No image selected.');
      }
    });
  }

  Future<String> _uploadImageToFirebaseStorage(File imageFile) async {
    try {
      // Initialize Firebase
      await Firebase.initializeApp();

      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('ex_img')
          .child(
              'executive_image_${DateTime.now().millisecondsSinceEpoch}.jpg');

      final UploadTask uploadTask = storageReference.putFile(imageFile);

      final TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => null);

      final String imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Call Registration function here or set imageUrl to any variable you need

      return imageUrl;
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      // Handle the error appropriately
      throw error;
    }
  }

  Future<void> Registration(String imageUrl) async {
    setState(() {
      loading = true;
    });

    try {
      final executiveCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passController.text.toString(),
      );

      final euid = FirebaseFirestore.instance
          .collection('executive')
          .doc(executiveCredential.user!.uid);

      await fireStore.doc(executiveCredential.user!.uid).set({
        "id": euid,
        "img_url": imageUrl, // Set the image URL
        "exid": exidController.text.trim(),
        "exname": exnameController.text.trim(),
        "password": passController.text.trim(),
        "country": chooseItem.toString().trim(),
        "email": emailController.text.trim(),
        "contact": contactController.text.trim(),
        // "eid":euid,
      });

      Navigator.push(context, MaterialPageRoute(builder: (contex) {
        return admin_details();
      }));

      Utiles().toastmessege("Registration Successful");
    } catch (error) {
      print('Error during registration: $error');
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
        iconTheme: IconThemeData(color: Colors.white),
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
                    height: 150,
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
                          padding: EdgeInsets.fromLTRB(
                              30, 20, 30, keyBoardSpace + 20),
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [

//-------------------------------Image picker ------------------------------------//
                                      Material(
                                        elevation: 4, // Add elevation for the shadow effect
                                        shape: CircleBorder(), // Make it round
                                        clipBehavior: Clip.antiAlias, // Clip to circle
                                        child: InkWell(
                                          onTap: _pickImage,
                                          borderRadius: BorderRadius.circular(50), // Make it round
                                          child: Container(
                                            width: 90, // Adjust size as needed
                                            height: 90, // Adjust size as needed
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle, // Make it round
                                              color: Colors.grey[200], // Background color
                                              border: Border.all(
                                                color: Colors.black.withOpacity(0.5), // Border color
                                                width: 1, // Border width
                                              ),
                                            ),
                                            child: _imageFile == null
                                                ? Icon(
                                              Icons.add_a_photo_outlined,
                                              size: 30,
                                              color: Colors.grey,
                                            )
                                                : ClipOval(
                                              child: Image.file(
                                                _imageFile!,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),


                                      Text(
                                        'Add Image',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.grey),
                                      ),
                                      //------------  business Name ---------------------------------//
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        //height: 60,
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
                                              return 'Please set executive id';
                                            }
                                            return null;
                                          },
                                          controller: exidController,
                                          keyboardType: TextInputType.name,
                                          cursorColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          decoration: InputDecoration(

                                            hintText: 'Enter Executive id :',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                            label: Text(
                                              'Executive id',
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
                                        height: 10,
                                      ),

                                      //------------  set user name.  ---------------------------------//
                                      Container(
                                        //height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),

                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff232855).withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 8,
                                              offset: Offset(2, 7),
                                            ),
                                          ],
                                        ),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Executive name';
                                            }
                                            // Use a regular expression to check if the name contains only letters
                                            final RegExp nameRegExp = RegExp(r'^[A-Za-z ]+$');
                                            if (!nameRegExp.hasMatch(value)) {
                                              return 'Name should contain only letters';
                                            }
                                            return null;
                                          },
                                          controller: exnameController,
                                          keyboardType: TextInputType.name,
                                          cursorColor: Theme.of(context).colorScheme.secondary,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Executive Name:',
                                            hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            label: Text(
                                              'Executive Name',
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.person,
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
                                        height: 10,
                                      ),


                                      //-----------------------  Email.  ---------------------------------//
                                      Container(
                                        //height: 60,
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
                                              return 'Please Enter Executive E-mail';
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
                                            hintText:
                                            'Enter Executive Email ID:',
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
                                        height: 10,
                                      ),

                                      //------------  set PassWord  ---------------------------------//
                                      Container(
                                        //height: 60,
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
                                              Icons.lock,
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


                                      SizedBox(
                                        height: 10,
                                      ),

                                      // ---------------------- contact no -----------------------
                                      Container(
                                        //height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff232855).withOpacity(0.3),
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
                                            // Check if the phone number is exactly 10 digits long
                                            if (value.length != 10) {
                                              return 'Phone number should be 10 digits long';
                                            }
                                            return null;
                                          },
                                          controller: contactController,
                                          keyboardType: TextInputType.phone,
                                          cursorColor: Theme.of(context).colorScheme.secondary,
                                          maxLength: 10, // Set the maximum length to 10
                                          decoration: InputDecoration(
                                            hintText: 'Enter Executive\'s Contact no :',
                                            hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                            label: Text(
                                              'Contact no',
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.phone,
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
                                        height: 10,
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
                                            hintText: 'Choose Country',
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
                                              chooseItem = newValue as String?;
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
                                        height: 20,
                                      ),

                                      // ----------------------- submit ---------------------
                                      GestureDetector(
                                        onTap: () async {
                                          if (formkey.currentState!.validate()) {
                                            // Set loading to true immediately when the button is tapped
                                            setState(() {
                                              loading = true;
                                            });

                                            try {
                                              if (_imageFile != null) {
                                                final imageUrl = await _uploadImageToFirebaseStorage(_imageFile!);
                                                await Registration(imageUrl);
                                              } else {
                                                Utiles().toastmessege("No image selected.");
                                              }
                                            } catch (error) {
                                              // Handle any errors here
                                              print('Error during registration: $error');
                                              Utiles().toastmessege("Registration failed");
                                            } finally {
                                              // Set loading back to false when the asynchronous operations are complete
                                              setState(() {
                                                loading = false;
                                              });
                                            }
                                          }
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Color(0xff9DB2BF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xff232855).withOpacity(0.3),
                                                    spreadRadius: 1,
                                                    blurRadius: 8,
                                                    offset: Offset(2, 7),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Register',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (loading)
                                              Positioned.fill(
                                                child: Container(
                                                  color: Colors.white.withOpacity(0.5),
                                                  child: Center(
                                                    child: CircularProgressIndicator(
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
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
