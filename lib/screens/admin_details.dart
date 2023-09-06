import 'dart:io';
import 'package:business_bridge/screens/admin_ex_registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class admin_details extends StatefulWidget {
  @override
  State<admin_details> createState() => _admin_detailsState();
}

class _admin_detailsState extends State<admin_details> {



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(

          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/workportal/workportalbg2.png',
                ),
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
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Details",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
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
                                size: 40,
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
                  margin: EdgeInsets.only(top: 100), // Adjust the margin as needed

                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('executive').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator()); // Loading indicator
                      }

                      // Extract the list of executive data
                      final executivesData = snapshot.data!.docs;

                      return ListView.builder(
                        itemCount: executivesData!.length,
                        itemBuilder: (context, index) {
                          final executiveData = executivesData[index].data() as Map<String, dynamic>;
                          final executiveId = executivesData[index].id; // Get the document ID

                          return Dismissible(
                            key: Key(executiveId), // Use the document ID as the unique key
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) async {
                              // Show a confirmation dialog
                              bool deleteConfirmed = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Confirm Deletion"),
                                    content: Text("Do you want to delete ${executiveData['exname']}?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false); // Cancel the deletion
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true); // Confirm the deletion
                                        },
                                        child: Text("Delete"),
                                      ),
                                    ],
                                  );
                                },
                              );

                              // If the user confirmed deletion, proceed to delete the record
                              if (deleteConfirmed) {
                                // Delete the record from Firebase Firestore
                                await FirebaseFirestore.instance
                                    .collection('executive')
                                    .doc(executiveId) // Use the document ID for deletion
                                    .delete();

                                // TODO: Also delete the user from Firebase Authentication if needed

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Deleted ${executiveData['exname']}"),
                                  ),
                                );
                              }
                            },
                            background: Container(
                              color: Colors.red, // Background color when swiped
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
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name: ${executiveData['exname'] ?? 'N/A'}',
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),
                                                Text(
                                                  'EID: ${executiveData['exid'] ?? 'N/A'}',
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),
                                                Text(
                                                  'Country: ${executiveData['country'] ?? 'N/A'}',
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),
                                                Text(
                                                  'Email: ${executiveData['email'] ?? 'N/A'}',
                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                ),
                                              ],
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
