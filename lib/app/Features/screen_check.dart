import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void screenCheck() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
