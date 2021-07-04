import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogicController extends GetxController{
  var userInformation;
  SharedPreferences sharedPreferences;

  checkUser(context) async{
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmcwQGdtYWlsLmNvbSIsInJvbGVzIjoiUk9sRV9VU0VSIiwiaWF0IjoxNjI1MjY2NDU2LCJleHAiOjE2MjUyODQ0NTZ9.LEQWCqDBedH1TlIeocoWJrl3lnSev_Eg5RBTw5pnVAg");
      sharedPreferences.setString("id", "1");
      if(sharedPreferences.getString("id") == null){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
      else{
        Navigator.pushNamedAndRemoveUntil(context, "/bottom", (route) => false);

      }
  }

}