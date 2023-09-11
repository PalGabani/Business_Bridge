// import 'package:business_bridge/screens/edit_profile_page.dart';
// import 'package:business_bridge/screens/login_page_user.dart';
// import 'package:business_bridge/screens/profile_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../utils/utility.dart';
//
// class profile_page_user extends StatefulWidget {
//   @override
//   State<profile_page_user> createState() => _profile_page_userState();
// }
//
// class _profile_page_userState extends State<profile_page_user> {
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late User _user; // To store the current user
//
//   @override
//   void initState() {
//     super.initState();
//     _user = _auth.currentUser!;
//     // Get the current user
//   }
// // Function to delete user data
//
//   Future<void> deleteUserAccount(BuildContext context) async {
//     final user = FirebaseAuth.instance.currentUser;
//     final CollectionReference usersCollection =
//     FirebaseFirestore.instance.collection('users');
//
//     if (user != null) {
//
//       try {
//
//         // Delete data in Firestore
//         await usersCollection.doc(user.uid).delete();
//
//         // Delete the user account in Firebase Authentication
//         await user.delete();
//
//         // Show a toast message or navigate to the login page
//         Utiles().toastmessege("Account Deleted!");
//
//
//         ///_user = _auth.
//       } catch (error) {
//         // Handle errors
//         Utiles().toastmessege("Error Fetch on Deleting Account!");
//         print('Error deleting user data: $error');
//       }
//     } else {
//
//       print('User is null');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Container(
//           width: double.infinity,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text("Profile"),
//               // TextButton(
//               //   child: Text('Delete'),
//               //   onPressed: () {
//               //     // Call the function to delete the user's account and data
//               //     Navigator.of(context).pushReplacement(MaterialPageRoute(
//               //       builder: (context) => Login_page(),
//               //     ));
//               //   },
//               // ),
//
//             ],
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/drawer.png"), // Replace with your image path
//                   fit: BoxFit.fill, // You can choose the BoxFit that suits your design
//                 ),
//               ),
//               // child: Padding(
//               //   padding: const EdgeInsets.fromLTRB(25.0,25,0,0),
//               //   child: Text(
//               //     'Menu',
//               //     style: TextStyle(
//               //       color: Colors.blueGrey,
//               //       fontSize: 24,
//               //     ),
//               //   ),
//               // ),
//             ),
//
//             ListTile(
//               title: Text('Profile'),
//               enableFeedback: true,
//               splashColor: Colors.grey,
//               enabled: true,
//               focusColor: Colors.blueGrey,
//
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => profile_page(),
//                   ),
//                 );
//               },
//             ),
//             Divider(height: 3,thickness: 2,),
//             ListTile(
//               title: Text('Edit Profile'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => edit_profile_page(),
//                   ),
//                 );
//               },
//             ),
//             Divider(height: 3,thickness: 2,),
//             ListTile(
//               title: Text('Delete Account'),
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Delete Account'),
//                       content: Text('Are you sure you want to delete your account?'),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text('Cancel'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         TextButton(
//                           child: Text('Delete'),
//                           onPressed: () {
//                             // Call the function to delete the user's account and data
//                             deleteUserAccount(context);
//
//                             // Close the dialog
//                             Navigator.of(context).pop();
//                             Navigator.of(context).push(MaterialPageRoute(builder: (context){
//                               return Login_page();
//                             }));
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//             Divider(height: 3,thickness: 2,),
//             ListTile(
//               title: Text('Logout'),
//               onTap: () async {
//                 try {
//                   // Update the Firestore document to set the loggedIn field to false
//                   final user = FirebaseAuth.instance.currentUser;
//                   if (user != null) {
//                     final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
//                     await userRef.update({'loggedIn': false});
//                   }
//
//                   await FirebaseAuth.instance.signOut(); // Sign the user out
//
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Login_page(),
//                     ),
//                   );
//                 } catch (e) {
//                   print('Error logging out: $e');
//                 }
//               },
//             ),
//
//           ],
//         ),
//       ),
//       body: Container(
//         height: 700,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               children: [
//                 StreamBuilder<DocumentSnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(_user?.uid) // Use the UID of the current user
//                       .snapshots(),
//                   builder: (context, snapshot) {
//
//                     if (_user == null) {
//                       // If the user is null, navigate to the login page
//                       WidgetsBinding.instance.addPostFrameCallback((_) {
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => Login_page(),
//                         ));
//                       });
//                       return CircularProgressIndicator();
//                     }
//
//                     if (!snapshot.hasData) {
//                       return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
//                     }
//
//                     if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     }
//
//                     final userData = snapshot.data?.data() as Map<String, dynamic>?;
//
//                     if (userData == null) {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => Login_page(),
//                       //   ),
//                       // );
//                       // Handle the case where the document doesn't exist or is null
//                       return Center(
//                           child: Column(
//                         children: [
//                           Text('User data not found! Login Again ,Goto Login'),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => Login_page()),
//                               );
//                             },
//                             child: Text('Go to HomePage'),
//                           ),
//                         ],
//                       ));
//
//
//                     }
//
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.blueGrey.withOpacity(0.5),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 15,right: 15),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 radius: 50, // Adjust the radius as needed
//                                 backgroundColor: Colors.grey, // Background color if the image is not loaded
//                                 backgroundImage: NetworkImage(userData['image']),
//                               ),
//
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Business Name : ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Text(
//                                     userData['bname'] ?? 'N/A',
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Sector Name : ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Text(
//                                     userData['sector'] ?? 'N/A',
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "User Name : ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Text(
//                                     userData['username'] ?? 'N/A',
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Contact no : ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Text(
//                                     userData['contact'] ?? 'N/A',
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Email Id: ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Text(
//                                     userData['email'] ?? 'N/A',
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Country : ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Text(
//                                     userData['country'] ?? 'N/A',
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "License No/Gst no: ",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   Text(
//                                     userData['license'] ?? 'N/A',
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 ],
//                               ),
//
//                               // Add similar rows for other user data here
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
