import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class services_getservice extends StatefulWidget {
  @override
  State<services_getservice> createState() => _services_getserviceState();
}

class _services_getserviceState extends State<services_getservice> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 300,
        leading: Text("  SERVICES",
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 38,
                fontFamily: AutofillHints.jobTitle)),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/services/service_detail.jpg"))),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 10),
            child: Text(
              "The Business Bridge are glad for your trust on us.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            height: 45,width: 300,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "GET IT",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .background,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),),
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.secondary,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
