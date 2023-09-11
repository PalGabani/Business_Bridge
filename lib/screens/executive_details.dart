import 'package:business_bridge/models/assign_page_projects.dart';

import 'package:business_bridge/screens/assign_project_page.dart';
import 'package:business_bridge/screens/login_page_user.dart';
import 'package:business_bridge/widgets/work_portal_projects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/data_provider.dart';
import '../utils/utility.dart';
import '../widgets/case_study.dart';

class executive_details extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _executive_detailsState();
  }
}

class _executive_detailsState extends ConsumerState<executive_details> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user; // To store the current user

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    // Get the current user
  }


  @override
  Widget build(BuildContext context, ) {
    final DocumentReference executiveRef = FirebaseFirestore.instance.collection('executive').doc('IZTd3cPjOkfEHFwyts3USXwhXlu2'); // Replace 'abhishek' with the actual document ID

    final ap = ref.watch(assignedprojectsProvider);

    Widget content = Container(
      // height: 100,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oops ...nothing Here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              'Please,try another Category...',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
    void selectpro(BuildContext context, AssignedProject ap, ) {
      List<Map<String, String>> step=ap.details12;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => assign_project_page(apd: ap,finalSteps: step,),),);
    }

    if (ap.isNotEmpty) {
      content = ListView.builder(
          itemCount: ap.length,
          itemBuilder: (ctx, index) => workProject(

                asp: ap[index],

            onSelectA_project: (asp) {
                  // if(asp.id==apd.id){}
              selectpro(context, asp);
                },
              ));
    }





    void signOut() async {
      try {
        await FirebaseAuth.instance.signOut(); // Sign out the user from Firebase Authentication

        // You can add additional code here to clear any cached user data or perform any other necessary cleanup
        Utiles().toastmessege("Logout!");
        // Navigate back to the login page
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login_page(),
        ));
      } catch (e) {
        print("Error during sign out: $e");
        Utiles().toastmessege("Some Error occurs on Logout!");
        // Handle any errors that occur during the sign-out process
        // You can show a snackbar or an error message to the user
      }
    }





    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Work Portal",
              style: TextStyle(
                color: Colors.white,
              )),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                // Handle the logout process here
                signOut(); // Call the signOut function to log out the executive
              },
            ),
          ],
        ),
        body: Container(
          // height: double.infinity,
          // width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/workportal/workportalbg2.png',
              ),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.saturation),
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //----------------------------------name upper part ------------------------//
                    SizedBox(
                      height: 110,
                    ),


                    Column(
                      children: [
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('executive')
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
                              padding: const EdgeInsets.only(top: 0.0,left: 20,right: 20,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.withOpacity(0.35),

                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child:  Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: NetworkImage(userData['img_url'] ?? ''),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // child: Container(
                                          //   height: 100,
                                          //   width: 100,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(100),
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 20, top: 20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(userData['exname'],
                                                    maxLines: 1, // Display in one line
                                                    overflow: TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 20)),
                                                Text(userData['country'],
                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 15)),
                                                Text(userData['contact'],
                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 15)),
                                                Text(userData['email'],
                                                    maxLines: 1, // Display in one line
                                                    overflow: TextOverflow.ellipsis,
                                                    softWrap: true,

                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 17)),

                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  //-------------------------------projects assign part------------------//

                                  //Add similar rows for other user data here
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.only(left: 20, top: 20,bottom: 5),
                            alignment: AlignmentDirectional.topStart,
                            child: Text("Assigned Projects: ",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 25)),
                          ),

                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: Expanded(
                              child: Container(
                                color: Colors.transparent,
                                child: content,
                              ),
                            ),
                          ),

                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
