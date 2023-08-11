import 'package:business_bridge/models/assign_page_projects.dart';
import 'package:business_bridge/models/assign_project_details.dart';
import 'package:business_bridge/provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class assign_project_page extends ConsumerStatefulWidget {
  assign_project_page({
    super.key,
    required this.apd,
  //  required this.pd,
  });

   final AssignedProject apd;
  // final ProjectDetail pd;

  @override
  ConsumerState<assign_project_page> createState() =>
      _assign_project_pageState(
          apd: apd,
          //pd: pd
      );
}

class _assign_project_pageState extends ConsumerState<assign_project_page> {
  final AssignedProject apd;
//  final ProjectDetail pd;
  _assign_project_pageState({
    required this.apd,
//required this.pd
  });

  bool isinquiryChecked = false;
  bool ismittingChecked = false;
  bool isnanalizeChecked = false;



  @override
  Widget build(BuildContext context) {
    final ap = ref.watch(assignprojectdetailProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Project Details",
            style: TextStyle(
              color: Colors.white,
            )),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/workportal/workportalbg2.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),

              // ---------------------------- business info -----------------------
              Padding(
                padding: const EdgeInsets.only(
                    left: 7, right: 7, top: 10, bottom: 10),
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsets.all(10),
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        apd.maindetails.companyname,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //Text("Upscale Business",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      Text(apd.maindetails.description,
                       // "Adani want\'s to make a sales engagement platform that accelerates B2B sales pipeline through a multi-channel outreach capability to book more meetings and close more revenue.",
                        maxLines: 5,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Due date :"+apd.maindetails.duedate,
                              //" Thursday,20 january 2024",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // ------------------------------- task -------------------------
              Padding(
                padding: const EdgeInsets.only(
                    left: 7, right: 7, top: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 300,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Task",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStatePropertyAll(Colors.blue),
                              value: isinquiryChecked,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onChanged: (bool? value) {
                                setState(() {
                                  isinquiryChecked = value!;
                                });
                              },
                            ),
                          ),
                          Text(apd.details.task1,
                             // "Make an Inquiry call",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStatePropertyAll(Colors.blue),
                              value: ismittingChecked,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onChanged: (bool? value) {
                                setState(() {
                                  ismittingChecked = value!;
                                });
                              },
                            ),
                          ),
                          Text(apd.details.task2,
                              //"Set meeting with client",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStatePropertyAll(Colors.blue),
                              value: isnanalizeChecked,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onChanged: (bool? value) {
                                setState(() {
                                  isnanalizeChecked = value!;
                                });
                              },
                            ),
                          ),
                          Text(apd.details.task3,
                           //   "Analize client problem",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
