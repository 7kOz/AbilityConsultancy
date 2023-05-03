import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/auth/widgets/intro_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: themeController.children
                ? const AssetImage('assets/images/MainCover.png')
                : themeController.teenagers
                    ? const AssetImage('assets/teenImages/mainCover.png')
                    : const AssetImage('assets/seniorImages/mainCover.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.45,
              width: Get.width,
            ),
            SizedBox(height: Get.height * 0.22),
            const IntroTextWidget(),
            SizedBox(
                height: themeController.phone
                    ? Get.height * 0.04
                    : Get.height * 0.02),
            Center(
              child: InkWell(
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  Get.toNamed('/createAccountScreen');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: Container(
                    height: Get.height * 0.07,
                    width: themeController.phone
                        ? Get.width * 0.9
                        : Get.width * 0.8,
                    color: themeController.greenButton,
                    child: Center(
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Get.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
