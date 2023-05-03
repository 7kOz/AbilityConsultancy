import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/movement_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/movement_impairments/canteen_tutorial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CanteenScreen extends StatefulWidget {
  const CanteenScreen({Key? key}) : super(key: key);

  @override
  State<CanteenScreen> createState() => _CanteenScreenState();
}

class _CanteenScreenState extends State<CanteenScreen> {
  ThemeController themeController = Get.put(ThemeController());
  MovementController movementController = Get.put(MovementController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovementController>(builder: (movementController) {
      return movementController.canteen
          ? CanteenTutorial()
          : DefaultTabController(
              length: 8,
              child: Scaffold(
                body: Container(
                  height: Get.height,
                  width: Get.width,
                  child: Stack(
                    children: [
                      TabBarView(
                        children: [
                          firstPage(),
                          secondPage(),
                          thirdPage(),
                          fourthPage(),
                          fifthPage(),
                          sixthPage(),
                          seventhPage(),
                          eigthPage(),
                        ],
                      ),
                      Positioned(
                        top: Get.height * 0.02,
                        child: appBar(),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  Widget firstPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen1.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.53,
            left: Get.width * 0.3,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Chairs',
                          'First remove chairs that are not needed.  Then stow away from chairs that are not secured in rows, so that they cannot be pushed over.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.6,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen2.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.53,
            left: Get.width * 0.6,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Drink Cups',
                          'Plastic and recyclable cups are not always suitable for someone that has upper limb issues. Make sure you have a range of cups / mugs for people to use. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.35,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen3.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.53,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Drink Cups',
                          'Plastic and recyclable cups are not always suitable for someone that has upper limb issues. Make sure you have a range of cups / mugs for people to use. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.8,
            left: Get.width * 0.23,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Flooring',
                          'Suitable flooring such as lino, tiles or wood is more useful. This type of flooring is easier to clean and it always people with mobility issues move around more freely.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.6,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.05,
            left: Get.width * 0.8,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Lighting',
                          'Ensure good lighting to help people with visual impairments and general visual issues. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fourthPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen4.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.05,
            left: Get.width * 0.08,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Lighting',
                          'Ensure good lighting to help people with visual impairments and general visual issues. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.3,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.28,
            left: Get.width * 0.15,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Vending machines',
                          'Suitable ones that have larger buttons and ones that accept card payments rather than cash, as people who have upper limb issues may struggle with coins.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.5,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.57,
            left: Get.width * 0.75,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Tables',
                          'Try to ensure an accessible table – this could be one that rises and tilts, so wheelchairs can get underneath it. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.05),
      child: Container(
        width: Get.width * 0.9,
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
                  child: const Icon(
                    CupertinoIcons.chevron_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  child: const Text(
                    'Previous',
                    style: TextStyle(
                      color: Colors.transparent,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              'assets/images/logo.png',
              height: Get.height * 0.04,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }

  Widget dialogWidget(String title, String content) {
    return Center(
      child: Container(
        height: Get.height * 0.6,
        width: Get.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.4,
                    width: Get.width * 0.8,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Get.height * 0.1,
                        horizontal: Get.width * 0.05,
                      ),
                      child: Text(
                        content,
                        style: TextStyle(
                          fontSize: themeController.phone
                              ? Get.width * 0.04
                              : Get.width * 0.03,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: Get.height * 0.075,
                right: Get.width * 0.165,
                child: InkWell(
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(34),
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.5,
                      color: themeController.greenButton,
                      child: Center(
                        child: Text(
                          'Close window',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: Get.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.05,
                left: Get.width * 0.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.6,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.5,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Get.width * 0.038),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fifthPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen5.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.56,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Tables',
                          'Try to ensure an accessible table – this could be one that rises and tilts, so wheelchairs can get underneath it. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.4,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.43,
            left: Get.width * 0.3,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Trays',
                          'Make sure the trays a have nonslip surface on the bottom – this will help people carry or balance the tray on their knees.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.5,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.53,
            left: Get.width * 0.8,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Serving counter',
                          'Ensure that the serving counter is at the appropriate height so a wheelchair user can be seen and heard. Try to avoid a full see-through screen all the way down the counter – so that it allows places that food can be passed through.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sixthPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen6.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.52,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Serving counter',
                          'Ensure that the serving counter is at the appropriate height so a wheelchair user can be seen and heard. Try to avoid a full see-through screen all the way down the counter – so that it allows places that food can be passed through.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.4,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.6,
            left: Get.width * 0.3,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Spacing',
                          'Ensure enough space is between tables and serving areas to ensure everyone can pass each other safely.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.55,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget seventhPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen7.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.58,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Tables',
                          'Try to ensure an accessible table – this could be one that rises and tilts, so wheelchairs can get underneath it. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.46,
            left: Get.width * 0.2,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Trays',
                          'Make sure the trays a have nonslip surface on the bottom – this will help people carry or balance the tray on their knees.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.47,
            left: Get.width * 0.17,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Cutlery',
                          'Have a wide range of cutlery, some disabled people are unable to use plastic / wooden cutlery, so always have stainless steel sets available too.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.5,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.83,
            left: Get.width * 0.72,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Rubbish',
                          'Obstacles on the floor can be a hazard – ensure the floor areas are always clean and tidy. This will ensure that people do not trip, and wheelchairs do not get stuck.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.3,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eigthPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Canteen8.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.82,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Rubbish',
                          'Obstacles on the floor can be a hazard – ensure the floor areas are always clean and tidy. This will ensure that people do not trip, and wheelchairs do not get stuck.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
