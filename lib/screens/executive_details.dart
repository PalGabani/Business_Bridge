import 'package:business_bridge/models/assign_page_projects.dart';
import 'package:business_bridge/models/assign_project_details.dart';
import 'package:business_bridge/screens/assign_project_page.dart';
import 'package:business_bridge/widgets/work_portal_projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/data_provider.dart';
import '../widgets/case_study.dart';

class executive_details extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _executive_detailsState();
  }
}

class _executive_detailsState extends ConsumerState<executive_details> {
  @override
  Widget build(BuildContext context, ) {
    final ap = ref.watch(assignedprojectsProvider);
    //final ap=ref.watch(projectProvider);

// final apd=ref.watch(assignprojectdetailProvider);

    Widget content = Container(
      // height: 100,
      child: Center(
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
      ),
    );
    void selectpro(BuildContext context, AssignedProject ap, ) {
      List<Map<String, String>> step=ap.details12;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => assign_project_page(apd: ap,finalSteps: step,),),);
    }

    if (ap.isNotEmpty) {
      content = ListView.builder(
          itemCount: ap.length,
          itemBuilder: (ctx, index) => workProject(

                asp: ap[index],

            onSelectA_project: (asp) {
                  // if(asp.id==apd.id){}
              selectpro(context, asp);
                },
              ));
    }

    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Work Portal",
            style: TextStyle(
              color: Colors.white,
            )),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/workportal/workportalbg2.png',
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.saturation),
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //----------------------------------name upper part ------------------------//
                  SizedBox(
                    height: 110,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.35),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Abhishek Malhan",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                Text("India",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                Text("+91 9865328754",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                Text("abhishek113@gmail.com",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //-------------------------------projects assign part------------------//
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.only(left: 20, top: 20,bottom: 5),
                          alignment: AlignmentDirectional.topStart,
                          child: Text("Assigned Projects : ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        ),

                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: content,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20,right: 20),
                        //   child: Expanded(
                        //     child: Container(
                        //         color: Colors.blueGrey,
                        //         // height: 460,
                        //
                        //         child: content),
                        //   ),
                        // ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
