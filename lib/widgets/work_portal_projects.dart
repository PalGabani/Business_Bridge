import 'package:business_bridge/models/assign_page_projects.dart';
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
      //pd: pd,
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
          child:StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection('executive').doc(user!.uid).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final executiveData = snapshot.data?.data() as Map<String, dynamic>?;

              if (executiveData == null) {
                return Text('Executive data not found!');
              }

              final List<dynamic>? executiveServices = executiveData['services'] as List<dynamic>?;

              if (executiveServices == null || executiveServices.isEmpty) {
                return Text('No assigned projects.');
              }

              return Column(
                children: executiveServices.map((service) {
                  final String userUid = service['useruid'] ?? ''; // Assuming 'userUid' is stored in the service data

                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance.collection('users').doc(userUid).get(),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (userSnapshot.hasError) {
                        return Text('Error fetching user data: ${userSnapshot.error}');
                      }

                      final userData = userSnapshot.data?.data() as Map<String, dynamic>?;

                      if (userData == null) {
                        return Text('User data not found!');
                      }

                      final String country = userData['country'] ?? 'N/A';
                      final String contact = userData['contact'] ?? 'N/A';
                      final String email = userData['email'] ?? 'N/A';
                      final String companyname = userData['bname'] ?? 'N/A';
                      return Container(
                        //color: Colors.redAccent,
                        height: MediaQuery.of(context).size.height,
                        //width: double.infinity,// Set a fixed height or adjust as needed
                        child: ListView.builder(
                        itemCount: executiveServices.length,
                        itemBuilder: (context, index) {
                          final service = executiveServices[index];
                          final userUid = service['useruid'] ?? ''; // Assuming 'userUid' is stored in the service data

                          return FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance.collection('users').doc(userUid).get(),
                            builder: (context, userSnapshot) {
                              if (userSnapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                              if (userSnapshot.hasError) {
                                return Text('Error fetching user data: ${userSnapshot.error}');
                              }

                              final userData = userSnapshot.data!.data() as Map<String, dynamic>?;

                              if (userData == null) {
                                return Text('User data not found!');
                              }

                              return Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  elevation: 3,
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.grey.withOpacity(0.35),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Service Name: ${service['serviceName']}',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                        // Text(
                                        //   'Service Description: ${service['serviceDescription']}',
                                        //   style: TextStyle(color: Colors.white, fontSize: 16),
                                        // ),
                                        Text(
                                          'Company: ${userData['bname'] ?? 'N/A'}',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                        Text(
                                          'Country: ${userData['country'] ?? 'N/A'}',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                        Text(
                                          'Contact: ${userData['contact'] ?? 'N/A'}',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                        Text(
                                          'Email: ${userData['email'] ?? 'N/A'}',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
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

                      );

                    },
                  );
                }).toList(),
              );
            },
          )




      ),
    );
  }
}
