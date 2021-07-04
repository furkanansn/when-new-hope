import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whenv3/controller/AppController.dart';
import 'package:whenv3/util/CloseKeyboard.dart';
import 'package:whenv3/view/discover/DiscoverView.dart';
import 'package:whenv3/view/home/HomeView.dart';


class SpecialBottomNavBar extends StatefulWidget {

  @override
  _SpecialBottomNavBarState createState() => _SpecialBottomNavBarState();
}

class _SpecialBottomNavBarState extends State<SpecialBottomNavBar> {
  int _currentIndex = 0;
  String title = "Takipçiler";
  AppController appController = Get.put(AppController());
  @override
  void initState() {
    log("started");
    keyboardHide();
    appController.init();

    super.initState();
  }

  void _onTabChanged(int index) {

    this.setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _tabWidgets = [
    HomeView(),
    DiscoverView(),
    HomeView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:_tabWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.white),
        elevation: 1,
        iconSize: 25,
        currentIndex: _currentIndex,
        onTap: (index) {
          this._onTabChanged(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "",
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "",
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "",
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
      ),

    );
  }


}