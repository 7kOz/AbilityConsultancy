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

class FamilyBslScreen extends StatelessWidget {
  FamilyBslScreen({Key? key}) : super(key: key);
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
                    'Family',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.05
                            : Get.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
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
              SizedBox(height: Get.height * 0.02),
              FutureBuilder(
                  future: FirebaseFirestore.instance.collection('Family').get(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Container(
                      height: themeController.phone
                          ? Get.height * 0.727
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
                height: Get.height * 0.685,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.1,
                        horizontal: Get.width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'mother') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset:
                                            'assets/images/Mother1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/mother.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/mother.png'
                                        : 'assets/seniorImages/mother.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'father') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset:
                                            'assets/images/Father1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/father.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/father.png'
                                        : 'assets/seniorImages/father.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'brother') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset:
                                            'assets/images/Brother1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/brother.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/brother.png'
                                        : 'assets/seniorImages/brother.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'sister') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset:
                                            'assets/images/Sister1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/sister.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/sister.png'
                                        : 'assets/seniorImages/sister.png',
                                height: Get.height * 0.18,
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
            left: themeController.phone ? Get.width * 0.15 : Get.width * 0.20,
            top: Get.height * 0.12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.05,
                width:
                    themeController.phone ? Get.width * 0.7 : Get.width * 0.6,
                color: themeController.orangeButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Other People',
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
                              'Family Video',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: themeController.phone
                                    ? Get.width * 0.05
                                    : Get.width * 0.04,
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
            bottom: Get.height * 0.06,
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
      height: Get.height * 0.728,
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
                height: Get.height * 0.687,
                width: Get.width,
                color: Colors.grey.shade200,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.1,
                        horizontal: Get.width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'baby') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Baby1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/baby.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/baby.png'
                                        : 'assets/seniorImages/baby.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'boy') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Boy1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/boy.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/boy.png'
                                        : 'assets/seniorImages/boy.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'friends') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset:
                                            'assets/images/Friends1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/friends.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/friends.png'
                                        : 'assets/seniorImages/friends.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'girl') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Girl1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/girl.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/girl.png'
                                        : 'assets/seniorImages/girl.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'man') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Man1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/man.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/man.png'
                                        : 'assets/seniorImages/man.png',
                                height: Get.height * 0.18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] ==
                                      'woman') {
                                    Get.to(
                                      () => QuestionsVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/Woman1.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/woman.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/woman.png'
                                        : 'assets/seniorImages/woman.png',
                                height: Get.height * 0.18,
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
            left: themeController.phone ? Get.width * 0.15 : Get.width * 0.20,
            top: Get.height * 0.12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.05,
                width:
                    themeController.phone ? Get.width * 0.7 : Get.width * 0.6,
                color: themeController.orangeButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Other People',
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
                              'Family Video',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: themeController.phone
                                    ? Get.width * 0.05
                                    : Get.width * 0.04,
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
            bottom: Get.height * 0.06,
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
