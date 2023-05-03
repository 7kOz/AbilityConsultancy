import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/controllers/visual_impairment_controller.dart';
import 'package:ability_consultancy/screens/visual_impairment/total_loss_of_peripheral_vision_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisualImpairmentMainScreen extends StatelessWidget {
  VisualImpairmentMainScreen({Key? key}) : super(key: key);
  VisualImpairmentController visualImpairmentController =
      Get.put(VisualImpairmentController());
  ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: GetBuilder<VisualImpairmentController>(
            builder: (visualImpairmentController) {
              return Container(
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
                    SizedBox(height: Get.height * 0.03),
                    Spacer(),
                    Container(
                      height: Get.height * 0.80,
                      width: Get.width,
                      child: TabBarView(
                        children: [
                          firstPage(),
                          secondPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.03),
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
            height: 50,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }

  Widget firstPage() {
    return Container(
      height: Get.height * 0.807,
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
                height: Get.height * 0.775,
                width: Get.width,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          Positioned(
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
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
                          'About Visual Impairments',
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
          Positioned(
            top: Get.height * 0.125,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              onTap: () {
                Get.toNamed('totalLossOfPeripheralVisionScreen');
              },
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Total loss of peripheral vision',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.113,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/lossOfPeripheralVision.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/totalLoss.png'
                      : 'assets/seniorImages/totalLoss.png',
              height: themeController.children
                  ? Get.height * 0.125
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
            top: Get.height * 0.226,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('lossOfHalfVisionInEachEyeScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Loss of half vision in each eye',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.215,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/lossOfHalfVisionInEachEye.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/lossOfHalf1.png'
                      : 'assets/seniorImages/lossInHalf1.png',
              height: themeController.children
                  ? Get.height * 0.125
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
            top: Get.height * 0.33,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('lossOfHalfVisionInOneEyeScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Loss of half vision in one eye',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.318,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/lossOfHalfVisionInOneEye.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/lossOfHalf2.png'
                      : 'assets/seniorImages/lossInHalf2.png',
              height: themeController.children
                  ? Get.height * 0.125
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
            top: Get.height * 0.43,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('lossOfCentralVisionScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.08),
                    child: Text(
                      'Loss of central vision ',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.42,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/lossOfCentralVision.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/lossOfCentral.png'
                      : 'assets/seniorImages/lossCentral.png',
              height: themeController.children
                  ? Get.height * 0.125
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
            top: Get.height * 0.535,
            right: themeController.phone ? Get.width * 0.04 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('hazyVisionWithLightScatterScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Hazy vision with light scatter',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.525,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/hazyVisionWithLightScatter.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/hazyVision.png'
                      : 'assets/seniorImages/hazyVision.png',
              height: themeController.children
                  ? Get.height * 0.125
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
              top: Get.height * 0.66,
              left: themeController.phone ? Get.width * 0.1 : Get.width * 0.15,
              child: aboutVisualImpairmentsButton()),
          Positioned(
            top: Get.height * 0.75,
            left: Get.width * 0.46,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade700,
                  size: Get.width * 0.03,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: Get.width * 0.03,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget secondPage() {
    return Container(
      height: Get.height * 0.85,
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
                height: Get.height * 0.7,
                width: Get.width,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.125,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('patchyVisionScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.24),
                    child: Text(
                      'Patchy vision',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.113,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/patchyVision.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/patchyVision.png'
                      : 'assets/seniorImages/patchyVision.png',
              height: themeController.children
                  ? Get.height * 0.125
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
            top: Get.height * 0.226,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed(
                    'lightPerceptionInOneEyeAndPoorVisionInTheOtherScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Light perception only in one \neye & poor vision in the other',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.215,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/lightPerception.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/lightPerceptionOnly.png'
                      : 'assets/seniorImages/lightPerception1.png',
              height: themeController.children
                  ? Get.height * 0.125
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
            top: Get.height * 0.33,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('lightPerceptionInBothEyesScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Light perception in both eyes',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: themeController.children
                ? Get.height * 0.308
                : Get.height * 0.32,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/lightPerceptionInBothEyes.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/lightPerception.png'
                      : 'assets/seniorImages/lightPerceptionBoth.png',
              height: themeController.children
                  ? Get.height * 0.136
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
            top: Get.height * 0.43,
            right: themeController.phone ? Get.width * 0.05 : Get.width * 0.15,
            child: InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed('reducedClarityOfVisionScreen');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: Get.height * 0.09,
                  width:
                      themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
                  color: themeController.children || themeController.teenagers
                      ? Colors.lightBlue.shade100
                      : Colors.blueGrey.shade100,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.04),
                    child: Text(
                      'Reduced clarity of vision',
                      style: TextStyle(
                        color: themeController.children
                            ? Colors.indigo.shade800
                            : themeController.teenagers
                                ? Colors.black
                                : Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: themeController.phone
                            ? Get.width * 0.04
                            : Get.width * 0.03,
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: themeController.children
                ? Get.height * 0.41
                : Get.height * 0.422,
            left: themeController.children ? 0 : Get.width * 0.025,
            child: Image.asset(
              themeController.children
                  ? 'assets/images/reducedClarity.png'
                  : themeController.teenagers
                      ? 'assets/teenImages/reducedClarity.png'
                      : 'assets/seniorImages/reducedClarity.png',
              height: themeController.children
                  ? Get.height * 0.136
                  : Get.height * 0.107,
            ),
          ),
          Positioned(
              top: Get.height * 0.66,
              left: Get.width * 0.1,
              child: aboutVisualImpairmentsButton()),
          Positioned(
            top: Get.height * 0.75,
            left: Get.width * 0.46,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: Get.width * 0.03,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade700,
                  size: Get.width * 0.03,
                ),
              ],
            ),
          ),
          themeController.children
              ? Positioned(
                  top: 0,
                  right: Get.width * 0.1,
                  child: Image.asset(
                    'assets/images/babyStanding.png',
                    height: Get.height * 0.11,
                  ))
              : Positioned(
                  top: 0,
                  right: Get.width * 0.275,
                  child: Image.asset(
                    'assets/seniorImages/adultsSitting.png',
                    height: Get.height * 0.11,
                  )),
          Visibility(
            visible: themeController.children,
            child: Positioned(
                bottom: Get.height * 0.125,
                left: Get.width * 0.125,
                child: Image.asset(
                  'assets/images/babySitting.png',
                  height: Get.height * 0.15,
                )),
          ),
        ],
      ),
    );
  }

  Widget aboutVisualImpairmentsButton() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          Get.toNamed('aboutVisualImpairmentScreen');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.065,
            width: themeController.phone ? Get.width * 0.8 : Get.width * 0.7,
            color: themeController.greenButton,
            child: Center(
              child: Text(
                'About Visual Impairments',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: themeController.phone
                      ? Get.width * 0.045
                      : Get.width * 0.035,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
