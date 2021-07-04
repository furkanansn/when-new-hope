import 'package:get/get.dart';
import 'package:whenv3/model/HomeResponse.dart';
import 'package:whenv3/network/NetworkApi.dart';

class AppController extends GetxController{
  var home = [].obs;
  var discover = [].obs;
  var loading = false.obs;
  init() async{
    loading.value = true;
    HomeResponse homeResponse = await NetworkApi().home();
    HomeResponse discoverResponse = await NetworkApi().discover();
    home.value =  homeResponse.data;
    discover.value =  discoverResponse.data;
    loading.value = false;
  }
  refreshHomeData() async{
    HomeResponse homeResponse = await NetworkApi().home();
    home.value =  homeResponse.data;
  }
  refreshDiscoverData() async{
    HomeResponse discoverResponse = await NetworkApi().discover();
    discover.value =  discoverResponse.data;
  }

}