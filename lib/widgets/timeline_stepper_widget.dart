import 'dart:ffi';

import 'package:business_bridge/models/assign_page_projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimelineStepper extends StatefulWidget {
  final List<Map<String, String>> steps;
  final List<Map<String, String>> finalSteps;
  //final AssignedProject apd;
  //final AssignedProject ap;
 // final void Function(AssignedProject apd) onSelectA_project;

  const TimelineStepper({
    Key? key,
    required this.steps,
    required this.finalSteps,
    //required this.apd,
   // required this.ap,
   // required this.onSelectA_project,
  }) : super(key: key);

  @override
  _TimelineStepperState createState() => _TimelineStepperState(
      finalSteps: finalSteps,
    //ap: apd,
      //onSelectA_project: onSelectA_project
  );
}

class _TimelineStepperState extends State<TimelineStepper> {
  final List<Map<String, String>> finalSteps;
  //final AssignedProject ap;
  //final void Function(AssignedProject apd) onSelectA_project;

  _TimelineStepperState(
      {required this.finalSteps,
     // required this.ap,
     // required this.onSelectA_project
      });

  int _currentStep = 1;

  Color getCorrectColor(int index) {
    if (index < _currentStep) {
      return Theme.of(context).colorScheme.secondary;
    }
    return Theme.of(context).colorScheme.secondary.withOpacity(0.7);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 20),
          child: Column(
            children: [
              Container(
                height: 700,
// color: Colors.red,
// height: double.infinity,
                // ------------------------ Timeline ------------------
                child: Timeline.tileBuilder(
                  theme: TimelineTheme.of(context).copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    indicatorTheme: IndicatorThemeData(
                      color: Theme.of(context).colorScheme.secondary,
                      size: 15,
                    ),
                    nodePosition: 0.1,
                    connectorTheme: ConnectorThemeData(
                      thickness: 3.5,
                    ),
                  ),
                  builder: TimelineTileBuilder.connectedFromStyle(
                    itemCount: finalSteps.length,
                    connectorStyleBuilder: (context, index) {
                      return (index < _currentStep)
                          ? ConnectorStyle.solidLine
                          : ConnectorStyle.dashedLine;
                    },
                    indicatorStyleBuilder: (context, index) {
                      return (index < _currentStep)
                          ? IndicatorStyle.dot
                          : IndicatorStyle.outlined;
                    },
                    contentsAlign: ContentsAlign.basic,
                    firstConnectorStyle: ConnectorStyle.transparent,
                    lastConnectorStyle: ConnectorStyle.transparent,
                    contentsBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // width: 280,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: getCorrectColor(index),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.steps[index]['title']!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              Text(widget.steps[index]['subtitle']!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                              Text(widget.steps[index]['content']!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // ---------------------- stepper ------------------------------
              // Theme(
              //   data: ThemeData(
              //     canvasColor: Colors.yellow,
              //     colorScheme: Theme.of(context).colorScheme.copyWith(
              //       primary: Color(0xff0a1f34),
              //       secondary: Color(0xff0a1f34),
              //       background: Colors.white,
              //       onPrimaryContainer: Colors.white,
              //     ),
              //   ),
              //   child: Stepper(
              //     physics: ClampingScrollPhysics(),
              //     currentStep: _currentStep,
              //
              //     onStepContinue: () {
              //       setState(() {
              //         _currentStep < widget.steps.length - 1
              //             ? _currentStep += 1
              //             : _currentStep;
              //       });
              //     },
              //     onStepCancel: () {
              //       setState(() {
              //         _currentStep > 0
              //             ? _currentStep -= 1
              //             : _currentStep = widget.steps.length - 1;
              //       });
              //     },
              //     controlsBuilder:
              //         (BuildContext context, ControlsDetails controlsDetails) {
              //       return Row(
              //         children: [
              //           if(_currentStep < widget.steps.length - 1)
              //             Padding(padding: const EdgeInsets.only(left: 80),
              //               child: Container(
              //                 width: 100,
              //                 child: ElevatedButton(
              //                   style: ButtonStyle(
              //                     shape: MaterialStatePropertyAll(
              //                         RoundedRectangleBorder(
              //                             borderRadius:
              //                             BorderRadius.circular(10))),
              //                     backgroundColor: MaterialStatePropertyAll(
              //                       Theme.of(context).colorScheme.secondary,
              //                     )),
              //                 onPressed: controlsDetails.onStepContinue,
              //                 child: Text('Next',style: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge!
              //                     .copyWith(
              //                     color: Theme.of(context)
              //                         .colorScheme
              //                         .background,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 18),),
              //             ),
              //               ),
              //           )
              //           else
              //             Padding(padding: const EdgeInsets.only(left: 80),
              //               child: ElevatedButton(
              //                 style: ButtonStyle(
              //                     shape: MaterialStatePropertyAll(
              //                         RoundedRectangleBorder(
              //                             borderRadius:
              //                             BorderRadius.circular(10))),
              //                     backgroundColor: MaterialStatePropertyAll(
              //                       Theme.of(context).colorScheme.secondary,
              //                     )),
              //
              //                 // ------------- task completed ---------
              //                 onPressed: () => showDialog<String>(
              //                   context: context,
              //                   builder: (BuildContext context) => AlertDialog(
              //                     title: const Text('Task Completed'),
              //                     backgroundColor: Theme.of(context).colorScheme.background,
              //                     elevation: 5,
              //                     content: const Text('Good job , you completed your task '),
              //                     actions: <Widget>[
              //                       TextButton(
              //                         onPressed: () => Navigator.pop(context, 'OK'),
              //                         child: const Text('OK'),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 child: Text('Complete',style: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge!
              //                     .copyWith(
              //                     color: Theme.of(context)
              //                         .colorScheme
              //                         .background,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 18),),
              //               ),
              //             ),
              //           SizedBox(width: 10),
              //           if(_currentStep != 0)
              //              Padding(
              //                padding: const EdgeInsets.only(left: 8),
              //                child: Container(
              //                  width: 100,
              //                  child: ElevatedButton(
              //                    style: ButtonStyle(
              //                      shape: MaterialStatePropertyAll(
              //                          RoundedRectangleBorder(
              //                              borderRadius:
              //                              BorderRadius.circular(10))),
              //                      backgroundColor: MaterialStatePropertyAll(
              //                        Theme.of(context).colorScheme.onPrimaryContainer,
              //                      )
              //                    ),
              //                   onPressed: controlsDetails.onStepCancel,
              //                   child: Text('Previous',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              //                       color: Theme.of(context).colorScheme.secondary,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 18),
              //                   ),
              //                  ),
              //                ),
              //              ),
              //         ],
              //       );
              //     },
              //     steps: widget.steps
              //         .map(
              //           (step) => Step(
              //             isActive: _currentStep == int.parse(step['active']!),
              //             title: Text(step['title']!),
              //             content: Padding(
              //               padding: const EdgeInsets.only(left: 60,bottom: 8),
              //               child: Container(
              //                 padding: EdgeInsets.all(10),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   color: Color(0xff0a1f34)
              //                 ),
              //                   child: Text(step['content']!,
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                     ),)
              //               ),
              //             ),
              //           ),
              //         )
              //         .toList(),
              //     margin: EdgeInsets.only(right:10),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
