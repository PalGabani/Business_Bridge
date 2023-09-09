import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  final BuildContext context;

  ExitConfirmationDialog({required this.context});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Exit Confirmation"),
      content: Text("Are you sure you want to exit?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // Cancel the exit
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // Confirm the exit
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}
