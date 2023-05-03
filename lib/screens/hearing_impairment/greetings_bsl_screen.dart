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

class GreetingsBslScreen extends StatelessWidget {
  GreetingsBslScreen({Key? key}) : super(key: key);
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
                    'Greetings',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.05
                            : Get.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: Get.height * 0.021),
                  Text(
                    'Introduce yourself',
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
              SizedBox(height: Get.height * 0.03),
              FutureBuilder(
                  future:
                      FirebaseFirestore.instance.collection('Greetings').get(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Container(
                      height: themeController.phone
                          ? Get.height * 0.726
                          : Get.height * 0.715,
                      width: Get.width,
                      child: TabBarView(
                        children: [
                          firstPage(snapshot),
                          secondPage(snapshot),
                        ],
                      ),
                    );
                  })
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
                height: Get.height * 0.72,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.05,
                        horizontal: Get.width * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'myName') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/My1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/myName5.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/myName.png'
                                        : 'assets/seniorImages/myName.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.7,
                            color: themeController.orangeButton,
                            child: Center(
                                child: Text(
                              'Signs to say hello to people',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: themeController.phone
                                    ? Get.width * 0.04
                                    : Get.width * 0.03,
                              ),
                            )),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'hello') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Hello1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/hello.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/hello.png'
                                        : 'assets/seniorImages/hello.png',
                                height: Get.height * 0.16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'goodMorning') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Good1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/goodMorning5.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/goodMorning.png'
                                        : 'assets/seniorImages/goodMorning.png',
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
            left: Get.width * 0.475,
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

  Widget secondPage(AsyncSnapshot snapshot) {
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
                height: Get.height * 0.71,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0, horizontal: Get.width * 0.05),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.075),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++) {
                                if (snapshot.data.docs[i]['title'] ==
                                    'goodAfternoon') {
                                  Get.to(
                                    () => QuestionsVideoPlayerScreen(
                                      asset: snapshot.data.docs[i]['videoUrl'],
                                      letterAsset: 'assets/images/Good1.png',
                                    ),
                                  );
                                }
                              }
                            },
                            splashColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            child: Image.asset(
                              themeController.children
                                  ? 'assets/images/goodAfternoon5.png'
                                  : themeController.teenagers
                                      ? 'assets/teenImages/goodAfternoon.png'
                                      : 'assets/seniorImages/goodAfternoon.png',
                              height: Get.height * 0.15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.075),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++) {
                                if (snapshot.data.docs[i]['title'] ==
                                    'goodBye') {
                                  Get.to(
                                    () => QuestionsVideoPlayerScreen(
                                      asset: snapshot.data.docs[i]['videoUrl'],
                                      letterAsset: 'assets/images/Goodbye1.png',
                                    ),
                                  );
                                }
                              }
                            },
                            splashColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            child: Image.asset(
                              themeController.children
                                  ? 'assets/images/goodbye.png'
                                  : themeController.teenagers
                                      ? 'assets/teenImages/goodBye.png'
                                      : 'assets/seniorImages/goodBye.png',
                              height: Get.height * 0.15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++) {
                                if (snapshot.data.docs[i]['title'] ==
                                    'goodNight') {
                                  Get.to(
                                    () => QuestionsVideoPlayerScreen(
                                      asset: snapshot.data.docs[i]['videoUrl'],
                                      letterAsset: 'assets/images/Good1.png',
                                    ),
                                  );
                                }
                              }
                            },
                            splashColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            child: Image.asset(
                              themeController.children
                                  ? 'assets/images/goodNight5.png'
                                  : themeController.teenagers
                                      ? 'assets/teenImages/goodNight.png'
                                      : 'assets/seniorImages/goodNight.png',
                              height: Get.height * 0.15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.15,
            top: Get.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.05,
                width: Get.width * 0.7,
                color: themeController.orangeButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Signs to say goodbye to people',
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.15,
            top: Get.height * 0.0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.7,
                  color: themeController.orangeButton,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Signs to say hello to people',
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.475,
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
