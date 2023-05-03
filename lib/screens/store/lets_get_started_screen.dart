import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/about_us_screen.dart';
import 'package:ability_consultancy/screens/auth/forgot_password_screen.dart';
import 'package:ability_consultancy/screens/auth/login_screen.dart';
import 'package:ability_consultancy/screens/get_in_touch_screen.dart';
import 'package:ability_consultancy/screens/messaging/email_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LetsGetStartedScreen extends StatefulWidget {
  LetsGetStartedScreen({Key? key}) : super(key: key);

  @override
  State<LetsGetStartedScreen> createState() => _LetsGetStartedScreenState();
}

class _LetsGetStartedScreenState extends State<LetsGetStartedScreen> {
  ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgrounds.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.05,
              horizontal:
                  themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height:
                      themeController.phone ? Get.width * 0.2 : Get.width * 0.1,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: themeController.phone
                      ? Get.height * 0.08
                      : Get.height * 0.095,
                ),
                letsGetStartedText(),
                SizedBox(height: Get.height * 0.03),
                visualImpairments(),
                SizedBox(height: Get.height * 0.03),
                hearingImpairments(),
                SizedBox(height: Get.height * 0.03),
                Container(
                  height: Get.height * 0.35,
                  child: Stack(
                    children: [
                      Positioned(
                          top: Get.height * 0.01, child: mobilityIssues()),
                      Positioned(
                          top: Get.height * 0.125, child: aboutUsButton()),
                      Positioned(
                          top: Get.height * 0.225, child: getInTouchButton()),
                      Positioned(
                        top: Get.height * 0.001,
                        right: themeController.phone
                            ? Get.width * 0.075
                            : Get.width * 0.05,
                        child: themeController.children
                            ? Image.asset(
                                'assets/images/sittingKid.png',
                                height: Get.height * 0.175,
                              )
                            : const SizedBox(),
                      ),
                      Positioned(
                        bottom: Get.height * 0.001,
                        left: Get.width * 0.00001,
                        child: themeController.children
                            ? Image.asset(
                                'assets/images/standingKid.png',
                                height: Get.height * 0.225,
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget letsGetStartedText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Lets Get Started',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: Get.width * 0.05,
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Text(
          'Please select the topic below that you\nwish to learn about and have the chance to experience that type of disability.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize:
                themeController.phone ? Get.width * 0.0375 : Get.width * 0.03,
          ),
        ),
      ],
    );
  }

  Widget visualImpairments() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          Get.toNamed('/buyingOptionsScreen');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Visual Impairments',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: themeController.phone
                          ? Get.width * 0.04
                          : Get.width * 0.03,
                    ),
                  ),
                  Image.asset(
                    'assets/images/visualImpairments.png',
                    height: Get.height * 0.1,
                    width: Get.width * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget hearingImpairments() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          Get.toNamed('/buyingOptionsScreen');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hearing and communication\nimpairments',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: themeController.phone
                          ? Get.width * 0.04
                          : Get.width * 0.03,
                    ),
                  ),
                  Image.asset(
                    'assets/images/hearingImpairments.png',
                    height: Get.height * 0.1,
                    width: Get.width * 0.065,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mobilityIssues() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          Get.toNamed('/buyingOptionsScreen');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mobility Issues',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: themeController.phone
                          ? Get.width * 0.04
                          : Get.width * 0.03,
                    ),
                  ),
                  Image.asset(
                    'assets/images/mobilityIssues.png',
                    height: Get.height * 0.1,
                    width: Get.width * 0.07,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget aboutUsButton() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          Get.to(() => AboutUsScreen());
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
            color: themeController.greenButton,
            child: Center(
              child: Text(
                'About us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: themeController.phone
                      ? Get.width * 0.04
                      : Get.width * 0.03,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getInTouchButton() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          Get.to(() => GetInTouchScreen());
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
            color: themeController.greenButton,
            child: Center(
              child: Text(
                'Get in touch',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: themeController.phone
                      ? Get.width * 0.04
                      : Get.width * 0.03,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
