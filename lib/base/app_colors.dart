import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeController themeController = Get.put(ThemeController());

class AppColors {
  static Color greenButton = themeController.children
      ? const Color(0xff90B723)
      : themeController.teenagers
          ? Colors.black
          : const Color(0xff60d1f8);
  static Color orangeButton = const Color(0xffFC9726);
}
