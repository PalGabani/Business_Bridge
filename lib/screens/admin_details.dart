import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class admin_details extends StatefulWidget {
  @override
  State<admin_details> createState() => _admin_detailsState();
}

class _admin_detailsState extends State<admin_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Stack(
              children: [
                Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text("Details",style: TextStyle(color: Colors.white,fontSize: 30)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                                width: double.infinity,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  elevation: 3,
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.grey.withOpacity(0.35),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Executive name ",
                                                  style: TextStyle(color: Colors.white, fontSize: 15)),
                                              Text("Executive id",
                                                  style: TextStyle(color: Colors.white, fontSize: 15)),
                                              Text("Executive country",
                                                  style: TextStyle(color: Colors.white, fontSize: 15)),
                                              Text("Executive email",
                                                  //maxLines: 2,
                                                  style: TextStyle(color: Colors.white, fontSize: 15)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                )
              ],
            )
        )
    );
  }
}
