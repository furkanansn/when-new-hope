import 'dart:async';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whenv3/controller/AppController.dart';
import 'package:whenv3/widget/LoadingWidget.dart';

class DiscoverView extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.095192, 33.203430),
    zoom: 14.4746,
  );

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  AppController appController = Get.find();

  Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (appController.loading.value) {
        return loadingWidget(context);
      }
      return RefreshIndicator(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: DiscoverView._kGooglePlex,

              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            CarouselSlider.builder(
              itemCount: appController.discover.value.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          appController.discover.value[index].eventImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            )
          ],
        ),
        onRefresh: () async {
          await appController.refreshDiscoverData();
        },
      );
    });
  }
}
