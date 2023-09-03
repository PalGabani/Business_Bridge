import 'package:business_bridge/screens/login_page_user.dart';
import 'package:business_bridge/screens/sign_page_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sector_page extends StatefulWidget{
  @override
  State<sector_page> createState() => _sector_pageState();
}

class _sector_pageState extends State<sector_page> {

  List<Map<String, dynamic>> categories = [
    {"id": 1, "title": "Information Technology", "image": "assets/images/sector/cainfo.png"},
    {"id": 2, "title": "Health Care ", "image": "assets/images/sector/cahealth.png"},
    {"id": 3, "title": "Financial Services ", "image": "assets/images/sector/cafinancial.png"},
    {"id": 4, "title": "Media ", "image": "assets/images/sector/camedia.png"},
    {"id": 5, "title": "Retails ", "image": "assets/images/sector/caretail.png"},
    {"id": 6, "title": "Energy ", "image": "assets/images/sector/caenergy.png"},
    {"id": 7, "title": "Engineering ", "image": "assets/images/sector/caengineering.png"},
    {"id": 8, "title": "Tourism ", "image": "assets/images/sector/catourism.png"},
    {"id": 9, "title": "Transport ", "image": "assets/images/sector/catransport.png"},
    {"id": 10, "title": "Telecom. ", "image": "assets/images/sector/catelecom.png"},
    {"id": 11, "title": "Food Production ", "image": "assets/images/sector/cafood.png"},
    {"id": 12, "title": "Entertainment & Media ", "image": "assets/images/sector/caentertainment.png"},
    {"id": 13, "title": "Education ", "image": "assets/images/sector/caeducation.png"},
  ];

  String? cardGroupResult;

  int selected_inx = -1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Select sector"),
      ),

      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          GridView.builder(
            padding: EdgeInsets.only(left: 7,right: 7),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                childAspectRatio: 1.8,
            ),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 7,right: 7,top: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (index == selected_inx) ? Colors.black : Colors.white10,
                        width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(categories[index]["image"]),
                        fit: BoxFit.fill,
                        opacity: (index == selected_inx) ? 5 : 25 ),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected_inx = index;
                        print(categories[index]["title"]);
                        // Navigator.push(context,
                        //     MaterialPageRoute(
                        //         builder: (context) {
                        //           return Signin_page(sector:categories[index]["title"] ,);
                        //         }));
                      });
                    },
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30,right: 15),
            child:Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: 160,
              height: 55,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10))),
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff303845)
                    )),
                onPressed: () {
                  setState(() {
                    //selected_inx = index;
                   // print(categories[index]["title"]);
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) {
                              return Signin_page(sector:categories[selected_inx]["title"] ,);
                            }));
                  });
                },
                child: Text('Next', style: TextStyle(color: Colors.white,fontSize: 28),
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
