import 'package:business_bridge/models/assign_page_projects.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class assign_project_page extends ConsumerStatefulWidget {
  assign_project_page({
    super.key,
    required this.apd,
required this.finalSteps
  });

   final AssignedProject apd;
  List<Map<String, String>> finalSteps;

  @override
  ConsumerState<assign_project_page> createState() =>
      _assign_project_pageState(
          apd: apd,
              finalSteps:finalSteps
      );
}

class _assign_project_pageState extends ConsumerState<assign_project_page> {
  final AssignedProject apd;
  List<Map<String, String>> finalSteps;
   _assign_project_pageState({
    required this.apd,
required this.finalSteps
  });
   int _currentStep = 1;

   Color getCorrectColor(int index) {
     if (index < _currentStep) {
       return Theme.of(context).colorScheme.secondary;
     }
     return Theme.of(context).colorScheme.secondary.withOpacity(0.7);
   }

  bool isinquiryChecked = false;
  bool ismittingChecked = false;
  bool isnanalizeChecked = false;


  @override
  Widget build(BuildContext context) {
    //final steps =finalSteps;
    //final ap = ref.watch(assignprojectdetailProvider);
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
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsets.all(10),
                 // width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adani ltd.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //Text("Upscale Business",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      Text(
                        "Adani want\'s to make a sales engagement platform that accelerates B2B sales pipeline through a multi-channel outreach capability to book more meetings and close more revenue.",
                        maxLines: 5,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Due date : Thursday,20 january 2024",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('Company Name: ${apd.maindetails.companyname}'),
          //     Text('Description: ${apd.maindetails.description}'),
          //     Text('Due Date: ${apd.maindetails.duedate}'),
          //     // Display other details12 data
          //     for (var detail in apd.details12)
          //       Column(
          //         children: [
          //           Text('Title: ${detail['title']}'),
          //           Text('Subtitle: ${detail['subtitle']}'),
          //           Text('Content: ${detail['content']}'),
          //         ],
          //       ),
          //   ],
          // ),
              // ------------------------------- task -------------------------
              Padding(
                padding: const EdgeInsets.only(
                    left: 20,right: 20, top: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  // height: 300,
                  // width: 320,
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
                      // Row(
                      //   children: [
                      //     Transform.scale(
                      //       scale: 1.3,
                      //       child: Checkbox(
                      //         checkColor: Colors.white,
                      //         fillColor: MaterialStatePropertyAll(Colors.blue),
                      //         value: isinquiryChecked,
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(4)),
                      //         onChanged: (bool? value) {
                      //           setState(() {
                      //             isinquiryChecked = value!;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     Text(
                      //         "Make an Inquiry call",
                      //         style:
                      //             TextStyle(color: Colors.black, fontSize: 16))
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Transform.scale(
                      //       scale: 1.3,
                      //       child: Checkbox(
                      //         checkColor: Colors.white,
                      //         fillColor: MaterialStatePropertyAll(Colors.blue),
                      //         value: ismittingChecked,
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(4)),
                      //         onChanged: (bool? value) {
                      //           setState(() {
                      //             ismittingChecked = value!;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     Text("Set meeting with client",
                      //         style:
                      //             TextStyle(color: Colors.black, fontSize: 16))
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Transform.scale(
                      //       scale: 1.3,
                      //       child: Checkbox(
                      //         checkColor: Colors.white,
                      //         fillColor: MaterialStatePropertyAll(Colors.blue),
                      //         value: isnanalizeChecked,
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(4)),
                      //         onChanged: (bool? value) {
                      //           setState(() {
                      //             isnanalizeChecked = value!;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     Text("Analize client problem",
                      //         style:
                      //             TextStyle(color: Colors.black, fontSize: 16))
                      //   ],
                      // ),
                      MediaQuery.removeViewPadding(

                        context: context,
                        removeTop: true,
                        child: Theme(
                          data: ThemeData(
                            canvasColor: Colors.yellow,
                            colorScheme: Theme.of(context).colorScheme.copyWith(
                              primary: Color(0xff0a1f34),
                              secondary: Color(0xff0a1f34),
                              background: Colors.white,
                              onPrimaryContainer: Colors.white,
                            ),
                          ),
                          child: Stepper(
                            physics: ClampingScrollPhysics(),
                            currentStep: _currentStep,

                            onStepContinue: () {
                              setState(() {
                                _currentStep < widget.finalSteps.length - 1
                                    ? _currentStep += 1
                                    : _currentStep;
                              });
                            },
                            onStepCancel: () {
                              setState(() {
                                _currentStep > 0
                                    ? _currentStep -= 1
                                    : _currentStep = widget.finalSteps.length - 1;
                              });
                            },
                            controlsBuilder:
                                (BuildContext context, ControlsDetails controlsDetails) {
                              return Row(
                                children: [
                                  if(_currentStep < widget.finalSteps.length - 1)
                                    Padding(padding: const EdgeInsets.only(left: 80),
                                      child: Container(
                                        //width: 100,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(10))),
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
                                      ),
                                    )
                                  else
                                    Padding(padding: const EdgeInsets.only(left: 80),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Container(
                                       // width: 100,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(10))),
                                              backgroundColor: MaterialStatePropertyAll(
                                                Theme.of(context).colorScheme.onPrimaryContainer,
                                              )
                                          ),
                                          onPressed: controlsDetails.onStepCancel,
                                          child: Text('Previous',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              color: Theme.of(context).colorScheme.secondary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                            steps: widget.finalSteps
                                .map(
                                  (step) => Step(
                                isActive: _currentStep == int.parse(step['active']!),
                                title: Text(step['title']!),
                                content: Padding(
                                  padding: const EdgeInsets.only(left: 60,bottom: 8),
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color(0xff0a1f34)
                                      ),
                                      child: Text(step['content']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),)
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                            margin: EdgeInsets.only(right:10),
                          ),
                        ),
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
