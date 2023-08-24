import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class history_page extends StatefulWidget{
  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: SingleChildScrollView(

      ),
    );
  }
}