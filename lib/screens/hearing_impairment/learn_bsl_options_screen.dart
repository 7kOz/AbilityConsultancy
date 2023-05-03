import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LearnBslOptionsScreen extends StatelessWidget {
  LearnBslOptionsScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: Get.height * 0.03),
            appBar(),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('learnBslAlphabetScreen');
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.1,
                    width: themeController.phone
                        ? Get.width * 0.75
                        : Get.width * 0.65,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.07,
                          width: themeController.phone
                              ? Get.width * 0.69
                              : Get.width * 0.59,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              'Alphabet',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
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
            ),
            SizedBox(height: Get.height * 0.015),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('questionsBslScreen');
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.1,
                    width: themeController.phone
                        ? Get.width * 0.75
                        : Get.width * 0.65,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.07,
                          width: themeController.phone
                              ? Get.width * 0.69
                              : Get.width * 0.59,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              'Questions',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
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
            ),
            SizedBox(height: Get.height * 0.015),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('familyBslScreen');
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.1,
                    width: themeController.phone
                        ? Get.width * 0.75
                        : Get.width * 0.65,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.07,
                          width: themeController.phone
                              ? Get.width * 0.69
                              : Get.width * 0.59,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              'Family',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
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
            ),
            SizedBox(height: Get.height * 0.015),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('greetingsBslScreen');
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.1,
                    width: themeController.phone
                        ? Get.width * 0.75
                        : Get.width * 0.65,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.07,
                          width: themeController.phone
                              ? Get.width * 0.69
                              : Get.width * 0.59,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              'Greetings',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
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
            ),
            SizedBox(height: Get.height * 0.015),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('mannersBslAlphabetScreen');
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.1,
                    width: themeController.phone
                        ? Get.width * 0.75
                        : Get.width * 0.65,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.07,
                          width: themeController.phone
                              ? Get.width * 0.69
                              : Get.width * 0.59,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              'Manners,Answers,& Questions',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
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
            ),
            SizedBox(height: Get.height * 0.015),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('actionsBslScreen');
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.1,
                    width: themeController.phone
                        ? Get.width * 0.75
                        : Get.width * 0.65,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.07,
                          width: themeController.phone
                              ? Get.width * 0.69
                              : Get.width * 0.59,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              'Actions',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
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
            ),
            SizedBox(height: Get.height * 0.015),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed('quizBslScreen');
                },
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.1,
                    width: themeController.phone
                        ? Get.width * 0.75
                        : Get.width * 0.65,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.07,
                          width: themeController.phone
                              ? Get.width * 0.69
                              : Get.width * 0.59,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              'Quiz',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
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
            ),
          ],
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
}
