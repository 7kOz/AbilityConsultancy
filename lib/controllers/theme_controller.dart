import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ThemeController extends GetxController {
  bool phone = true;
  bool tablet = false;

  bool children = true;
  bool teenagers = false;
  bool seniors = false;

  Color greenButton = const Color(0xff90B723);
  Color orangeButton = const Color(0xffFC9726);

  void onPhone() {
    phone = true;
    tablet = false;
    update();
  }

  void onTablet() {
    phone = false;
    tablet = true;
    update();
  }

  void onChildren() {
    children = true;
    teenagers = false;
    seniors = false;
    greenButton = const Color(0xff90B723);
    orangeButton = const Color(0xffFC9726);
    update();
  }

  void onTeenagers() {
    children = false;
    teenagers = true;
    seniors = false;
    greenButton = const Color(0xff60d1f8);
    orangeButton = const Color(0xff0099fc);
    update();
  }

  void onSeniors() {
    children = false;
    teenagers = false;
    seniors = true;
    greenButton = const Color(0xff7a93ad);
    orangeButton = const Color(0xff5EC9F6);

    update();
  }
}
