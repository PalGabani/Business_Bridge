import 'package:business_bridge/screens/edit_profile_page.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utility.dart';

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
    _user = _auth.currentUser!;
    // Get the current user
  }
// Function to delete user data
  Future<void> deleteUserAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    if (user != null) {
      try {
        // Delete data in Firestore


        // Delete the user account in Firebase Authentication

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login_page(),
        ));
        await usersCollection.doc(user.uid).delete();
        await user.delete();
        Utiles().toastmessege("Account Deleted!");
      } catch (error) {
        Utiles().toastmessege("Error Fetch on Deleting Account!");
        // Handle errors, such as insufficient permissions or network issues
        print('Error deleting user data: $error');
      }
    }
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
              // TextButton(
              //   child: Text('Delete'),
              //   onPressed: () {
              //     // Call the function to delete the user's account and data
              //     Navigator.of(context).pushReplacement(MaterialPageRoute(
              //       builder: (context) => Login_page(),
              //     ));
              //   },
              // ),
              SizedBox(
                //width: 100,
              ),

            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer.png"), // Replace with your image path
                  fit: BoxFit.fill, // You can choose the BoxFit that suits your design
                ),
              ),
              // child: Padding(
              //   padding: const EdgeInsets.fromLTRB(25.0,25,0,0),
              //   child: Text(
              //     'Menu',
              //     style: TextStyle(
              //       color: Colors.blueGrey,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
            ),

            ListTile(
              title: Text('Profile'),
              enableFeedback: true,
              splashColor: Colors.cyanAccent,
              enabled: true,
              focusColor: Colors.teal,

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profile_page(),
                  ),
                );
              },
            ),
            Divider(height: 3,thickness: 2,),
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => edit_profile_page(),
                  ),
                );
              },
            ),
            Divider(height: 3,thickness: 2,),
            ListTile(
              title: Text('Delete Account'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Account'),
                      content: Text('Are you sure you want to delete your account?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Delete'),
                          onPressed: () {
                            // Call the function to delete the user's account and data
                            deleteUserAccount();

                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(height: 3,thickness: 2,),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                try {
                  // Update the Firestore document to set the loggedIn field to false
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
                    await userRef.update({'loggedIn': false});
                  }

                  await FirebaseAuth.instance.signOut(); // Sign the user out

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login_page(),
                    ),
                  );
                } catch (e) {
                  print('Error logging out: $e');
                }
              },
            ),

          ],
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
