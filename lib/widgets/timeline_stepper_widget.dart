import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimelineStepper extends StatefulWidget {
  final List<Map<String, String>> steps;

  const TimelineStepper({Key? key, required this.steps}) : super(key: key);

  @override
  _TimelineStepperState createState() => _TimelineStepperState();
}

class _TimelineStepperState extends State<TimelineStepper> {
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 400,

            child: Timeline.tileBuilder(
              theme: TimelineTheme.of(context).copyWith(
                color: Theme.of(context).colorScheme.secondary,
                indicatorTheme: IndicatorThemeData(
                  color: Theme.of(context).colorScheme.secondary,
                  size: 25,
                ),
                nodePosition: 0.1,
                connectorTheme: ConnectorThemeData(
                  thickness: 3,
                ),
              ),
                builder: TimelineTileBuilder.connectedFromStyle(
                  itemCount: widget.steps.length,
                  connectorStyleBuilder: (context, index) {
                    return (index < _currentStep) ? ConnectorStyle.solidLine : ConnectorStyle.dashedLine;
                  } ,
                  indicatorStyleBuilder: (context, index) {
                    return   (index < _currentStep)
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
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text(widget.steps[index]['title']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                )
                            ),
                            Text(widget.steps[index]['subtitle']!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12
                                )
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ),
          ),

          // ---------------------- stepper ------------------------------
          Stepper(
            physics: ClampingScrollPhysics(),
            currentStep: _currentStep,

            onStepContinue: () {
              setState(() {
                _currentStep < widget.steps.length - 1
                    ? _currentStep += 1
                    : _currentStep;
              });
            },
            onStepCancel: () {
              setState(() {
                _currentStep > 0
                    ? _currentStep -= 1
                    : _currentStep = widget.steps.length - 1;
              });
            },
            controlsBuilder:
                (BuildContext context, ControlsDetails controlsDetails) {
              return Row(
                children: [
                  if(_currentStep < widget.steps.length - 1)
                    Padding(padding: const EdgeInsets.only(left: 80),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20))),
                          backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.secondary,
                          )),
                      onPressed: controlsDetails.onStepContinue,
                      child: Text('Next',style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .background,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),),
                    ),
                  )
                  else
                    Padding(padding: const EdgeInsets.only(left: 80),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20))),
                            backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.secondary,
                            )),

                        // ------------- task completed ---------
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Task Completed'),
                            backgroundColor: Theme.of(context).colorScheme.background,
                            elevation: 5,
                            content: const Text('Good job , you completed your task '),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: Text('Complete',style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .background,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),),
                      ),
                    ),
                  SizedBox(width: 10),
                  if(_currentStep != 0)
                     ElevatedButton(
                       style: ButtonStyle(
                         shape: MaterialStatePropertyAll(
                             RoundedRectangleBorder(
                                 borderRadius:
                                 BorderRadius.circular(20))),
                       ),
                      onPressed: controlsDetails.onStepCancel,
                      child: Text('Previous',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      ),
                     ),
                ],
              );
            },
            steps: widget.steps
                .map(
                  (step) => Step(
                    isActive: _currentStep == int.parse(step['active']!),
                    title: Text(step['title']!),
                    content: Text(step['content']!),
                  ),
                )
                .toList(),
            margin: EdgeInsets.only(right:10),
          ),
        ],
      ),
    );
  }
}
