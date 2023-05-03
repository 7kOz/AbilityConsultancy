import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AboutVisualImpairmentScreen extends StatelessWidget {
  AboutVisualImpairmentScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/introBg.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.02),
              appBar(),
              SizedBox(height: Get.height * 0.02),
              Center(
                child: Image.asset(
                  themeController.children
                      ? 'assets/images/visualImpairment.png'
                      : themeController.teenagers
                          ? 'assets/teenImages/eye.png'
                          : 'assets/seniorImages/eye.png',
                  height: Get.height * 0.15,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Container(
                height: themeController.phone
                    ? Get.height * 0.639
                    : Get.height * 0.634,
                width: Get.width,
                child: TabBarView(children: [
                  firstPage(),
                  secondPage(),
                  thirdPage(),
                ]),
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
              ),
            ],
          ),
          Image.asset(
            'assets/images/logo.png',
            height: Get.height * 0.04,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }

  Widget firstPage() {
    return Container(
      height: Get.height * 0.6,
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
                height: Get.height * 0.58,
                width: Get.width,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          Positioned(
            right: Get.width * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.8,
                color: Colors.white,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: Get.height * 0.07,
                      width: themeController.phone
                          ? Get.width * 0.7
                          : Get.width * 0.73,
                      color: themeController.orangeButton,
                      child: Center(
                        child: Text(
                          'About Visual Impairments',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: themeController.phone
                                ? Get.width * 0.045
                                : Get.width * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.125,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1, vertical: Get.height * 0.035),
              child: Text(
                'There are around 2.2 billion people with a\nvisual impairment in the world, with 2 million\nof those people being in the UK.\n\n250 people per day start to lose their sight in\nthe UK. The majority of people who have\nvisual impairment are over 50 years old, \nhowever visual impairments can happen at\nany age. Age Related Macular Degeneration\nis the largest cause of sight loss in the UK.',
                style: TextStyle(
                    fontSize: themeController.phone
                        ? Get.width * 0.04
                        : Get.width * 0.03,
                    color: Colors.grey.shade800),
              ),
            ),
          ),
          Positioned(
            bottom:
                themeController.phone ? Get.height * 0.075 : Get.height * 0.1,
            right: themeController.phone ? Get.width * 0.1 : Get.width * 0.15,
            child: aboutVisualImpairmentsButton(),
          ),
          Positioned(
            bottom:
                themeController.phone ? Get.height * 0.05 : Get.height * 0.05,
            left: Get.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade700,
                  size: 10,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 10,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget secondPage() {
    return Container(
      height: Get.height * 0.6,
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
                height: Get.height * 0.58,
                width: Get.width,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          Positioned(
            right: Get.width * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.8,
                color: Colors.white,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: Get.height * 0.07,
                      width: themeController.phone
                          ? Get.width * 0.7
                          : Get.width * 0.73,
                      color: themeController.orangeButton,
                      child: Center(
                        child: Text(
                          'About Visual Impairments',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: themeController.phone
                                ? Get.width * 0.045
                                : Get.width * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1, vertical: Get.height * 0.015),
              child: Text(
                'There are 25,000 children in the UK that are\nblind or partially sighted. Sight loss in\nchildren may cause other issues such as\ndelayed motor, language, emotional and\nsocial development which could lead to life\nlong issues. Many young people with visual\nimpairments can lead a full and active life\nin all areas.\n\nAdults with visual impairments may require\nextra support but are fully capable of\nworking if they are in a suitable\nemployment. They may suffer less\nproductivity but with the right support and\n adoptions this can easily be overcome.',
                style: TextStyle(
                    fontSize: themeController.phone
                        ? Get.width * 0.04
                        : Get.width * 0.03,
                    color: Colors.grey.shade800),
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.075,
            right: themeController.phone ? Get.width * 0.1 : Get.width * 0.15,
            child: aboutVisualImpairmentsButton(),
          ),
          Positioned(
            bottom: Get.height * 0.05,
            left: Get.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 10,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade700,
                  size: 10,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdPage() {
    return Container(
      height: Get.height * 0.6,
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
                height: Get.height * 0.58,
                width: Get.width,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          Positioned(
            right: Get.width * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.8,
                color: Colors.white,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: Get.height * 0.07,
                      width: themeController.phone
                          ? Get.width * 0.7
                          : Get.width * 0.73,
                      color: themeController.orangeButton,
                      child: Center(
                        child: Text(
                          'About Visual Impairments',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: themeController.phone
                                ? Get.width * 0.045
                                : Get.width * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.15,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1, vertical: Get.height * 0.015),
              child: Text(
                'Levels of sight loss can be defined as:\nMild - this is when a person\'s visual acuity\nis worse than 6/12 - 6/18\n\n Moderate - This is when a person\'s visual\nacuity is worse than 6/18 - 6/60\n\nSevere - This is when a person\'s visual\nacuity is worse than 6/30 - 3/60\nBlindness is when a person experiences\nvisual acuity worse than 3/60.',
                style: TextStyle(
                    fontSize: themeController.phone
                        ? Get.width * 0.04
                        : Get.width * 0.03,
                    color: Colors.grey.shade800),
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.075,
            right: themeController.phone ? Get.width * 0.1 : Get.width * 0.15,
            child: aboutVisualImpairmentsButton(),
          ),
          Positioned(
            bottom: Get.height * 0.05,
            left: Get.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 10,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 10,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade700,
                  size: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutVisualImpairmentsButton() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.065,
            width: themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
            color: themeController.greenButton,
            child: Center(
              child: Text(
                'Visual Impairments',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: themeController.phone
                      ? Get.width * 0.045
                      : Get.width * 0.035,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
