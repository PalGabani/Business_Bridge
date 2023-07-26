import 'package:business_bridge/models/case_study.dart';
import 'package:business_bridge/provider/casse_provider.dart';
import 'package:business_bridge/provider/data_provider.dart';
import 'package:business_bridge/screens/case_study_page.dart';
import 'package:business_bridge/screens/history_page.dart';
import 'package:business_bridge/screens/profile_page.dart';
import 'package:business_bridge/screens/services_page.dart';
import 'package:business_bridge/screens/work_portal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class homepage extends ConsumerStatefulWidget {
  @override
  ConsumerState<homepage> createState() => _homepageState();
}

class _homepageState extends ConsumerState<homepage> {
  @override
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // enter items index vise
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {

    final availablec_s = ref.watch(filtercaseProvider);
    final details = ref.watch(caseStudyProvider);

    return Scaffold(
      //--------navigation bar ------------
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cases_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              activeIcon: Icon(Icons.cases_rounded),
              label: "Case Study",

          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.medical_services_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              activeIcon: Icon(Icons.medical_services_rounded),
              label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              activeIcon: Icon(Icons.account_circle_sharp),
              label: "Profile"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.file_copy_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              activeIcon: Icon(Icons.file_copy_rounded),
              label: "Work portal"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.watch_later_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              activeIcon: Icon(Icons.watch_later),
              label: "History"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(size: 28),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          case_study_page(
            title: "our Journy",
            casestudies: details,
            availableC_S: availablec_s,
          ),
          services_page(
            title: "Services",
            //services: [],
          ),
          profile_page(),
          work_portal_page(),
          history_page()
          //activity name
        ],
      ),
    );
  }
}
