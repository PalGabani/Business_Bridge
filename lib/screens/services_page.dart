import 'package:business_bridge/screens/services_getservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class services_page extends StatefulWidget {
  @override
  State<services_page> createState() => _services_pageState();
}

class _services_pageState extends State<services_page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 300,
        leading: Text("  SERVICES",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold, fontSize: 38,fontFamily: AutofillHints.jobTitle)),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/services/service_upscale.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          padding: EdgeInsets.all(6),
                          child: Text(" Upscale Your Business",
                              style: TextStyle(fontSize: 28)),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: 140,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    backgroundColor: MaterialStatePropertyAll(
                                      Theme.of(context).colorScheme.secondary,
                                    )),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (contex) {
                                    return services_getservice();
                                  },));
                                },
                                child: Text(
                                  'Get',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Know More..',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
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
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/services/service_financial.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          padding: EdgeInsets.all(6),
                          child: Text(" Financial Solution",
                              style: TextStyle(fontSize: 28)),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: 140,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.secondary,
                                  ),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Text('Get',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Know More..',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
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
            Container(
              padding:
              EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/services/service_takeover.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          padding: EdgeInsets.all(6),
                          child: Text(" Take Over The Business",
                              style: TextStyle(fontSize: 28)),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: 140,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.secondary,
                                  ),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Text('Get',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Know More..',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
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
          ],
        ),
      ),
    );
  }
}
