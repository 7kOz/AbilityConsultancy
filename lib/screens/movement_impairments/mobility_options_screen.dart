import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/hearing_impairment/letters_video_player_screen.dart';
import 'package:ability_consultancy/screens/movement_impairments/canteen_screen.dart';
import 'package:ability_consultancy/screens/movement_impairments/garden_screen.dart';
import 'package:ability_consultancy/screens/movement_impairments/living_room_screen.dart';
import 'package:ability_consultancy/screens/movement_impairments/living_room_tutorial.dart';
import 'package:ability_consultancy/screens/movement_impairments/office_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MobilityOptionsScreen extends StatelessWidget {
  MobilityOptionsScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/introBg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.01),
              appBar(),
              Center(
                  child: Column(
                children: [
                  Text(
                    'Mobility Issues',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Choose and learn about potential issues',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: themeController.phone
                          ? Get.width * 0.035
                          : Get.width * 0.03,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
              SizedBox(height: Get.height * 0.02),
              Container(
                height: themeController.phone
                    ? Get.height * 0.75
                    : Get.height * 0.746,
                width: Get.width,
                child: TabBarView(
                  children: [
                    firstPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: Icon(
                  CupertinoIcons.chevron_back,
                  color: Colors.white,
                  size: Get.width * 0.06,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Get.back();
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: Text(
                  'Previous',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    fontSize: themeController.phone
                        ? Get.width * 0.04
                        : Get.width * 0.03,
                  ),
                ),
              )
            ],
          ),
          Image.asset(
            'assets/images/logo.png',
            height: Get.height * 0.05,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }

  Widget firstPage() {
    return Container(
      height: Get.height * 0.4,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                height: Get.height * 0.3,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.075,
                        horizontal: Get.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Many people can suffer mobility problems, which can be temporary or permanent. Mobility issues can hinder the ability to do simple or complex tasks. People who struggle doing these tasks may suffer problems with their lower body, upper body, or both.',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: themeController.phone
                                ? Get.width * 0.035
                                : Get.width * 0.0275,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Positioned(
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            child: InkWell(
              onTap: () {
                Get.to(() => const LivingroomScreen());
              },
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: Colors.white,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: Get.height * 0.07,
                        width: themeController.phone
                            ? Get.width * 0.83
                            : Get.width * 0.73,
                        color: themeController.orangeButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Living Room',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: themeController.phone
                                      ? Get.width * 0.045
                                      : Get.width * 0.035,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            top: Get.height * 0.125,
            child: InkWell(
              onTap: () {
                Get.to(() => const GardenScreen());
              },
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: Colors.white,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: Get.height * 0.07,
                        width: themeController.phone
                            ? Get.width * 0.83
                            : Get.width * 0.73,
                        color: themeController.orangeButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Garden',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: themeController.phone
                                      ? Get.width * 0.045
                                      : Get.width * 0.035,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            top: Get.height * 0.25,
            child: InkWell(
              onTap: () {
                Get.to(() => const CanteenScreen());
              },
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: Colors.white,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: Get.height * 0.07,
                        width: themeController.phone
                            ? Get.width * 0.83
                            : Get.width * 0.73,
                        color: themeController.orangeButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Canteen',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: themeController.phone
                                      ? Get.width * 0.045
                                      : Get.width * 0.035,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            top: Get.height * 0.375,
            child: InkWell(
              onTap: () {
                Get.to(() => const OfficeScreen());
              },
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: Colors.white,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: Get.height * 0.07,
                        width: themeController.phone
                            ? Get.width * 0.83
                            : Get.width * 0.73,
                        color: themeController.orangeButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Office',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: themeController.phone
                                      ? Get.width * 0.045
                                      : Get.width * 0.035,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.035,
            left: Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('/aboutMovementImpairmentsScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.06,
                  width: Get.width * 0.7,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'About Mobility Issues',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.width * 0.045,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
