import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class case_study_details_page extends StatefulWidget{

  Map data;
  case_study_details_page(this.data,{super.key});

  @override
  State<case_study_details_page> createState() => _case_study_details_pageState();
}

class _case_study_details_pageState extends State<case_study_details_page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: CupertinoIconThemeData(color: Colors.black),
        ),
        extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.data["image"]),
                  fit: BoxFit.cover,
                )
              ),
            ),

            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: const EdgeInsets.only(top: 15.0,left: 20,bottom: 8.0),
                            child: Text("Client Goal :",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,),),),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Text(widget.data["goal"],style: TextStyle(color: Colors.black,fontSize: 15)),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 15.0,left: 20,bottom: 8.0),
                            child: Text("Situation : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Text(widget.data["situation"],style: TextStyle(color: Colors.black,fontSize: 15)),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 15.0,left: 20,bottom: 8.0),
                            child: Text("Study : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            child: Text(widget.data["study"],style: TextStyle(color: Colors.black,fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}