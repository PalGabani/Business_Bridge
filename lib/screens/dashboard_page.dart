import 'package:business_bridge/screens/homepage.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard_page extends StatefulWidget{
  @override
  State<dashboard_page> createState() => _dashboard_pageState();
}

class _dashboard_pageState extends State<dashboard_page> {

  int current_step = 1;

  final stepperList = [
    StepperStep(
      title: Text('Account Details'),
      status: StepStatus.complete,
      leading: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStatePropertyAll(Colors.blue),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)),
        value: false,
        onChanged: (bool? value) {  },

      ), view: Container(),
    ),
    StepperStep(
      title: Text('Application review'),
        status: StepStatus.complete,
        leading: Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStatePropertyAll(Colors.blue),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
          value: false,
          onChanged: (bool? value) {  },

        ), view: Container()
    ),
    StepperStep(
        title: Text('Application review'),
        leading: Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStatePropertyAll(Colors.blue),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
          value: false,
          onChanged: (bool? value) {  },

        ), view: Container()
    ),
    StepperStep(
        title: Text('Application review'),
        leading: Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStatePropertyAll(Colors.blue),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
          value: false,
          onChanged: (bool? value) {

          },

        ), view: Container()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        children: [
          CasaVerticalStepperView(
            steps: stepperList,
            upComingColor: Colors.yellow,
            completeColor: Colors.green,
            seperatorColor: const Color(0xffD2D5DF),
            isExpandable: true,
            showStepStatusWidget: false,
          ),
        ],
      ),
    );
  }
}
