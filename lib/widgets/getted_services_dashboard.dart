import 'package:business_bridge/models/assign_page_projects.dart';
import 'package:business_bridge/models/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:transparent_image/transparent_image.dart';

import '../models/case_study.dart';
import '../screens/assign_project_page.dart';

class geted_service extends ConsumerStatefulWidget {
  const geted_service({
    super.key,
    required this.onSelectA_project,
    required this.ser,
    required this.apd
  });

  final Services ser;
  final AssignedProject apd;
//  final ProjectDetail pd;

  // final Services sr;
  final void Function(AssignedProject apd) onSelectA_project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _geted_serviceState(
      sr: ser,
      apd: apd,
      onSelectA_projects: onSelectA_project,
    );
  }
}

class _geted_serviceState extends ConsumerState<geted_service> {
  _geted_serviceState({
     required this.sr,
     required this.apd,
    required this.onSelectA_projects,
  });

  final Services sr;
  final AssignedProject apd;
  final void Function(AssignedProject apd) onSelectA_projects;

  @override
  Widget build(BuildContext context) {
    // final d = ref.watch(servicesProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: InkWell(
        onTap: () {
          onSelectA_projects(apd);
        },
        // onTap: () {
        //   onSelectA_projects(ap);
        // },
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          clipBehavior: Clip.hardEdge,
          color: Colors.grey.withOpacity(0.35),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sr.title,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                // Text(ap.country,
                //     style: TextStyle(color: Colors.white, fontSize: 15)),
                // Text(ap.mobile,
                //     style: TextStyle(color: Colors.white, fontSize: 15)),
                // Text(ap.email,
                //     //maxLines: 2,
                //     style: TextStyle(color: Colors.white, fontSize: 17)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
