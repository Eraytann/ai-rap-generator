import 'package:flutter/material.dart';
import 'package:rap_generator/app/Features/screen_check.dart';
import 'package:rap_generator/app/Local/model/hive_start.dart';
import 'package:rap_generator/app/constants.dart';
import 'package:rap_generator/app/locator.dart';
import 'app/LoginCheck/user_login_check.dart';
import 'app/Navigation/navigator.dart';
import 'app/Screens/home/view/home_view.dart';
import 'app/ThemeData/theme_data.dart';

void main() async {
  screenCheck();
  setupLocator();
  localDb();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkIfUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      title: appTitle,
      navigatorKey: Navigation.navigationKey,
      home: const Scaffold(
        body: HomeView(),
      ),
    );
  }
}
