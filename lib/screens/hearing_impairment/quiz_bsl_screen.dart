import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/quiz_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/hearing_impairment/letters_video_player_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class QuizBslScreen extends StatelessWidget {
  QuizBslScreen({Key? key}) : super(key: key);

  QuizController quizController = Get.put(QuizController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (quizController) {
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
            child: quizController.result == true
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
                    child: Stack(
                      children: [
                        quizController.answers
                                    .where((item) => item == true)
                                    .length <=
                                3
                            ? Center(
                                child: Image.asset(
                                  'assets/images/congratsless.png',
                                  height: Get.height * 0.9,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Positioned(
                                top: Get.height * 0.05,
                                right: themeController.phone
                                    ? Get.width * 0.0
                                    : Get.width * 0.18,
                                child: Image.asset(
                                  'assets/images/congratsmore.png',
                                  height: Get.height * 0.8,
                                  fit: BoxFit.fill,
                                ),
                              ),
                        Positioned(
                          left: Get.width * 0.5,
                          bottom: Get.height * 0.2,
                          child: Text(
                            '${quizController.answers.where((item) => item == true).length} / 7',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: themeController.phone
                                  ? Get.width * 0.05
                                  : Get.width * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.016),
                      appBar(),
                      Center(
                          child: Column(
                        children: [
                          Text(
                            'BSL Quiz',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: themeController.phone
                                    ? Get.width * 0.065
                                    : Get.width * 0.05,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Questions ${quizController.questionCount}-7',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: themeController.phone
                                  ? Get.width * 0.045
                                  : Get.width * 0.035,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                      SizedBox(height: Get.height * 0.03),
                      Container(
                        height: themeController.phone
                            ? Get.height * 0.725
                            : Get.height * 0.718,
                        width: Get.width,
                        child: TabBarView(
                          children: [
                            firstPage(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
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
                    fontSize: Get.width * 0.04,
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

  Widget firstPage() {
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
                      vertical: Get.height * 0.1, horizontal: Get.width * 0.05),
                  child: quizController.question1 == true
                      ? Column(
                          children: [
                            SizedBox(height: Get.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    quizController.onAnswerOne(false);
                                  },
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  child: Image.asset(
                                    themeController.children
                                        ? 'assets/images/quizq1.png'
                                        : themeController.teenagers
                                            ? 'assets/teenImages/q1.png'
                                            : 'assets/seniorImages/q1.png',
                                    height: Get.height * 0.15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    quizController.onAnswerOne(true);
                                  },
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  child: Image.asset(
                                    themeController.children
                                        ? 'assets/images/quizq2.png'
                                        : themeController.teenagers
                                            ? 'assets/teenImages/q2.png'
                                            : 'assets/seniorImages/q2.png',
                                    height: Get.height * 0.15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    quizController.onAnswerOne(false);
                                  },
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  child: Image.asset(
                                    themeController.children
                                        ? 'assets/images/quizq3.png'
                                        : themeController.teenagers
                                            ? 'assets/teenImages/q3.png'
                                            : 'assets/seniorImages/q3.png',
                                    height: Get.height * 0.15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    quizController.onAnswerOne(false);
                                  },
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  child: Image.asset(
                                    themeController.children
                                        ? 'assets/images/quizq4.png'
                                        : themeController.teenagers
                                            ? 'assets/teenImages/q4.png'
                                            : 'assets/seniorImages/q4.png',
                                    height: Get.height * 0.15,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        )
                      : quizController.question2 == true
                          ? Column(
                              children: [
                                SizedBox(height: Get.height * 0.05),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      themeController.children
                                          ? 'assets/images/quizq5.png'
                                          : themeController.teenagers
                                              ? 'assets/teenImages/q5.png'
                                              : 'assets/seniorImages/q5.png',
                                      height: Get.height * 0.15,
                                    ),
                                  ],
                                ),
                                SizedBox(height: Get.height * 0.05),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          quizController.onAnswerTwo(false);
                                        },
                                        splashColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            height: Get.height * 0.05,
                                            width: Get.width * 0.3,
                                            color: themeController.greenButton,
                                            child: const Center(
                                              child: Text(
                                                'Z',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        )),
                                    InkWell(
                                        onTap: () {
                                          quizController.onAnswerTwo(false);
                                        },
                                        splashColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            height: Get.height * 0.05,
                                            width: Get.width * 0.3,
                                            color: themeController.greenButton,
                                            child: const Center(
                                              child: Text(
                                                'D',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: Get.height * 0.02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          quizController.onAnswerTwo(true);
                                        },
                                        splashColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            height: Get.height * 0.05,
                                            width: Get.width * 0.3,
                                            color: themeController.greenButton,
                                            child: const Center(
                                              child: Text(
                                                'A',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        quizController.onAnswerTwo(false);
                                      },
                                      splashColor: Colors.transparent,
                                      splashFactory: NoSplash.splashFactory,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.3,
                                          color: themeController.greenButton,
                                          child: const Center(
                                            child: Text(
                                              'E',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    quizController.answers[0] == true
                                        ? Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: Get.width * 0.075,
                                          )
                                        : Icon(
                                            CupertinoIcons.xmark_circle,
                                            color: Colors.red,
                                            size: Get.width * 0.075,
                                          ),
                                  ],
                                )
                              ],
                            )
                          : quizController.question3 == true
                              ? Column(
                                  children: [
                                    SizedBox(height: Get.height * 0.05),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            quizController.onAnswerThree(false);
                                          },
                                          splashColor: Colors.transparent,
                                          splashFactory: NoSplash.splashFactory,
                                          child: Image.asset(
                                            themeController.children
                                                ? 'assets/images/quizq6.png'
                                                : themeController.teenagers
                                                    ? 'assets/teenImages/q6.png'
                                                    : 'assets/seniorImages/q6.png',
                                            height: Get.height * 0.15,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            quizController.onAnswerThree(false);
                                          },
                                          splashColor: Colors.transparent,
                                          splashFactory: NoSplash.splashFactory,
                                          child: Image.asset(
                                            themeController.children
                                                ? 'assets/images/quizq7.png'
                                                : themeController.teenagers
                                                    ? 'assets/teenImages/q7.png'
                                                    : 'assets/seniorImages/q7.png',
                                            height: Get.height * 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Get.height * 0.05),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            quizController.onAnswerThree(false);
                                          },
                                          splashColor: Colors.transparent,
                                          splashFactory: NoSplash.splashFactory,
                                          child: Image.asset(
                                            themeController.children
                                                ? 'assets/images/quizq8.png'
                                                : themeController.teenagers
                                                    ? 'assets/teenImages/q8.png'
                                                    : 'assets/seniorImages/q8.png',
                                            height: Get.height * 0.15,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            quizController.onAnswerThree(true);
                                          },
                                          splashColor: Colors.transparent,
                                          splashFactory: NoSplash.splashFactory,
                                          child: Image.asset(
                                            themeController.children
                                                ? 'assets/images/quizq9.png'
                                                : themeController.teenagers
                                                    ? 'assets/teenImages/q9.png'
                                                    : 'assets/seniorImages/q9.png',
                                            height: Get.height * 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        quizController.answers[0] == true
                                            ? Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                                size: Get.width * 0.075,
                                              )
                                            : Icon(
                                                CupertinoIcons.xmark_circle,
                                                color: Colors.red,
                                                size: Get.width * 0.075,
                                              ),
                                        SizedBox(width: 5),
                                        quizController.answers[1] == true
                                            ? Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                                size: Get.width * 0.075,
                                              )
                                            : Icon(
                                                CupertinoIcons.xmark_circle,
                                                color: Colors.red,
                                                size: Get.width * 0.075,
                                              ),
                                      ],
                                    )
                                  ],
                                )
                              : quizController.question4 == true
                                  ? Column(
                                      children: [
                                        SizedBox(height: Get.height * 0.05),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                quizController
                                                    .onAnswerFour(false);
                                              },
                                              splashColor: Colors.transparent,
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              child: Image.asset(
                                                themeController.children
                                                    ? 'assets/images/quizq10.png'
                                                    : themeController.teenagers
                                                        ? 'assets/teenImages/q10.png'
                                                        : 'assets/seniorImages/q10.png',
                                                height: Get.height * 0.15,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                quizController
                                                    .onAnswerFour(false);
                                              },
                                              splashColor: Colors.transparent,
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              child: Image.asset(
                                                themeController.children
                                                    ? 'assets/images/quizq11.png'
                                                    : themeController.teenagers
                                                        ? 'assets/teenImages/q11.png'
                                                        : 'assets/seniorImages/q11.png',
                                                height: Get.height * 0.15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Get.height * 0.05),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                quizController
                                                    .onAnswerFour(false);
                                              },
                                              splashColor: Colors.transparent,
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              child: Image.asset(
                                                themeController.children
                                                    ? 'assets/images/quizq12.png'
                                                    : themeController.teenagers
                                                        ? 'assets/teenImages/q12.png'
                                                        : 'assets/seniorImages/q12.png',
                                                height: Get.height * 0.15,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                quizController
                                                    .onAnswerFour(true);
                                              },
                                              splashColor: Colors.transparent,
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              child: Image.asset(
                                                themeController.children
                                                    ? 'assets/images/quizq13.png'
                                                    : themeController.teenagers
                                                        ? 'assets/teenImages/q13.png'
                                                        : 'assets/seniorImages/q13.png',
                                                height: Get.height * 0.15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            quizController.answers[0] == true
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                    size: Get.width * 0.075,
                                                  )
                                                : Icon(
                                                    CupertinoIcons.xmark_circle,
                                                    color: Colors.red,
                                                    size: Get.width * 0.075,
                                                  ),
                                            SizedBox(width: 5),
                                            quizController.answers[1] == true
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                    size: Get.width * 0.075,
                                                  )
                                                : Icon(
                                                    CupertinoIcons.xmark_circle,
                                                    color: Colors.red,
                                                    size: Get.width * 0.075,
                                                  ),
                                            SizedBox(width: 5),
                                            quizController.answers[2] == true
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                    size: Get.width * 0.075,
                                                  )
                                                : Icon(
                                                    CupertinoIcons.xmark_circle,
                                                    color: Colors.red,
                                                    size: Get.width * 0.075,
                                                  ),
                                          ],
                                        )
                                      ],
                                    )
                                  : quizController.question5 == true
                                      ? Column(
                                          children: [
                                            SizedBox(height: Get.height * 0.05),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    quizController
                                                        .onAnswerFive(true);
                                                  },
                                                  splashColor:
                                                      Colors.transparent,
                                                  splashFactory:
                                                      NoSplash.splashFactory,
                                                  child: Image.asset(
                                                    themeController.children
                                                        ? 'assets/images/quizq14.png'
                                                        : themeController
                                                                .teenagers
                                                            ? 'assets/teenImages/q14.png'
                                                            : 'assets/seniorImages/q14.png',
                                                    height: Get.height * 0.15,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    quizController
                                                        .onAnswerFive(false);
                                                  },
                                                  splashColor:
                                                      Colors.transparent,
                                                  splashFactory:
                                                      NoSplash.splashFactory,
                                                  child: Image.asset(
                                                    themeController.children
                                                        ? 'assets/images/quizq15.png'
                                                        : themeController
                                                                .teenagers
                                                            ? 'assets/teenImages/q15.png'
                                                            : 'assets/seniorImages/q15.png',
                                                    height: Get.height * 0.15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: Get.height * 0.05),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    quizController
                                                        .onAnswerFive(false);
                                                  },
                                                  splashColor:
                                                      Colors.transparent,
                                                  splashFactory:
                                                      NoSplash.splashFactory,
                                                  child: Image.asset(
                                                    themeController.children
                                                        ? 'assets/images/quizq16.png'
                                                        : themeController
                                                                .teenagers
                                                            ? 'assets/teenImages/q16.png'
                                                            : 'assets/seniorImages/q16.png',
                                                    height: Get.height * 0.15,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    quizController
                                                        .onAnswerFive(false);
                                                  },
                                                  splashColor:
                                                      Colors.transparent,
                                                  splashFactory:
                                                      NoSplash.splashFactory,
                                                  child: Image.asset(
                                                    themeController.children
                                                        ? 'assets/images/quizq17.png'
                                                        : themeController
                                                                .teenagers
                                                            ? 'assets/teenImages/q17.png'
                                                            : 'assets/seniorImages/q17.png',
                                                    height: Get.height * 0.15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                quizController.answers[0] ==
                                                        true
                                                    ? Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                        size: Get.width * 0.075,
                                                      )
                                                    : Icon(
                                                        CupertinoIcons
                                                            .xmark_circle,
                                                        color: Colors.red,
                                                        size: Get.width * 0.075,
                                                      ),
                                                SizedBox(width: 5),
                                                quizController.answers[1] ==
                                                        true
                                                    ? Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                        size: Get.width * 0.075,
                                                      )
                                                    : Icon(
                                                        CupertinoIcons
                                                            .xmark_circle,
                                                        color: Colors.red,
                                                        size: Get.width * 0.075,
                                                      ),
                                                SizedBox(width: 5),
                                                quizController.answers[2] ==
                                                        true
                                                    ? Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                        size: Get.width * 0.075,
                                                      )
                                                    : Icon(
                                                        CupertinoIcons
                                                            .xmark_circle,
                                                        color: Colors.red,
                                                        size: Get.width * 0.075,
                                                      ),
                                                SizedBox(width: 5),
                                                quizController.answers[3] ==
                                                        true
                                                    ? Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                        size: Get.width * 0.075,
                                                      )
                                                    : Icon(
                                                        CupertinoIcons
                                                            .xmark_circle,
                                                        color: Colors.red,
                                                        size: Get.width * 0.075,
                                                      ),
                                              ],
                                            )
                                          ],
                                        )
                                      : quizController.question6 == true
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                    height: Get.height * 0.05),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      themeController.children
                                                          ? 'assets/images/quizq18.png'
                                                          : themeController
                                                                  .teenagers
                                                              ? 'assets/teenImages/q18.png'
                                                              : 'assets/seniorImages/q18.png',
                                                      height: Get.height * 0.15,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: Get.height * 0.05),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          quizController
                                                              .onAnswerSix(
                                                                  false);
                                                        },
                                                        splashColor:
                                                            Colors.transparent,
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Container(
                                                            height: Get.height *
                                                                0.05,
                                                            width:
                                                                Get.width * 0.3,
                                                            color:
                                                                themeController
                                                                    .greenButton,
                                                            child: const Center(
                                                              child: Text(
                                                                'Holiday',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                    InkWell(
                                                        onTap: () {
                                                          quizController
                                                              .onAnswerSix(
                                                                  false);
                                                        },
                                                        splashColor:
                                                            Colors.transparent,
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Container(
                                                            height: Get.height *
                                                                0.05,
                                                            width:
                                                                Get.width * 0.3,
                                                            color:
                                                                themeController
                                                                    .greenButton,
                                                            child: const Center(
                                                              child: Text(
                                                                'House',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: Get.height * 0.02),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          quizController
                                                              .onAnswerSix(
                                                                  false);
                                                        },
                                                        splashColor:
                                                            Colors.transparent,
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Container(
                                                            height: Get.height *
                                                                0.05,
                                                            width:
                                                                Get.width * 0.3,
                                                            color:
                                                                themeController
                                                                    .greenButton,
                                                            child: const Center(
                                                              child: Text(
                                                                'Listen',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                    InkWell(
                                                      onTap: () {
                                                        quizController
                                                            .onAnswerSix(true);
                                                      },
                                                      splashColor:
                                                          Colors.transparent,
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Container(
                                                          height:
                                                              Get.height * 0.05,
                                                          width:
                                                              Get.width * 0.3,
                                                          color: themeController
                                                              .greenButton,
                                                          child: const Center(
                                                            child: Text(
                                                              'More',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    quizController.answers[0] ==
                                                            true
                                                        ? Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                            size: Get.width *
                                                                0.075,
                                                          )
                                                        : Icon(
                                                            CupertinoIcons
                                                                .xmark_circle,
                                                            color: Colors.red,
                                                            size: Get.width *
                                                                0.075,
                                                          ),
                                                    SizedBox(width: 5),
                                                    quizController.answers[1] ==
                                                            true
                                                        ? Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                            size: Get.width *
                                                                0.075,
                                                          )
                                                        : Icon(
                                                            CupertinoIcons
                                                                .xmark_circle,
                                                            color: Colors.red,
                                                            size: Get.width *
                                                                0.075,
                                                          ),
                                                    SizedBox(width: 5),
                                                    quizController.answers[2] ==
                                                            true
                                                        ? Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                            size: Get.width *
                                                                0.075,
                                                          )
                                                        : Icon(
                                                            CupertinoIcons
                                                                .xmark_circle,
                                                            color: Colors.red,
                                                            size: Get.width *
                                                                0.075,
                                                          ),
                                                    SizedBox(width: 5),
                                                    quizController.answers[3] ==
                                                            true
                                                        ? Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                            size: Get.width *
                                                                0.075,
                                                          )
                                                        : Icon(
                                                            CupertinoIcons
                                                                .xmark_circle,
                                                            color: Colors.red,
                                                            size: Get.width *
                                                                0.075,
                                                          ),
                                                    SizedBox(width: 5),
                                                    quizController.answers[4] ==
                                                            true
                                                        ? Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                            size: Get.width *
                                                                0.075,
                                                          )
                                                        : Icon(
                                                            CupertinoIcons
                                                                .xmark_circle,
                                                            color: Colors.red,
                                                            size: Get.width *
                                                                0.075,
                                                          ),
                                                  ],
                                                )
                                              ],
                                            )
                                          : quizController.question7 == true
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                        height:
                                                            Get.height * 0.05),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            quizController
                                                                .onResult(
                                                                    false);
                                                          },
                                                          splashColor: Colors
                                                              .transparent,
                                                          splashFactory: NoSplash
                                                              .splashFactory,
                                                          child: Image.asset(
                                                            themeController
                                                                    .children
                                                                ? 'assets/images/quizq19.png'
                                                                : themeController
                                                                        .teenagers
                                                                    ? 'assets/teenImages/q19.png'
                                                                    : 'assets/seniorImages/q19.png',
                                                            height: Get.height *
                                                                0.15,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            quizController
                                                                .onResult(true);
                                                          },
                                                          splashColor: Colors
                                                              .transparent,
                                                          splashFactory: NoSplash
                                                              .splashFactory,
                                                          child: Image.asset(
                                                            themeController
                                                                    .children
                                                                ? 'assets/images/quizq20.png'
                                                                : themeController
                                                                        .teenagers
                                                                    ? 'assets/teenImages/q20.png'
                                                                    : 'assets/seniorImages/q20.png',
                                                            height: Get.height *
                                                                0.15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            Get.height * 0.05),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            quizController
                                                                .onResult(
                                                                    false);
                                                          },
                                                          splashColor: Colors
                                                              .transparent,
                                                          splashFactory: NoSplash
                                                              .splashFactory,
                                                          child: Image.asset(
                                                            themeController
                                                                    .children
                                                                ? 'assets/images/quizq21.png'
                                                                : themeController
                                                                        .teenagers
                                                                    ? 'assets/teenImages/q21.png'
                                                                    : 'assets/seniorImages/q21.png',
                                                            height: Get.height *
                                                                0.15,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            quizController
                                                                .onResult(
                                                                    false);
                                                          },
                                                          splashColor: Colors
                                                              .transparent,
                                                          splashFactory: NoSplash
                                                              .splashFactory,
                                                          child: Image.asset(
                                                            themeController
                                                                    .children
                                                                ? 'assets/images/quizq22.png'
                                                                : themeController
                                                                        .teenagers
                                                                    ? 'assets/teenImages/q22.png'
                                                                    : 'assets/seniorImages/q22.png',
                                                            height: Get.height *
                                                                0.15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        quizController.answers[
                                                                    0] ==
                                                                true
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: Colors
                                                                    .green,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              )
                                                            : Icon(
                                                                CupertinoIcons
                                                                    .xmark_circle,
                                                                color:
                                                                    Colors.red,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              ),
                                                        SizedBox(width: 5),
                                                        quizController.answers[
                                                                    1] ==
                                                                true
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: Colors
                                                                    .green,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              )
                                                            : Icon(
                                                                CupertinoIcons
                                                                    .xmark_circle,
                                                                color:
                                                                    Colors.red,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              ),
                                                        SizedBox(width: 5),
                                                        quizController.answers[
                                                                    2] ==
                                                                true
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: Colors
                                                                    .green,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              )
                                                            : Icon(
                                                                CupertinoIcons
                                                                    .xmark_circle,
                                                                color:
                                                                    Colors.red,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              ),
                                                        SizedBox(width: 5),
                                                        quizController.answers[
                                                                    3] ==
                                                                true
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: Colors
                                                                    .green,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              )
                                                            : Icon(
                                                                CupertinoIcons
                                                                    .xmark_circle,
                                                                color:
                                                                    Colors.red,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              ),
                                                        SizedBox(width: 5),
                                                        quizController.answers[
                                                                    4] ==
                                                                true
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: Colors
                                                                    .green,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              )
                                                            : Icon(
                                                                CupertinoIcons
                                                                    .xmark_circle,
                                                                color:
                                                                    Colors.red,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              ),
                                                        SizedBox(width: 5),
                                                        quizController.answers[
                                                                    5] ==
                                                                true
                                                            ? Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: Colors
                                                                    .green,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              )
                                                            : Icon(
                                                                CupertinoIcons
                                                                    .xmark_circle,
                                                                color:
                                                                    Colors.red,
                                                                size:
                                                                    Get.width *
                                                                        0.075,
                                                              ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              : Container(),
                ),
              ),
            ),
          ),
          Positioned(
            left: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            child: Stack(
              children: [
                ClipRRect(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    quizController.question,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: themeController.phone
                                          ? Get.width * 0.045
                                          : Get.width * 0.035,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
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
                Positioned(
                  right: 0,
                  top: Get.height * 0.005,
                  child: Image.asset(
                    'assets/images/timer.png',
                    height: Get.height * 0.1,
                  ),
                ),
                Positioned(
                    right: themeController.phone
                        ? Get.width * 0.08
                        : Get.width * 0.05,
                    top: Get.height * 0.04,
                    child: Text(
                      '${quizController.currentTimer}s',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
