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

class QuestionsBslScreen extends StatelessWidget {
  QuestionsBslScreen({Key? key}) : super(key: key);
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
              SizedBox(height: Get.height * 0.03),
              appBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Questions',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: themeController.phone
                                  ? Get.width * 0.04
                                  : Get.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'How to ask common questions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: themeController.phone
                                ? Get.width * 0.04
                                : Get.width * 0.03,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.3,
                    child: Image.asset(
                      themeController.children
                          ? 'assets/images/kidOnHorse.png'
                          : themeController.teenagers
                              ? 'assets/teenImages/teensQuestion.png'
                              : 'assets/seniorImages/seniorsQuestion.png',
                      height: Get.height * 0.1,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              FutureBuilder(
                  future:
                      FirebaseFirestore.instance.collection('Questions').get(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Container(
                      height: Get.height * 0.69,
                      width: Get.width,
                      child: TabBarView(
                        children: [
                          firstPage(snapshot),
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
                height: Get.height * 0.65,
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
                                      'what') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/What1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/what.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/what.png'
                                        : 'assets/seniorImages/what.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'where') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Where1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/where.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/where.png'
                                        : 'assets/seniorImages/where.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'how') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/How1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/how.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/how.png'
                                        : 'assets/seniorImages/how.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'no') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/No1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/no.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/no.png'
                                        : 'assets/seniorImages/no.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'yes') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Yes1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/yes.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/yes.png'
                                        : 'assets/seniorImages/yes.png',
                                height: Get.height * 0.15,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'ok') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/OK1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/ok.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/ok.png'
                                        : 'assets/seniorImages/ok.png',
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
            top: 0,
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
                              'These are useful for gretting answers',
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
                  height: Get.height * 0.075,
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
