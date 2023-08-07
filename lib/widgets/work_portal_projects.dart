import 'package:business_bridge/models/services.dart';
import 'package:business_bridge/provider/data_provider.dart';
import 'package:business_bridge/screens/assign_project_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:transparent_image/transparent_image.dart';

import '../models/case_study.dart';

class workProject extends ConsumerStatefulWidget {
  const workProject(
      {super.key,required this.onSelectproject,});


 // final Services sr;
  final void Function(case_Study caseSt) onSelectproject;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _workProjectState();
  }
}

class _workProjectState extends ConsumerState<workProject> {


  @override
  Widget build(BuildContext context) {
   // final d = ref.watch(servicesProvider);

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) {
                  return assign_project_page();
                }));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 10),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.35),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('sdf',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text("India",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Text("+91 9865328754",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Text("abhishek113@gmail.com",
                    maxLines: 2,
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
