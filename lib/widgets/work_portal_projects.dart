import 'package:business_bridge/models/assign_page_projects.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:transparent_image/transparent_image.dart';

import '../models/case_study.dart';

class workProject extends ConsumerStatefulWidget {
  const workProject({
    super.key,
    required this.onSelectA_project,
    required this.asp,
  });

  final AssignedProjects asp;

  // final Services sr;
  final void Function(AssignedProjects apd) onSelectA_project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _workProjectState(
      ap: asp,
      onSelectA_projects: onSelectA_project,
    );
  }
}

class _workProjectState extends ConsumerState<workProject> {
  _workProjectState({
    required this.ap,
    required this.onSelectA_projects,
  });

  final AssignedProjects ap;
  final void Function(AssignedProjects apd) onSelectA_projects;

  @override
  Widget build(BuildContext context) {
    // final d = ref.watch(servicesProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: InkWell(
        onTap: () {
          onSelectA_projects(ap);
        },
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
                Text(ap.title,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(ap.country,
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Text(ap.mobile,
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Text(ap.email,
                    //maxLines: 2,
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
