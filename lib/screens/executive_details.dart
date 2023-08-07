import 'package:business_bridge/screens/assign_project_page.dart';
import 'package:business_bridge/widgets/work_portal_projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/data_provider.dart';
import '../widgets/case_study.dart';

class executive_details extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
   return _executive_detailsState();
  }

}

class _executive_detailsState extends ConsumerState<executive_details> {



  @override
  Widget build(BuildContext context) {
    final serv = ref.watch(servicesProvider);

    Widget content = Container(
      height: 100,
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
    if (serv.isNotEmpty) {
      content = ListView.builder(

          itemCount: serv.length,
          itemBuilder: (ctx, index) => workProject(
           // wp:ser[index],
           // sr: serv[index],

            onSelectproject: (serv) {
              //selectMeal(context, data_st);
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
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.35),
                ),
                child: Row (
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
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abhishek Malhan",style: TextStyle(color: Colors.white,fontSize: 20)),
                          Text("India",style: TextStyle(color: Colors.white,fontSize: 15)),
                          Text("+91 9865328754",style: TextStyle(color: Colors.white,fontSize: 15)),
                          Text("abhishek113@gmail.com",maxLines: 2,style: TextStyle(color: Colors.white,fontSize: 17)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,top: 20),
              alignment: AlignmentDirectional.topStart,
              child: Text("Assigned Projects : ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height:500,
                  child: content),
            )
          ],
        ),
      ),
    );
  }
}