import 'package:flutter/material.dart';

Widget buildErrorWidget(String error) {
  return Text('Data not received: Error $error');
}

Widget buildNoDataWidget() {
  return const Center(
    child: Text('No data available.'),
  );
}
