import 'dart:io';
import 'package:business_bridge/models/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class GetService extends ConsumerStatefulWidget {

  const GetService({
    super.key,
required this.sn,
  });

final String sn;



  @override
  ConsumerState<GetService> createState() => _GetServiceState(sen: sn);
}

class _GetServiceState extends ConsumerState<GetService> {

_GetServiceState({required this.sen});
  String date = DateFormat('MMMM dd,yyyy').format(DateTime.now());
  DateTime? selectedDate;
 String sen;

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      //final String sn='asd';
      return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Theme.of(context).colorScheme.secondary,
        decoration: BoxDecoration(
        //  image:Image.asset('assets/images/getservices.png'),
          image: DecorationImage(
            image: AssetImage('assets/images/getservices.png'),
            fit: BoxFit.fitHeight,

          ),
          color:  Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 16, keyBoardSpace + 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //-----------------------heading -------------------------------//
              Container(
                // height: 150,
                //  width: 280,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Ready ',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        Text(
                          'for a ',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        Text(
                          'Big Chance ',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,

                              fontSize: 35),
                        ),

                        Text(
                          '•-------•',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,

                              fontSize: 35),
                        ),
                      ],
                    ),
                  ),),
              //-----------------------data information ------------------//
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Service type : ",
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 16,

                            ),
                          ),
                          Expanded(
                            child: Text(
                            //' Services Name',
                                sen,
                              //textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Our Executive Name : ",
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Abhishek Malhan",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Executive Mobile no. : ",
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "+91 9865328754",
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16,

                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Assign Date : ",
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          date,
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //-----------------------button-----------------------------//
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.background,

                      )),
                  // onPressed: () {
                  //   showBottomSheet(
                  //     context: context,
                  //
                  //     builder: (BuildContext context){
                  //       return SizedBox(
                  //         height: 100,
                  //         child: Column(
                  //           children: [
                  //
                  //           ],
                  //         ),
                  //       );
                  //     }
                  //   );
                  // },
                  onPressed: (){

                  },
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
