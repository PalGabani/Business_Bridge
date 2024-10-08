
import 'package:business_bridge/screens/about_us_page.dart';
import 'package:business_bridge/screens/admin_login.dart';
import 'package:business_bridge/screens/first_page_executive.dart';
import 'package:business_bridge/screens/privacy_policy.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../screens/login_page_user.dart';

class Popup extends StatefulWidget {
  const Popup({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _PopupState();
  }
}

class _PopupState extends State<Popup> {
  List<String> poplist = [ "Admin", "Executive","Privacy policy","About us","Help"];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert_outlined,color: Colors.white,),
      iconSize: 25,
      onSelected: (value){
        if(value=="Admin"){
          Navigator.push(
          // Navigator.pushAndRemoveUntil(

            context,
            MaterialPageRoute(
              builder: (context) {
                return admin_login();
              },
            ),
           // (route)=>false
          );
        }
        if(value=="User"){
          Navigator.push(
          //Navigator.pushAndRemoveUntil(
            //Navigator.pushanduntill
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Login_page();
                },
              ),
                 // (route)=>false
          );
        }
        if(value=="Privacy policy"){
          Navigator.push(
            //Navigator.pushAndRemoveUntil(
            //Navigator.pushanduntill
            context,
            MaterialPageRoute(
              builder: (context) {
                return privacy_policy();
              },
            ),
            // (route)=>false
          );
        }
        if(value=="Executive"){
          Navigator.pushAndRemoveUntil(
            //Navigator.pushanduntill
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Login_screen_executive();
                },
              ), (route)=>route.isFirst
          );
        }
        if(value=="About us"){
          Navigator.pushAndRemoveUntil(
            //Navigator.pushanduntill
              context,
              MaterialPageRoute(
                builder: (context) {
                  return about_us_page();
                },
              ), (route)=>route.isFirst
          );
        }
        if(value=="Help"){
          // Navigator.pushAndRemoveUntil(
          //   //Navigator.pushanduntill
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) {
          //         return Login_screen_executive();
          //       },
          //     ), (route)=>route.isFirst
          // );
        }
      },
        itemBuilder: (contex) {

      return poplist
          .map(
            (e) => PopupMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList();
    });
  }
}
