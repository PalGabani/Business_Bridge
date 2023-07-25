import 'package:business_bridge/models/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import '../models/case_study.dart';

class serviceItem extends StatelessWidget {
  const serviceItem(
      {super.key, required this.ser, required this.onSelectService});

  final Services ser;

  final void Function(Services ser) onSelectService;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      shadowColor: Colors.blueGrey,

      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: AssetImage(ser.imageUrl),
                  fit: BoxFit.fill,
                  height: 150,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    ser.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //
                      //   onPressed: () {
                      //     onSelectService(ser);
                      //   },
                      //   child: Text('Get'),
                      //
                      // ),
                      GestureDetector(
                      onTap: () {
                  onSelectService(ser);
                },
                        child: Container(
                          width: 110,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.onSecondary,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                             'Get',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color:
                                Theme.of(context).colorScheme.onTertiary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          width: 110,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:Theme.of(context).colorScheme.onTertiary  ,
                            boxShadow: [
                              // BoxShadow(
                              //   color: Theme.of(context).colorScheme.onSecondary,
                              //   spreadRadius: 2,
                              //   blurRadius: 10,
                              //   offset: Offset(0, 3),
                              // ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Know more...',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color:
                                Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      // child: InkWell(
      //   onTap: () {
      //     onSelectService(ser);
      //   },
      //   child: Stack(
      //     children: [
      //       Hero(
      //         tag: ser.id,
      //         child: FadeInImage(
      //           placeholder: MemoryImage(kTransparentImage),
      //           image: AssetImage(ser.imageUrl),
      //           fit: BoxFit.cover,
      //           height: 200,
      //           width: double.infinity,
      //         ),
      //       ),
      //       Positioned(
      //           bottom: 0,
      //           left: 0,
      //           right: 0,
      //           child: Container(
      //             color: Colors.black54,
      //             padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
      //             child: Column(
      //               children: [
      //                 Text(
      //                   ser.title,
      //                   maxLines: 2,
      //                   textAlign: TextAlign.center,
      //                   softWrap: true,
      //                   overflow: TextOverflow.ellipsis,
      //                   style: TextStyle(
      //                       fontSize: 20,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.white),
      //                 ),
      //                 const SizedBox(
      //                   height: 12,
      //                 ),
      //
      //               ],
      //             ),
      //           )),
      //     ],
      //   ),
      // ),
    );
  }
}
