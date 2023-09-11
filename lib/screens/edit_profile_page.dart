import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class edit_profile_page extends StatefulWidget {


  @override
  State<edit_profile_page> createState() => _edit_profile_pageState();
}

class _edit_profile_pageState extends State<edit_profile_page> {
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
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController uemailController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController businessIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController licenseNoController = TextEditingController();

late User _user;
  bool _isLoadingImage = false;

  FirebaseAuth _auth=FirebaseAuth.instance;
  // Fetch data from Firestore when the page is initialized
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    fetchDataFromFirestore();
  }

  // Function to fetch data from Firestore
  void fetchDataFromFirestore() {
    // Replace 'yourFirestoreCollection' with your actual Firestore collection name
    FirebaseFirestore.instance
        .collection('users')
        .doc(_user.uid)
        .get()
        .then((doc) {
      if (doc.exists) {
        setState(() {
          // Populate the form fields with data from Firestore
          businessNameController.text = doc['bname'];
          uemailController.text = doc['email'];
          contactNoController.text = doc['contact'];
         // businessIdController.text = doc['businessId'];
          userNameController.text = doc['username'];
          licenseNoController.text = doc['license'];
          chooseItem = doc['country'];
          img=doc['image'];
        });
      }
    }).catchError((error) {
      // Handle errors if any
      print(error);
    });
  }


var img;
  // Function to update data in Firestore
  void updateDataInFirestore() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_user.uid)
        .update({
      //"id":fuid.toString().trim(),
     // "image":img.toString() ,
      "bname":businessNameController.text.trim(),
      "email":uemailController.text.trim(),
      "contact": contactNoController.text.trim(),
      "country":chooseItem,
      "license":licenseNoController.text.trim(),
      "username":userNameController.text.trim(),

    //  "password":passwordController.text.trim(),
    }).then((_) {
      // Data updated successfully
    }).catchError((error) {
      // Handle errors if any
      print(error);
    });
  }

firebase_storage.FirebaseStorage  storage=firebase_storage.FirebaseStorage.instance;




  File? _imageFile;
  final picker=ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      // Image loading is done
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
        print("Path: ${pickedImage.path}");
         uploadAndSetImage(_imageFile!.absolute);
      } else {
        print('No image selected.');
      }
    });
  }






  Future<void> uploadAndSetImage(File imageFile) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // Generate a unique name for the image
        String uniqueName =
            "${DateTime.now().millisecondsSinceEpoch}_${user.uid}";

        // Upload the image to Firebase Storage
        firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('img_profile/$uniqueName');
        await ref.putFile(imageFile);

        // Get the download URL of the uploaded image
        String imageUrl = await ref.getDownloadURL();

        // Update the user's document in Firestore with the image URL
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          "image": imageUrl,
        });

        print('Image uploaded and URL set in Firestore: $imageUrl');
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }




// ...

  // Future<void> _pickImage() async {
  //   final imagePicker = ImagePicker();
  //   final galleryImage = await imagePicker.pickImage(source: ImageSource.gallery);
  //   final cameraImage = await imagePicker.pickImage(source: ImageSource.camera);
  //
  //   setState(() async {
  //     if (galleryImage != null || cameraImage != null) {
  //       if (galleryImage != null) {
  //         _imageFile = File(galleryImage.path);
  //         print("Gallery Image Path: ${galleryImage.path}");
  //       } else {
  //         _imageFile = File(cameraImage!.path);
  //         print("Camera Image Path: ${cameraImage?.path}");
  //       }
  //
  //       await uploadAndSetImage(_imageFile!.absolute);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        scrolledUnderElevation: 0,

        backgroundColor: Colors.grey.withOpacity(0.5),
        title: Text("Edit profile"),
      ),

      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 0),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                border: Border.all(width: 2, color: Colors.grey),
                              ),
                              child: _isLoadingImage
                                  ? CircularProgressIndicator()
                                  : _imageFile != null
                                  ? ClipOval(
                                child: Image.file(
                                  _imageFile!.absolute,
                                  width: 100, // Adjust the width and height as needed
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                                  : Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  onPressed: _pickImage,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextButton(
                              onPressed: _pickImage,
                              child: Text('Add Image'),
                            ),
                          ],
                        ),
                      ),
                    ),



                    // ------------------------ business name ----------------------
                    Text(
                      "Business Name : ",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff232855).withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(2, 3),
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
                        controller:businessNameController ,
                        keyboardType: TextInputType.name,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration(
                          hintText: 'Enter Business Name:',
                          hintStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                          // label: Text(
                          //   'Business Name',
                          //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          //         color: Theme.of(context).colorScheme.secondary,
                          //       ),
                          // ),
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
                      height: 10,
                    ),

                    // ------------------------ email ------------------------
                    Text(
                      "Email id : ",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
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
                        controller: uemailController,
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
                          // label: Text(
                          //   'Email',
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .titleMedium!
                          //       .copyWith(
                          //     color: Theme.of(context)
                          //         .colorScheme
                          //         .secondary,
                          //   ),
                          // ),
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

                    // ------------------------ contact no ---------------------------
                    Text(
                      "Contact no : ",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
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
                            return 'Enter contact no.';
                          }
                          return null;
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
                          // label: Text(
                          //   'Contact no',
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .titleMedium!
                          //       .copyWith(
                          //     color: Theme.of(context)
                          //         .colorScheme
                          //         .secondary,
                          //   ),
                          // ),
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
                      height: 10,
                    ),

                    Text(
                      "User Name : ",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff232855).withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(2, 3),
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
                        controller:userNameController ,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration(
                          hintText: 'Enter User Name:',
                          hintStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                          // label: Text(
                          //   'Set User Name',
                          //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          //         color: Theme.of(context).colorScheme.secondary,
                          //       ),
                          // ),
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
                      height: 10,
                    ),

                    // ------------------------ licence no--------------------------
                    Text(
                      "Licence no. : ",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff232855).withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(2, 3),
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
                        controller:licenseNoController ,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration(
                          hintText: 'Enter License no./Gst no.:',
                          hintStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                          // label: Text(
                          //   'License no./Gst no.',
                          //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          //         color: Theme.of(context).colorScheme.secondary,
                          //       ),
                          // ),
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
                      height: 10,
                    ),

                    // ------------------------ country ----------------------------
                    Text(
                      "Country : ",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff232855).withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: 'Choose Your Country',
                          hintStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                          // label: Text(
                          //   'Country',
                          //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          //         color: Theme.of(context).colorScheme.secondary,
                          //       ),
                          // ),
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

                    // -------------------- submit -------------------------
                    // Submit button to update data in Firestore
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            updateDataInFirestore();
                           // uploadImageToFirestore(img);
                            Navigator.pop(context);
                           // Navigator.popUntil(context, ModalRoute.withName('profile_page'));
                          }
                        },
                        child: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
