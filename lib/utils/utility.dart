import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utiles {
  void toastmessege(String messege) {
    Fluttertoast.showToast(
      msg: messege,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 1,
      fontSize: 16,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
