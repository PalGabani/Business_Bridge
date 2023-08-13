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
      appBar: AppBar(
        title: Text("About us "),
      ),
    );
  }
}