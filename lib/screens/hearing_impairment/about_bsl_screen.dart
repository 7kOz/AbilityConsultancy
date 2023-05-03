import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AboutBslScreen extends StatelessWidget {
  AboutBslScreen({Key? key}) : super(key: key);
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
              SizedBox(height: Get.height * 0.03),
              appBar(),
              Center(
                child: Image.asset(
                  themeController.children
                      ? 'assets/images/hearingImpairmentIcon.png'
                      : themeController.teenagers
                          ? 'assets/teenImages/ear.png'
                          : 'assets/seniorImages/ear.png',
                  height: Get.height * 0.15,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Container(
                height: themeController.phone
                    ? Get.height * 0.65
                    : Get.height * 0.644,
                width: Get.width,
                child: TabBarView(children: [
                  firstPage(),
                  secondPage(),
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
      height: Get.height * 0.651,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                height: Get.height * 0.651,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.1, horizontal: Get.width * 0.05),
                  child: Text(
                    'BSL has been in use for hundreds of years, and was first recorded as ‘being’ used in 1644. It is the language used by over 87,000 people with a hearing impairment in the UK. Some people who do not have English as their first language use it to aid communication. \n\nBSL is a visual gestural language, it is distinctive by using hand shapes, facial expressions, or gestures. Body language plays a part to help with the meaning of what is being communicated. ',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: themeController.phone
                          ? Get.width * 0.0375
                          : Get.width * 0.03,
                    ),
                  ),
                ),
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
                      child: Center(
                        child: Text(
                          'About BSL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
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
            ),
          ),
          Positioned(
            bottom: Get.height * 0.1,
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'Hearing Impairment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
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
            bottom: Get.height * 0.05,
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
      height: Get.height * 0.651,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                height: Get.height * 0.651,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.1, horizontal: Get.width * 0.05),
                  child: Text(
                    'BSL is not an international language but in 2022 it was recognised as an official language in the UK.\n\nThere are variations of BSL around the world that will support different languages and dialects. \n\nA hearing-impaired person may use a range of communication methods. It is individual and can depending on their level of hearing loss.  Some may use BSL, lipreading, finger spelling or written text. ',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: themeController.phone
                          ? Get.width * 0.0375
                          : Get.width * 0.03,
                    ),
                  ),
                ),
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
                      child: Center(
                        child: Text(
                          'About BSL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.1,
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'Hearing Impairment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
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
            bottom: Get.height * 0.05,
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
