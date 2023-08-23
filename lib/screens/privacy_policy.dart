import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class privacy_policy extends StatefulWidget{
  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy policy"),
      ),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }
}