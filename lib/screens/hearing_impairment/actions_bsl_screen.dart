import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/hearing_impairment/letters_video_player_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/questions_video_player_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ActionsBslScreen extends StatelessWidget {
  ActionsBslScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
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
              SizedBox(height: Get.height * 0.016),
              appBar(),
              Center(
                  child: Column(
                children: [
                  Text(
                    'Actions',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.045
                            : Get.width * 0.035,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Learn signs for other\npeople around you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: themeController.phone
                          ? Get.width * 0.04
                          : Get.width * 0.03,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
              SizedBox(height: Get.height * 0.028),
              FutureBuilder(
                  future:
                      FirebaseFirestore.instance.collection('Actions').get(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Container(
                      height: themeController.phone
                          ? Get.height * 0.707
                          : Get.height * 0.7,
                      width: Get.width,
                      child: TabBarView(
                        children: [
                          firstPage(snapshot),
                        ],
                      ),
                    );
                  }),
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
            height: Get.height * 0.05,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }

  Widget firstPage(AsyncSnapshot snapshot) {
    return Container(
      height: Get.height,
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
                height: Get.height * 0.675,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.1,
                        horizontal: Get.width * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'help') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Help1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/help.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/help.png'
                                        : 'assets/seniorImages/help.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'kind') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Kind1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/kind.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/kind.png'
                                        : 'assets/seniorImages/kind.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'listen') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset:
                                            'assets/images/Listen1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/listen.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/listen.png'
                                        : 'assets/seniorImages/listen.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'play') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Play1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/play.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/play.png'
                                        : 'assets/seniorImages/play.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'staySafe') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset:
                                            'assets/images/StaySafe1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/staysafe.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/staySafe.png'
                                        : 'assets/seniorImages/staySafe.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'stop') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Stop1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/stop.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/stop.png'
                                        : 'assets/seniorImages/stop.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'more') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/More1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/more.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/more.png'
                                        : 'assets/seniorImages/more.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                          ],
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
                              'Action Video',
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
            bottom: Get.height * 0.025,
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('/aboutBslScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.07,
                  width:
                      themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
                  color: themeController.greenButton,
                  child: Center(
                    child: Text(
                      'About BSL',
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
        ],
      ),
    );
  }
}
