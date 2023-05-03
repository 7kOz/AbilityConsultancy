import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/hearing_impairment/intro_bsl_video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HearingImpairmentMainScreen extends StatelessWidget {
  HearingImpairmentMainScreen({Key? key}) : super(key: key);
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
            SizedBox(
              height: themeController.phone
                  ? Get.height * 0.029
                  : Get.height * 0.01,
            ),
            appBar(),
            SizedBox(
              height: themeController.phone
                  ? Get.height * 0.025
                  : Get.height * 0.022,
            ),
            Center(
              child: Text(
                'Hearing & Communication\nImpairment',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  fontSize: themeController.phone
                      ? Get.width * 0.05
                      : Get.width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            FutureBuilder(
                future:
                    FirebaseFirestore.instance.collection('Greetings').get(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const SizedBox();
                  }
                  return Center(
                    child: InkWell(
                      onTap: () {
                        for (int i = 0; i < snapshot.data.docs.length; i++) {
                          if (snapshot.data.docs[i]['title'] == 'intro') {
                            Get.to(
                              () => IntroBslVideoPlayerScreen(
                                asset: snapshot.data.docs[i]['videoUrl'],
                              ),
                            );
                          }
                        }
                      },
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.1,
                          width: themeController.phone
                              ? Get.width * 0.9
                              : Get.width * 0.8,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: themeController.phone
                                            ? Get.width * 0.05
                                            : Get.width * 0.04,
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
                                          size: Get.width * 0.06,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'BSL Introduction',
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: Get.width * 0.05,
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.transparent,
                                          size: themeController.phone
                                              ? Get.width * 0.05
                                              : Get.width * 0.04,
                                        ),
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
                  );
                }),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.6,
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
                        height: Get.height * 0.582,
                        width: Get.width,
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.1,
                              horizontal: Get.width * 0.05),
                          child: Text(
                            'Hearing impairments, deafness, or hearing loss refers to the total or partial inability to hear sounds.\n\n\nDeafness may be mild, moderate, severe, or profound. A person with a mild hearing impairment may have problems understanding speech, especially if there is a lot of noise around, while those with moderate deafness may need hearing aids.',
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
                    left: themeController.phone
                        ? Get.width * 0.05
                        : Get.width * 0.1,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/learnBslOptionsScreen');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.1,
                          width: themeController.phone
                              ? Get.width * 0.9
                              : Get.width * 0.8,
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
                                    'Learn BSL',
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
                  ),
                  Positioned(
                    bottom: themeController.phone
                        ? Get.height * 0.06
                        : Get.height * 0.06,
                    left: themeController.phone
                        ? Get.width * 0.05
                        : Get.width * 0.1,
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
                          width: themeController.phone
                              ? Get.width * 0.9
                              : Get.width * 0.8,
                          color: themeController.greenButton,
                          child: Center(
                            child: Text(
                              'About Hearing and\nCommunication Impairments',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: themeController.phone
                                    ? Get.width * 0.042
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
                ],
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
