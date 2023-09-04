import 'dart:io';
import 'package:business_bridge/screens/profile_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
          File imgg=doc['image'];
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
      "image":img.toString() ,
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
  //final firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('users');


  Future<String> uploadImageToFirestore(File imageFile) async {
    try {
       firebase_storage.Reference ref = FirebaseStorage.instance.ref('/profile_images/');
      firebase_storage.UploadTask uploadtask=ref.putFile(_imageFile!.absolute);
      await Future.value(uploadtask);
      var newurl=await ref.getDownloadURL();

      img=newurl;

       print('Image uploaded and URL set in Firestore: $newurl');

      return newurl;
    } catch (e) {
      print('Error uploading image: $e');
      print(e);
      return "null";
    }
  }

  File? _imageFile;
final picker=ImagePicker();
  // Function to open the image picker dialog
  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage!.path);
        print("PAth"+pickedImage.path);

        uploadImageToFirestore(_imageFile!);
      } else {
        print('No image selected.');
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Edit profile"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
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
                          child: _imageFile != null
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
                        )
                        ,
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
                  style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
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
                  style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 20),
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
                  height: 30,
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
                        Navigator.pop(context);
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
    );
  }
}
