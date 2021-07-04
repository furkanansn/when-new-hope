import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:whenv3/view/LoginView.dart';
import 'package:whenv3/view/bottom/SpecialBottomNavBar.dart';
import 'package:whenv3/view/logic/LogicView.dart';

void main() {
  runApp(When());
}

class When extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'When',
      initialRoute: "/logic",
      routes: {
        "/logic": (_) => LogicView(),
        "/login": (_) => LoginView(),
        "/bottom": (_) => SpecialBottomNavBar(),
      },
    );
  }
}
