import 'dart:io';
import 'package:business_bridge/screens/admin_ex_registration.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/exit.dart';

class admin_details extends StatefulWidget {
  @override
  State<admin_details> createState() => _admin_detailsState();
}

class _admin_detailsState extends State<admin_details> {

  // Add a GlobalKey to control the StreamBuilder
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();



//   List<Map<String, dynamic>> executivesData = []; // Your list of executive data
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize your executivesData list with data from Firestore
//     fetchDataFromFirestore();
//   }
// //deleting fuunctions...............................................
//   void fetchDataFromFirestore() async {
//     // Fetch data from Firestore and set it to executivesData
//     // Replace this with your actual Firestore data fetching logic
//     // For example:
//     final snapshot = await FirebaseFirestore.instance.collection('executive').get();
//     setState(() {
//       executivesData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//     });
//   }
//
//   Future<void> deleteExecutive(String executiveId) async {
//     try {
//       // Delete the record from Firebase Firestore
//       await FirebaseFirestore.instance.collection('executive').doc(executiveId).delete();
//
//       // TODO: Also delete the user from Firebase Authentication if needed
//
//       // Update the UI by removing the deleted item from executivesData
//       setState(() {
//         executivesData.removeWhere((executive) => executive['id'] == executiveId);
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Deleted executive"),
//         ),
//       );
//     } catch (error) {
//       print('Error deleting executive: $error');
//     }
//   }







  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        bool exitConfirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ExitConfirmationDialog(context: context);
          },
        );

        return exitConfirmed;
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/workportal/workportalbg2.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.saturation,
              ),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "Details",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: Tooltip(
                          message: 'Add Executive', // Tooltip text
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return admin_ex_registration();
                                  },
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Tooltip(
                          message: 'Logout', // Tooltip text
                          child: IconButton(
                            onPressed: () {
                              // Navigate to the Login_page when logout is pressed
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Login_page(); // Replace with your login page
                                  },
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.logout,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('executive').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final executivesData = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: executivesData.length,
                      itemBuilder: (context, index) {
                        final executiveData = executivesData[index].data() as Map<String, dynamic>;
                        final executiveId = executivesData[index].id;

                        return Dismissible(
                          key: Key(executiveId),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            bool deleteConfirmed = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Confirm Deletion"),
                                  content: Text("Do you want to delete ${executiveData['exname']}?"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop(true);
                                        // Delete the record from Firebase Firestore
                                        await FirebaseFirestore.instance
                                            .collection('executive')
                                            .doc(executiveId)
                                            .delete();

                                        // TODO: Delete the user from Firebase Authentication if needed

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("${executiveData['exname']} is deleted!"),
                                          ),
                                        );
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 3,
                              clipBehavior: Clip.hardEdge,
                              color: Colors.grey.withOpacity(0.35),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage(executiveData['img_url'] ?? ''),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name: ${executiveData['exname'] ?? 'N/A'}',
                                                  maxLines: 1, // Display in one line
                                                  overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),
                                                Text(
                                                  'EID: ${executiveData['exid'] ?? 'N/A'}',
                                                  maxLines: 1, // Display in one line
                                                  overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),
                                                Text(
                                                  'Country: ${executiveData['country'] ?? 'N/A'}',
                                                  maxLines: 1, // Display in one line
                                                  overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),
                                                Text(
                                                  'Email: ${executiveData['email'] ?? 'N/A'}',
                                                  maxLines: 1, // Display in one line
                                                  overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),

                                              ],
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

                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
