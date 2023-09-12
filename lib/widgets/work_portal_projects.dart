import 'package:business_bridge/data/dummy_data.dart';
import 'package:business_bridge/models/assign_page_projects.dart';
import 'package:business_bridge/widgets/work_portal_stepper_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:transparent_image/transparent_image.dart';

import '../models/case_study.dart';
import '../screens/assign_project_page.dart';

class workProject extends ConsumerStatefulWidget {
  const workProject({
    super.key,
    required this.onSelectA_project,
    required this.asp,
    // required this.pd
  });

  final AssignedProject asp;

//  final ProjectDetail pd;

  // final Services sr;
  final void Function(AssignedProject apd) onSelectA_project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _workProjectState(
      ap: asp,
      onSelectA_projects: onSelectA_project,
    );
  }
}

class _workProjectState extends ConsumerState<workProject> {
  _workProjectState({
    required this.ap,
    // required this.pd,
    required this.onSelectA_projects,
  });

  final user = FirebaseAuth.instance.currentUser;
  final AssignedProject ap;

//  final ProjectDetail pd;
  final void Function(AssignedProject apd) onSelectA_projects;




  @override
  Widget build(BuildContext context) {
    // final d = ref.watch(servicesProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 00, 0),
      child: InkWell(
          onTap: () {
            onSelectA_projects(ap);
          },
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('executive')
                .doc(
                'IZTd3cPjOkfEHFwyts3USXwhXlu2')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final executiveData =
              snapshot.data?.data() as Map<String, dynamic>?;

              if (executiveData == null) {
                return Text('Executive data not found!');
              }

              final List<dynamic>? executiveServices =
              executiveData['services'] as List<dynamic>?;

              if (executiveServices == null || executiveServices.isEmpty) {
                return Text('No assigned projects.');
              }

              return Column(
                children: executiveServices.map((services) {
                  final String userUid = services['useruid'] ?? '';

                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(userUid)
                        .get(),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (userSnapshot.hasError) {
                        return Text(
                            'Error fetching user data: ${userSnapshot.error}');
                      }

                      final userData =
                      userSnapshot.data?.data() as Map<String, dynamic>?;

                      if (userData == null) {
                        return Text('User data not found!');
                      }

                      final String country = userData['country'] ?? 'N/A';
                      final String contact = userData['contact'] ?? 'N/A';
                      final String email = userData['email'] ?? 'N/A';
                      final String companyname = userData['bname'] ?? 'N/A';

                      return Dismissible(
                        key: Key(userUid), // Unique key for each item
                        onDismissed: (direction) async {
                          // Handle the item dismissal here, e.g., delete it
                          try {
                            // Delete the service from Firestore using userUid or any other identifier
                            await FirebaseFirestore.instance
                                .collection('executive')
                                .doc(services)
                                .delete();

                            // Remove the service from the local list
                            setState(() {
                              executiveServices.remove(services);
                            });
                          } catch (error) {
                            // Handle the error if the deletion fails
                            print("Error deleting service: $error");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error deleting service: $error'),
                              ),
                            );
                          }
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: Container(
                          //color: Colors.redAccent,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 3,
                              clipBehavior: Clip.hardEdge,
                              color: Colors.grey.withOpacity(0.35),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' ${services['serviceName']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      ' ${userData['bname'] ?? 'N/A'} Ltd.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      ' ${userData['country'] ?? 'N/A'}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      ' ${userData['contact'] ?? 'N/A'}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      ' ${userData['email'] ?? 'N/A'}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
      ),
    );
  }
}
