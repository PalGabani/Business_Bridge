import 'package:business_bridge/screens/case_study_page.dart';
import 'package:business_bridge/screens/history_page.dart';
import 'package:business_bridge/screens/profile_page.dart';
import 'package:business_bridge/screens/sercvices_page.dart';
import 'package:business_bridge/screens/work_portal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override

  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    // enter items index vise
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

      //--------navigation bar ------------
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.cases_rounded,size: 32), label: "case study"),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services_outlined,size: 32), label: "services"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp,size: 32), label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy_outlined,size: 32), label: "work portal"),
          BottomNavigationBarItem(icon: Icon(Icons.history,size: 32), label: "history"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        unselectedItemColor: Color(0x7C000000),
        selectedItemColor: Colors.deepPurple,
      ),
      body: new IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          new case_study_page(),
          new services_page(),
          new profile_page(),
          new work_portal_page(),
          new history_page()
          //activity name
        ],
      ),
    );
  }
}
