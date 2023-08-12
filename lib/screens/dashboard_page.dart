import 'package:business_bridge/screens/homepage.dart';
import 'package:business_bridge/widgets/timeline_stepper_widget.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard_page extends StatefulWidget{
  @override
  State<dashboard_page> createState() => _dashboard_pageState();
}

class _dashboard_pageState extends State<dashboard_page> {

  int current_step = 1;
  bool _stepervalue = false;

  final steps = [
    {'title': 'Step 1', 'subtitle': 'Subtitle 1', 'content': 'Content 1','active':'0'},
    {'title': 'Step 2', 'subtitle': 'Subtitle 2', 'content': 'Content 2','active':'1'},
    {'title': 'Step 3', 'subtitle': 'Subtitle 3', 'content': 'Content 3','active':'2'},
    {'title': 'Step 1', 'subtitle': 'Subtitle 1', 'content': 'Content 4','active':'3'},
    {'title': 'Step 2', 'subtitle': 'Subtitle 2', 'content': 'Content 5','active':'4'},
    {'title': 'Step 3', 'subtitle': 'Subtitle 3', 'content': 'Content 6','active':'5'},
  ];

  @override
  Widget build(BuildContext context) {
    return  TimelineStepper(steps: steps);
      // body: Column(
      //   children: [
      //     CasaVerticalStepperView(
      //       steps: stepperList,
      //       upComingColor: Colors.yellow,
      //       completeColor: Colors.green,
      //       seperatorColor: const Color(0xffD2D5DF),
      //       isExpandable: true,
      //       showStepStatusWidget: false,
      //     ),
      //
      //   ],
      // ),
  }
}
