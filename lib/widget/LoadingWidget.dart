import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
Widget loadingWidget(context){
  return Column(
    children: <Widget>[
      SizedBox(height: 180,),
      Center(
        child: new Image.asset(
          "assets/logo.png",
          width: 150,
          height: 150,
        ),
      ),
      SizedBox(height: 35,),
      Center(
        child: Container(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 3,
            child: LoadingIndicator(indicatorType: Indicator.lineScalePulseOutRapid, color: Colors.purpleAccent,)),
      )

    ],
  );
}