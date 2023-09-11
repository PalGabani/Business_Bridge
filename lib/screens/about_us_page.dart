import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class about_us_page extends StatefulWidget{
  @override
  State<about_us_page> createState() => _about_us_pageState();
}

class _about_us_pageState extends State<about_us_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("About us",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
        ),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/workportal/workportalbg2.png'),
              fit: BoxFit.fill,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Group50.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            Text("The Business Bridge",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 480,
                padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 2
                  )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Welcome to The Business Bridge, your premier destination for top-notch business consulting services,now at your fingertips through our cutting-edge app.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "At the Business Bridge,we're passionate about helping businesses of all sizes navigate the complexities of the corporate world.With our app,we bring decades of expertise and a commitment to excellent right to your device,empowering you to make informed decisions and drive your business towards success.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "Our mission is simple yet profound: to bridge the gap between your current business status and your desired goals. We understand that every company is unique, facing its own challenges and we're here to provide customized solutions that work specifically for you.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}