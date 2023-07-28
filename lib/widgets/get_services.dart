import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetService extends StatefulWidget {
  const GetService({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _GetServiceState();
  }
}

class _GetServiceState extends State<GetService> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Theme.of(context).colorScheme.secondary,
        decoration: BoxDecoration(
        //  image:Image.asset('assets/images/getservices.png'),
          image: DecorationImage(
            image: AssetImage('assets/images/getservices.png'),
            fit: BoxFit.fill,

          ),
          color:  Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 16, keyBoardSpace + 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //-----------------------heading -------------------------------//
              Container(
                // height: 150,
                  width: 200,
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

                  )),
              //-----------------------data information ------------------//
              Container(),
              //-----------------------button-----------------------------//
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
