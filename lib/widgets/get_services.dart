import 'dart:io';
import 'package:business_bridge/models/services.dart';
import 'package:business_bridge/screens/getted_service_dashboard.dart';
import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/screens/services_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class GetService extends ConsumerStatefulWidget {

  const GetService({
    super.key,
required this.sn,
  });

final String sn;



  @override
  ConsumerState<GetService> createState() => _GetServiceState(sen: sn);
}

class _GetServiceState extends ConsumerState<GetService> {

_GetServiceState({required this.sen});
  String date = DateFormat('MMMM dd,yyyy').format(DateTime.now());
  DateTime? selectedDate;
 String sen;

 final executiveDetails = FirebaseFirestore.instance.collection("executive").doc("IZTd3cPjOkfEHFwyts3USXwhXlu2");
// Function to get the current date in the desired format
  // Function to get the current date in the desired format
  String _getCurrentDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat("MMMM d, y").format(now); // Format the date
    return formattedDate;
  }
var ename,econtct,ecountry,eemail;
  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      //final String sn='asd';
      return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Theme.of(context).colorScheme.secondary,
        decoration: BoxDecoration(
        //  image:Image.asset('assets/images/getservices.png'),
          image: DecorationImage(
            image: AssetImage('assets/images/getservices.png'),
            fit: BoxFit.fitHeight,

          ),
          color:  Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 16, keyBoardSpace + 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //-----------------------heading -------------------------------//
              Container(
                // height: 150,
                //  width: 280,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Ready ',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        Text(
                          'for a ',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        Text(
                          'Big Chance ',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,

                              fontSize: 35),
                        ),

                        Text(
                          '•-------•',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,

                              fontSize: 35),
                        ),
                      ],
                    ),
                  ),),
              //-----------------------data information ------------------//
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Service type : ",
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 16,

                            ),
                          ),
                          Expanded(
                            child: Text(
                            //' Services Name',
                                sen,
                              //textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance.collection('executive').doc('IZTd3cPjOkfEHFwyts3USXwhXlu2').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
                        }

                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        final executiveData = snapshot.data?.data() as Map<String, dynamic>?;

                        if (executiveData == null) {
                          // Handle the case where the document doesn't exist or is null
                          return Text('Executive data not found!');
                        }

                        final executiveName = executiveData['exname'] ?? 'N/A';
                          ename=executiveName;

                        final executiveEmail = executiveData['email'] ?? 'N/A';
                        eemail=executiveEmail;

                        final executivecon = executiveData['contact'] ?? 'N/A';
                        econtct=executivecon;

                        final executivecountry = executiveData['country'] ?? 'N/A';
                        ecountry=executivecountry;
                        // final executiveName = executiveData['exname'] ?? 'N/A';
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Our Executive Name : ",
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    executiveName,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.background,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Executive Mobile no. : ",
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  executiveData['contact'] ?? 'N/A',
                                  //"+91 9865328754",
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                    fontSize: 16,

                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Assign Date : ",
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  // date,
                                  _getCurrentDate(),
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );

                      },
                    ),



                  ],
                ),
              ),
              //-----------------------button-----------------------------//
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: 150,
                height: 50,
                child:       ElevatedButton(
                  onPressed: () {

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Congratulations!"),
                          content: Text("Our Executive Assigned You."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                final user = FirebaseAuth.instance.currentUser;
                                Navigator.of(context).pop();
                                // Define the new service map
                                Map<String, dynamic> newService = {
                                  "serviceName": sen,
                                  "serviceDescription": "Your Service Description",

                                  "index":1,
                                  "useruid":user!.uid,
                                  // Add other service properties as needed
                                };

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ServiceDetailPage(
                                      serviceName: sen,
                                      executivename:  ename,
                                      email:eemail, contact: econtct, country: ecountry ,
                                      // You can replace this with the actual description
                                    ),
                                  ),
                                );

                                final assignedExecutiveDoc =
                                FirebaseFirestore.instance.collection("executive").doc('IZTd3cPjOkfEHFwyts3USXwhXlu2');

                                // Update the assigned executive's document by adding the new service to the services array
                                assignedExecutiveDoc.update({
                                  "services": FieldValue.arrayUnion([newService]),
                                });
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
