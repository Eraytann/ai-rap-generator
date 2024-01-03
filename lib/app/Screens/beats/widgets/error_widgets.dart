import 'package:flutter/material.dart';
import 'package:rap_generator/app/Constants/text_class.dart';

Widget buildErrorWidget(String error) {
  return Text('$dataError $error');
}

Widget buildNoDataWidget() {
  return const Center(
    child: Text(dataDidNotFound),
  );
}
