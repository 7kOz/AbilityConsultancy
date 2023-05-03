import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/hearing_impairment/letters_video_player_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LearnBslAlphabetScreen extends StatelessWidget {
  LearnBslAlphabetScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              SizedBox(height: Get.height * 0.025),
              appBar(),
              Center(
                  child: Column(
                children: [
                  Text(
                    'BSL Alphabet',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.045
                            : Get.width * 0.035,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Start learning the BSL alphabet now,\nby clicking on the images or the video buttons below',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: themeController.phone
                            ? Get.width * 0.035
                            : Get.width * 0.03,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
              SizedBox(height: Get.height * 0.0452),
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collectionGroup('Alphabets')
                      .get(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Container(
                      height: themeController.phone
                          ? Get.height * 0.716
                          : Get.height * 0.697,
                      width: Get.width,
                      child: TabBarView(
                        children: [
                          firstPage(snapshot),
                          secondPage(snapshot),
                          thirdPage(snapshot),
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
          horizontal: Get.width * 0.05, vertical: Get.height * 0.049),
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

  Widget firstPage(AsyncSnapshot snapshot) {
    return Container(
      height: Get.height * 0.687,
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
                height: Get.height * 0.689,
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
                                  if (snapshot.data.docs[i]['title'] == 'a') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/aa.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/aletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/a.png'
                                        : 'assets/teenImages/a.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'b') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/bb.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/bletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/b.png'
                                        : 'assets/teenImages/b.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'c') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/cc.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/cletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/c.png'
                                        : 'assets/teenImages/c.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'd') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/dd.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/dletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/d.png'
                                        : 'assets/teenImages/d.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'e') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/ee.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/eletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/e.png'
                                        : 'assets/teenImages/e.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'f') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/ff.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/fletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/f.png'
                                        : 'assets/teenImages/f.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'g') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/gg.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/gletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/g.png'
                                        : 'assets/teenImages/g.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'h') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/hh.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/hletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/h.png'
                                        : 'assets/teenImages/h.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'i') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/ii.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/iletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/icopy.png'
                                        : 'assets/seniorImages/i.png',
                                height: Get.height * 0.125,
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
            left: Get.width * 0.12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.77,
                color: Colors.white,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.7,
                      color: themeController.orangeButton,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'BSL Video',
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
            bottom: Get.height * 0.06,
            left: Get.width * 0.25,
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
                  width: Get.width * 0.5,
                  color: themeController.greenButton,
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
          Positioned(
            left: Get.width * 0.45,
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
      height: Get.height * 0.687,
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
                height: Get.height * 0.689,
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
                                  if (snapshot.data.docs[i]['title'] == 'j') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/jj.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/jletter.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/j.png'
                                        : 'assets/seniorImages/j.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'k') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/kk.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/kletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/k.png'
                                        : 'assets/teenImages/k.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'l') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/ll.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/lletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/l.png'
                                        : 'assets/teenImages/l.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'm') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/mm.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/mletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/m.png'
                                        : 'assets/teenImages/m.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'n') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/nn.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/nletter.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/n.png'
                                        : 'assets/seniorImages/n.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'o') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/oo.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/oletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/o.png'
                                        : 'assets/teenImages/o.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'p') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/pp.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/pletter.png'
                                    : themeController.teenagers
                                        ? 'assets/teenImages/p.png'
                                        : 'assets/seniorImages/p.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'q') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/qq.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/qletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/q.png'
                                        : 'assets/teenImages/q.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'r') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/rr.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/rletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/r.png'
                                        : 'assets/teenImages/r.png',
                                height: Get.height * 0.125,
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
            left: Get.width * 0.12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.77,
                color: Colors.white,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.7,
                      color: themeController.orangeButton,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'BSL Video',
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
            bottom: Get.height * 0.06,
            left: Get.width * 0.25,
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
                  width: Get.width * 0.5,
                  color: themeController.greenButton,
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
          Positioned(
            left: Get.width * 0.45,
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

  Widget thirdPage(AsyncSnapshot snapshot) {
    return Container(
      height: Get.height * 0.689,
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
                height: Get.height * 0.689,
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
                                  if (snapshot.data.docs[i]['title'] == 's') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/ss.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/sletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/s.png'
                                        : 'assets/teenImages/s.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 't') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/tt.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/tletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/t.png'
                                        : 'assets/teenImages/t.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'u') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/uu.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/uletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/u.png'
                                        : 'assets/teenImages/u.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'v') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/vv.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/vletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/v.png'
                                        : 'assets/teenImages/v.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'w') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/ww.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/wletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/w.png'
                                        : 'assets/teenImages/w.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'x') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/xx.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/xletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/x.png'
                                        : 'assets/teenImages/x.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'y') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/yy.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/yletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/y.png'
                                        : 'assets/teenImages/y.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'z') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: 'assets/images/zz.png',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/zletter.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/z.png'
                                        : 'assets/teenImages/z.png',
                                height: Get.height * 0.125,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < snapshot.data.docs.length;
                                    i++) {
                                  if (snapshot.data.docs[i]['title'] == 'all') {
                                    Get.to(
                                      () => LettersVideoPlayerScreen(
                                        asset: snapshot.data.docs[i]
                                            ['videoUrl'],
                                        letterAsset: '',
                                      ),
                                    );
                                  }
                                }
                              },
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Image.asset(
                                themeController.children
                                    ? 'assets/images/az.png'
                                    : themeController.teenagers
                                        ? 'assets/seniorImages/az.png'
                                        : 'assets/teenImages/az.png',
                                height: Get.height * 0.125,
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
            left: Get.width * 0.12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.77,
                color: Colors.white,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.7,
                      color: themeController.orangeButton,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'BSL Video',
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
            bottom: Get.height * 0.06,
            left: Get.width * 0.25,
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
                  width: Get.width * 0.5,
                  color: themeController.greenButton,
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
          Positioned(
            left: Get.width * 0.45,
            bottom: Get.height * 0.025,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 5),
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
