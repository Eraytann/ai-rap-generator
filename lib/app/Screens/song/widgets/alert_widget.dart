import 'package:flutter/material.dart';
import 'package:rap_generator/app/constants.dart';

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(songAlertDialogTitle),
        content: const Text(songAlertDialogText),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(songAlertDialogButton),
          ),
        ],
      );
    },
  );
}
