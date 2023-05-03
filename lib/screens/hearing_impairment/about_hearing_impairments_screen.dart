import 'package:ability_consultancy/base/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AboutHearingImpairmentsScreen extends StatelessWidget {
  const AboutHearingImpairmentsScreen({Key? key}) : super(key: key);

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
                    '1.5 billion people in the world experience hearing loss with 430 million people having a hearing loss that greatly impacts on their life. This figure will be a lot higher when temporary hearing loss is included.  It is estimated that 1.2 million people in the UK have a permanent hearing loss.\n\nHearing loss is when the sound and sound signals do not reach the brain.  There are two main causes - conductive hearing loss and sensorineural hearing loss.  Some people may have both.',
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
                          'About Hearing and\nCommunication Impairments',
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
                Get.toNamed('/aboutHearingImpairmentsScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: themeController.phone
                      ? Get.height * 0.1
                      : Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'Hearing & Communication\nImpairments',
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
                    'Conductive hearing loss is when there is something blocking the sound from the outer ear to the inner ear.  This is usually caused by wax or the build up of fluid.  Sensorineural hearing loss is caused by damage to the sensitive cells within the inner ear, or damage to the auditory nerve.\n\nSome people may have both causes of hearing loss.',
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
                          'About Hearing and\nCommunication Impairments',
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
                Get.toNamed('/aboutHearingImpairmentsScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.1,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'Hearing & Communication\nImpairments',
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
