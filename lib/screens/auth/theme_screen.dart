import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreen extends StatelessWidget {
  ThemeScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: GetBuilder<ThemeController>(builder: (themeController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.025),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: Get.height * 0.075),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      themeController.onChildren();
                      Get.toNamed('/introScreen');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ChildrenIntro.png',
                          height: themeController.phone
                              ? Get.height * 0.15
                              : Get.height * 0.15,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(height: Get.height * 0.025),
                        Text(
                          'Children',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.045),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Get.width * 0.15),
                  InkWell(
                    splashColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      themeController.onTeenagers();
                      Get.toNamed('/introScreen');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/TeensIntro.png',
                          height: Get.height * 0.15,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(height: Get.height * 0.025),
                        Text(
                          'Teenager',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.045),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      themeController.onSeniors();
                      Get.toNamed('/introScreen');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/SeniorsIntro.png',
                          height: Get.height * 0.15,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(height: Get.height * 0.025),
                        Text(
                          'Adult',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.045),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Get.width * 0.15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/AppIntro.png',
                        height: Get.height * 0.15,
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(height: Get.height * 0.025),
                      Text(
                        'Adult',
                        style: TextStyle(
                            color: Colors.transparent,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.width * 0.045),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Texts.png',
                    height: Get.height * 0.15,
                    fit: BoxFit.fitHeight,
                  ),
                  Visibility(
                    child: Image.asset(
                      'assets/images/Texts.png',
                      height: Get.height * 0.075,
                      color: Colors.transparent,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
