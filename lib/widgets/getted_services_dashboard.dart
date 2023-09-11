// import 'package:business_bridge/models/assign_page_projects.dart';
// import 'package:business_bridge/models/services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
// class geted_service extends ConsumerStatefulWidget {
//   const geted_service({
//     super.key,
//     required this.onSelectA_project,
//     required this.ser,
//     required this.apd
//   });
//
//   final Services ser;
//   final AssignedProject apd;
// //  final ProjectDetail pd;
//
//   // final Services sr;
//   final void Function(AssignedProject apd) onSelectA_project;
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() {
//     return _geted_serviceState(
//       sr: ser,
//       apd: apd,
//       onSelectA_projects: onSelectA_project,
//     );
//   }
// }
//
// class _geted_serviceState extends ConsumerState<geted_service> {
//   _geted_serviceState({
//      required this.sr,
//      required this.apd,
//     required this.onSelectA_projects,
//   });
//
//   final Services sr;
//   final AssignedProject apd;
//   final void Function(AssignedProject apd) onSelectA_projects;
//   final user = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     // final d = ref.watch(servicesProvider);
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
//       child: InkWell(
//         onTap: () {
//           onSelectA_projects(apd);
//         },
//         // onTap: () {
//         //   onSelectA_projects(ap);
//         // },
//         child: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance.collection('executive').doc(user!.uid).snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
//             }
//
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//
//             final executiveData = snapshot.data?.data() as Map<String, dynamic>?;
//
//             if (executiveData == null) {
//               // Handle the case where the document doesn't exist or is null
//               return Text('Executive data not found!');
//             }
//
//             final Map<String, dynamic>? executiveServices = executiveData['services'] as Map<String, dynamic>?;
//             final service1;
//             if (executiveServices != null) {
//               // You now have access to the "services" map
//               // You can access its values like this:
//                service1 = executiveServices['serviceName'];
//               // Add more fields as needed
//             } else {
//               // Handle the case where the "services" map is not available
//               // You can set default values or show a message, e.g., "No services available."
//             }
//
//
//             return Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               elevation: 3,
//               clipBehavior: Clip.hardEdge,
//               color: Colors.grey.withOpacity(0.35),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "service1",
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                     // Add more Text widgets to display other executive data
//                     // Example: Text('Country: ${executiveData['country']}'),
//                     // Example: Text('Mobile: ${executiveData['contact']}'),
//                     // Example: Text('Email: ${executiveData['email']}'),
//                   ],
//                 ),
//               ),
//             );
//           },
//         )
//
//       ),
//     );
//   }
// }
