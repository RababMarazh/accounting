import 'package:accountiong/pages/add_details.dart';
import 'package:accountiong/pages/all_data.dart';
import 'package:accountiong/pages/home.dart';
import 'package:accountiong/pages/search.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    Home(),
    AddDetails(),
    Search(),
    AllData(),
  ];

  Widget get currentScreen => screens[currentIndex.value];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
