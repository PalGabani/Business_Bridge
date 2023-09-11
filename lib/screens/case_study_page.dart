import 'package:business_bridge/models/case_study.dart';
import 'package:business_bridge/provider/data_provider.dart';
import 'package:business_bridge/screens/case_study_details_page.dart';
import 'package:business_bridge/widgets/case_study.dart';
import 'package:business_bridge/widgets/exit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


class case_study_page extends ConsumerStatefulWidget {
  case_study_page(
      {super.key,
      required this.title,
      required this.casestudies,
      required this.availableC_S});

  final String? title;
  final List<case_Study> casestudies;
  final List<case_Study> availableC_S;

  @override
  ConsumerState<case_study_page> createState() => _case_study_pageState();
}

class _case_study_pageState extends ConsumerState<case_study_page> {
  @override

  Widget build(BuildContext context) {

    final data_st = ref.watch(caseStudyProvider);

    Widget content = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Oops ...nothing Here!',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            'Please,try another Category...',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    void selectMeal(BuildContext context, case_Study cs) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => case_Study_details_page(cs: cs)));
    }

    if (data_st.isNotEmpty) {
      content = ListView.builder(
        itemCount: data_st.length,
          itemBuilder: (ctx, index) => caseItem(
                caseSt: data_st[index],

            onSelectCase: (data_st) {
              selectMeal(context, data_st);
            },
              ));
    }
    // if (meals.isNotEmpty) {
    //   content = ListView.builder(
    //     itemCount: meals.length,
    //     itemBuilder: (ctx, index) =>caseItem(caseSt: cases, onSelectCase: onSelectCase),
    //   );
    // }
    // if(title==null){
    //   return content;
    // }
    return WillPopScope(
      onWillPop: () async {
        bool exitConfirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ExitConfirmationDialog(context: context);
          },
        );

        return exitConfirmed;
      },
      child: Scaffold(

        appBar: AppBar(
          backgroundColor:Color(0xffdee9f0),
automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("Our Journey", style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground,fontSize: 20),),
          ),
          scrolledUnderElevation: 0,
        ),
        body: content,
      ),
    );
  }
}
