import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class services_page extends StatefulWidget {
  @override
  State<services_page> createState() => _services_pageState();
}

class _services_pageState extends State<services_page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 300,
        leading: Text(" SERVICES",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38)),
        // iconTheme: CupertinoIconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200,width: 300,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/services/service_marketing.jpg"))),),

            Container(height: 200,width: 300,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/case_study/case_transport.jpg"))),)
          ],
        ),
      ),
    );
  }
}
