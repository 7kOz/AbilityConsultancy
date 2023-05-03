import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

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
                      ? 'assets/images/contactUsChildren.png'
                      : themeController.teenagers
                          ? 'assets/images/contactUsTeenagers.png'
                          : 'assets/images/contactUsAdults.png',
                  height: Get.height * 0.15,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Container(
                height: themeController.phone
                    ? Get.height * 0.65
                    : Get.height * 0.643,
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
                    'Ability Consultancy was created by Claire Buckle, who personally understands the difficulties of obtaining athletic opportunities. Although diagnosed with Cerebral Palsy, this hasn’t slowed her down one bit! She graduated from Manchester Metropolitan University with degrees in Business Management and Sports Studies, and was even a nationally competitive Para Athlete between 1997-2007. She’s been involved in various levels of sport for over two decades, holding roles such as Special Needs Schools Coach, Sports Development.',
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
                          'About Ability Digital',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.032,
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
              onTap: () {
                Get.back();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: themeController.phone
                      ? Get.height * 0.05
                      : Get.height * 0.05,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'Close',
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
                    'Officer, National Governing Body of Sport employee, and a Level Three Performance Coach in Athletics. Plus, she became the first person in England to obtain their coaching qualification exclusively for para athletes. With this wealth of experience and compassion, Claire is here to ensure everyone has access to sports—no matter what!',
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
                          'About Ability Digital',
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
              onTap: () {
                Get.back();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.05,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'Close',
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
