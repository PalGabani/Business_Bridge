import 'package:business_bridge/models/services.dart';
import 'package:business_bridge/screens/services_details_page.dart';
import 'package:business_bridge/widgets/services_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/data_provider.dart';

class services_page extends ConsumerStatefulWidget {

  services_page(
      {super.key,
        required this.title,
        required this.services,
        //required this.availableC_S
      });

  final String? title;
  final List<Services> services;
  //final List<case_Study> availableC_S;
  @override
  ConsumerState<services_page> createState() => _services_pageState();
}

class _services_pageState extends ConsumerState<services_page> {
  @override

  //get index => data;

  Widget build(BuildContext context) {

    final data_st = ref.watch(servicesProvider);

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

    void selectMeal(BuildContext context, Services sr) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => services_details_page(sr: sr,)));
    }

    if (data_st.isNotEmpty) {
      content = ListView.builder(

          itemCount: data_st.length,
          itemBuilder: (ctx, index) => serviceItem(
            ser : data_st[index],

            onSelectService: (data_st) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Services"),
        scrolledUnderElevation: 0,
      ),
      body: content,
    );
  }
}
