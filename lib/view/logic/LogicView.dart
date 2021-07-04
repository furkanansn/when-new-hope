import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whenv3/controller/LogicController.dart';
import 'package:whenv3/widget/LoadingWidget.dart';
class LogicView extends StatefulWidget {
  @override
  _LogicViewState createState() => _LogicViewState();
}

class _LogicViewState extends State<LogicView> {
  LogicController logicController = Get.put(LogicController());

  @override
  void initState() {
    logicController.checkUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: loadingWidget(context),
    );
  }
}
