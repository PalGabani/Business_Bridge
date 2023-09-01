import 'package:business_bridge/screens/edit_profile_page.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile_page extends StatefulWidget {
  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user; // To store the current user

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!; // Get the current user
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Profile"),
              SizedBox(
                //width: 100,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => edit_profile_page(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    elevation: MaterialStatePropertyAll(5)),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              //logout button......................................
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login_page(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    elevation: MaterialStatePropertyAll(5)),
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       width: 120,
              //       height: 120,
              //       decoration: BoxDecoration(
              //           color: Colors.grey,
              //           borderRadius: BorderRadius.circular(60)),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 40,
              // ),
              // Row(
              //   children: [
              //     Text(
              //     //  DocumentSnapshot.
              //       "Business Name : ",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Text(
              //       "data",
              //       style: TextStyle(fontSize: 20),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "Business id : ",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Text(
              //       "data",
              //       style: TextStyle(fontSize: 20),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "User name : ",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Text(
              //       "data",
              //       style: TextStyle(fontSize: 20),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "Email : ",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Wrap(
              //       children: [
              //         Text(
              //           "data",
              //           style: TextStyle(fontSize: 20),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "Contact no : ",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Wrap(
              //       children: [
              //         Text(
              //           "data",
              //           style: TextStyle(fontSize: 20),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "License no. : ",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Text(
              //       "data",
              //       style: TextStyle(fontSize: 20),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "Country : ",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Text(
              //       "data",
              //       style: TextStyle(fontSize: 20),
              //     )
              //   ],
              // ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(_user.uid) // Use the UID of the current user
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final userData = snapshot.data!.data() as Map<String, dynamic>;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Business Name : ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  userData['bname'] ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "User Name : ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  userData['username'] ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Contact no : ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  userData['contact'] ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Email Id: ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  userData['email'] ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Country : ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  userData['country'] ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "License No/Gst no: ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  userData['license'] ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),



                            // Add similar rows for other user data here
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
