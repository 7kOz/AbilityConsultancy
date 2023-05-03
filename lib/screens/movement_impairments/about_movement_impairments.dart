import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/hearing_impairment/letters_video_player_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AboutMovementImpairmentsScreen extends StatelessWidget {
  AboutMovementImpairmentsScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
              SizedBox(height: Get.height * 0.02),
              appBar(),
              Center(
                  child: Column(
                children: [
                  Text(
                    'About Mobility Issues',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Mobility difficulties can affect anyone',
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
              SizedBox(height: Get.height * 0.015),
              Container(
                height: themeController.phone
                    ? Get.height * 0.745
                    : Get.height * 0.732,
                width: Get.width,
                child: TabBarView(
                  children: [
                    firstPage(),
                    secondPage(),
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
      height: Get.height * 0.726,
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
                height: Get.height * 0.687,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.1,
                        horizontal: Get.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Physical impairment may affect someone’s mobility, their balance, and/or coordination.  Mobility issues can affect anyone, and these can be temporary or permanent.  People may have difficulties with their arms, legs or both. People who have these types of issues may find simple everyday tasks hard to carry out.',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Most people learn to adapt how they to do things, but others may need someone to help them. If the person is able to adapt things, it could still take them much longer to complete a task or activity.People with physical or mobility issues may experience difficulty getting around and undertaking simple tasks such as:',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '•	Getting dressed/doing buttons/zips\n•	Tying shoelaces\n•	Eating (cutting up food)\n•	Moving around their house safely\n•	Being able to use the shower or toilet',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Positioned(
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
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
                              'About Mobility Issues',
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
          Positioned(
            left: Get.width * 0.465,
            bottom: Get.height * 0.025,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey.shade700,
                ),
                const SizedBox(width: 5),
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget secondPage() {
    return Container(
      height: Get.height * 0.724,
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
                height: Get.height * 0.687,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.1,
                        horizontal: Get.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Other people may have more complex issues which impact on:',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '•	Using the telephone\n•	Going shopping\n•	Driving (some people have to rely on friends, public\n   transport or specialist transport services).\n•	Writing\n•	Making/preparing food\n•	Looking after their house and finances',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Some people may struggle to walk but most mobility issues are invisible',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Positioned(
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
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
                              'About Mobility Issues',
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
          Positioned(
            bottom: Get.height * 0.06,
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('/letsGetStartedMobilityScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.075,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'Lets Get Started',
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
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.465,
            bottom: Get.height * 0.025,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey.shade700,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
