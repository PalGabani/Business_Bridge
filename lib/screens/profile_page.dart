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
  bool isLoadingImage = false; // Initialize this flag
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    //isLoadingImage = false;
    // Get the current user
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> deleteUserAccount(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    if (user != null) {
      try {
        // Delete data in Firestore
        await usersCollection.doc(user.uid).delete();

        // Delete the user account in Firebase Authentication
        await user.delete();

        // Show a toast message or navigate to the login page
        Utiles().toastmessege("Account Deleted!");

        ///_user = _auth.
      } catch (error) {
        // Handle errors
        Utiles().toastmessege("Error Fetch on Deleting Account!");
        print('Error deleting user data: $error');
      }
    } else {
      print('User is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer.png"),
                  // Replace with your image path
                  fit: BoxFit
                      .fill, // You can choose the BoxFit that suits your design
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              enableFeedback: true,
              splashColor: Colors.grey,
              enabled: true,
              focusColor: Colors.blueGrey,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => homepage(),
                //   ),
                // );
                Navigator.pop(context);
               // Navigator.popUntil(context, ModalRoute.withName('/profile_page'));
              },

            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
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
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              title: Text('Delete Account'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Account'),
                      content:
                          Text('Are you sure you want to delete your account?'),
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
                            deleteUserAccount(context);

                            // Close the dialog
                            Navigator.of(context).pop();

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Login_page();
                            }));
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                try {
                  // Update the Firestore document to set the loggedIn field to false
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    final userRef = FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid);
                    await userRef.update({'loggedIn': false});
                  }

                  await FirebaseAuth.instance.signOut(); // Sign the user out
                  Utiles().toastmessege("Log Out");
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
      body: Container(
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
                  Container(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    height: 80,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                            // Add your menu button functionality here
                          },
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(_user?.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (_user == null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Login_page(),
                          ));
                        });
                        return CircularProgressIndicator();
                      }

                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      final userData = snapshot.data?.data() as Map<String, dynamic>?;

                      if (userData == null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'User data not found! Login Again ,Goto Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiary,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login_page()),
                                  );
                                },
                                child: Text('Go to HomePage'),
                              ),
                            ],
                          ),
                        );
                      }

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 5.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 58,
                                      backgroundColor: Colors.grey.withOpacity(0.5),
                                      backgroundImage: NetworkImage(
                                        userData['image'] ?? 'N/A',
                                      ),
                                      child: isLoadingImage
                                          ? CircularProgressIndicator(
                                        color: Colors.grey,
                                      )
                                          : null,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  userData['bname'] ?? 'N/A',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Text(
                                        "Details:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,right: 10,top: 10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.withOpacity(0.35),
                                    ),
                                    // Limit the maximum height of the scrollable container to 300
                                    height: 409,
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 10,bottom: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Business Name:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              userData['bname'] ?? 'N/A',
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Sector Name:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              userData['sector'] ?? 'N/A',
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white
                                                      .withOpacity(0.9)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "User Name:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              userData['username'] ?? 'N/A',
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Contact No.:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              userData['contact'] ?? 'N/A',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Email ID:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              userData['email'] ?? 'N/A',
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Country Name:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              userData['country'] ?? 'N/A',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "License No.:",
                                              maxLines: 2,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              userData['license'] ?? 'N/A',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // Include other details here
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )

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
          ],
        ),
      )

    );
  }
}
