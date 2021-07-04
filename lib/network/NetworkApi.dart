import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whenv3/model/AuthResponse.dart';
import 'package:whenv3/model/HomeResponse.dart';
import 'package:whenv3/util/Static.dart';
class NetworkApi{

  getUrl(String url){
    return Uri.parse(URL + url);
  }
  
  getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }
  login({String email, String password}) async{
    final response = await http.post(getUrl("api/token/auth"),
        headers: {
      "Content-Type" :"application/json"
        },
        body: jsonEncode({
      "email": email,
      "password": password
    }
    ));
    AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(response.body));
    if(authResponse == null){
      authResponse.success = false;
    }
    else{
      if(authResponse.success){
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString("token", authResponse.data.accessToken);
          sharedPreferences.setString("id", authResponse.data.id.toString());
      }
    }
    return authResponse;
  }
  register({String email, String password,String username}) async{
    final response = await http.post(getUrl("api/token/register"),
        headers: {
          "Content-Type" :"application/json"
        },
        body: jsonEncode({
          "email": email,
          "password": password,
          "userName": username
        }));
    AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(response.body));
    if(authResponse == null){
      authResponse.success = false;
    }
    return authResponse;
  }
  forgotPassword({String email}) async{
    final response = await http.get(getUrl("api/token/forgot-password"),
      headers: {
        "Content-Type" :"application/json"
      },);
    return response.body;
  }

  Future<HomeResponse> home() async{

    final response = await http.get(getUrl("api/events/v1/house/initialize"),
    headers: {
      "Authorization" : await getToken(),
        "Content-Type" :"application/json"

    });
    return HomeResponse.fromJson(jsonDecode(response.body));

  }
  Future<HomeResponse> discover() async{

    final response = await http.get(getUrl("api/events/v1/discover/cyprus"),
        headers: {
          "Authorization" : await getToken(),
          "Content-Type" :"application/json"
        });
    return HomeResponse.fromJson(jsonDecode(response.body));

  }
}