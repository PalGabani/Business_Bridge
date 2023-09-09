import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/pop_up.dart';
import 'login_page_user.dart';

class about_us_page extends StatefulWidget{
  @override
  State<about_us_page> createState() => _about_us_pageState();
}

class _about_us_pageState extends State<about_us_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us "),
        actions: [
          Popup(),
        ],
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add a back button icon
          onPressed: () {
            // Navigate to the Login_page when the back button is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Login_page(); // Replace with your login page
                },
              ),
            );
          },
        ),
      ),
    );
  }
}