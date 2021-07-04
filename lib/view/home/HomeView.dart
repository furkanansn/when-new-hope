import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whenv3/controller/AppController.dart';
import 'package:whenv3/widget/LoadingWidget.dart';
class HomeView extends StatelessWidget {
  AppController appController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(appController.loading.value){
       return loadingWidget(context);
      }
      return RefreshIndicator(
        child: Container(
          color: Colors.black26,
          child: ListView.builder(
            itemCount: appController.home.value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 60,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height
                                / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.network(appController.home.value[index].eventImagePath,
                              fit: BoxFit.cover,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              color: Colors.grey,

                              child: Row(
                                children: [
                                  Image.network(appController.home.value[index].userVips.photo,
                                    fit: BoxFit.cover,
                                    width: 80,),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(appController.home.value[index].userVips.username),
                                  )
                                ],

                              ),),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
        onRefresh: () async{
          await appController.refreshHomeData();
        },
      );
    });
  }
}
