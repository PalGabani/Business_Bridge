
import 'package:business_bridge/widgets/timeline_stepper_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/data_provider.dart';

class dashboard_page extends ConsumerStatefulWidget {
  @override
  ConsumerState<dashboard_page> createState() => _dashboard_pageState();
}

class _dashboard_pageState extends ConsumerState<dashboard_page> {
  int current_step = 1;

  // final steps = [
  //   {
  //     'title': 'Step 1',
  //     'subtitle': 'Subtitle 1',
  //     'content':
  //         'An upscale business refers to a company that targets higher-end customers and offers products or services that are considered luxurious or exclusive. These businesses generally focus on providing a superior customer experience, premium quality products, and a prestigious brand image.',
  //     'active': '0'
  //   },
  //   {
  //     'title': 'Meet with the Client',
  //     'subtitle': 'Subtitle 2',
  //     'content':
  //         'An upscale business refers to a company that targets higher-end customers and offers products or services that are considered luxurious or exclusive. These businesses generally focus on providing a superior customer experience, premium quality products, and a prestigious brand image.',
  //     'active': '1'
  //   },
  //   {
  //     'title': 'Step 3',
  //     'subtitle': 'Subtitle 3',
  //     'content': 'Content 3',
  //     'active': '2'
  //   },
  //   {
  //     'title': 'Step 1',
  //     'subtitle': 'Subtitle 1',
  //     'content': 'Content 4',
  //     'active': '3'
  //   },
  //   {
  //     'title': 'Step 2',
  //     'subtitle': 'Subtitle 2',
  //     'content': 'Content 5',
  //     'active': '4'
  //   },
  //   {
  //     'title': 'Step 3',
  //     'subtitle': 'Subtitle 3',
  //     'content': 'Content 6',
  //     'active': '5'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    final apd = ref.watch(assignedprojectsProvider);
    final services = ref.watch(servicesProvider);
    // Widget content = Container(
    //   // height: 100,
    //   child: Center(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           'Oops ...nothing Here!',
    //           style: Theme.of(context)
    //               .textTheme
    //               .headlineMedium!
    //               .copyWith(color: Theme.of(context).colorScheme.onBackground),
    //         ),
    //         SizedBox(
    //           height: 17,
    //         ),
    //         Text(
    //           'Please,try another Category...',
    //           style: Theme.of(context)
    //               .textTheme
    //               .bodyMedium!
    //               .copyWith(color: Theme.of(context).colorScheme.onBackground),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    //
    // void selectpro(
    //   BuildContext context,
    //   AssignedProject ap,
    // ) {
    //   //List<Map<String, String>> step = ap.details12;
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (ctx) => TimelineStepper(steps: steps, finalSteps: ap.details12, apd: ap,),
    //     ),
    //   );
    // }
    //
    // if (apd.isNotEmpty) {
    //   content = ListView.builder(
    //     itemCount: apd.length ,
    //     itemBuilder: (ctx, index) => geted_service(
    //         onSelectA_project: (ser) {
    //           // if(asp.id==apd.id){}
    //           selectpro(context, ser);
    //         },
    //         ser: services[index],
    //         apd: apd[index]),
    //   );
    // }
final steps=apd[0].details12;
    return Scaffold(

      appBar: AppBar(
        backgroundColor:Color(0xffdee9f0),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('Dashboard '),
        ),
      ),

       body: TimelineStepper(steps: steps, finalSteps: steps,  ),
    );
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
