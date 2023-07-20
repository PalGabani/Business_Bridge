import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class case_study_page extends StatefulWidget {
  @override
  State<case_study_page> createState() => _case_study_pageState();
}

class _case_study_pageState extends State<case_study_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leadingWidth: 300,
          leading:Text(" Our Journey",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 38)),
          // iconTheme: CupertinoIconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

            )
          ],
        ),
      ),
    );
  }
}
