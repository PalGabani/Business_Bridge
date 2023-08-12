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
                nodePosition: 0.1,
              ),
                builder: TimelineTileBuilder.connectedFromStyle(
                  itemCount: widget.steps.length,
                  connectorStyleBuilder: (context, index) {
                    return (index < _currentStep) ? ConnectorStyle.solidLine : ConnectorStyle.dashedLine;
                  } ,
                  indicatorStyleBuilder: (context, index) {
                    return (index < _currentStep) ? IndicatorStyle.dot : IndicatorStyle.outlined;
                  },
                  contentsAlign: ContentsAlign.basic,

                  contentsBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 100,
                      child: Column(
                        children: [
                          Text(widget.steps[index]['title']!,),
                          Text(widget.steps[index]['subtitle']!,),
                        ],
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
