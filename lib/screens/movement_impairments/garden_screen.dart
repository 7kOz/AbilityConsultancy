import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/movement_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/movement_impairments/garden_tutorial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class GardenScreen extends StatefulWidget {
  const GardenScreen({Key? key}) : super(key: key);

  @override
  State<GardenScreen> createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {
  ThemeController themeController = Get.put(ThemeController());
  MovementController movementController = Get.put(MovementController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovementController>(builder: (movementController) {
      return movementController.garden
          ? GardenTutorial()
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
                          eightPage(),
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
            'assets/images/Farm1.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.63,
            left: Get.width * 0.79,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Steps',
                          'Replace steps with ramps or slopes. There are foldaway options available too.');
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

  Widget secondPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Farm2.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.61,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Steps',
                          'Replace steps with ramps or slopes. There are foldaway options available too.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.35,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.07,
            left: Get.width * 0.7,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Storage',
                          'Using a garden shed as storage is good, but you will need to make sure that there is no lip/step into the shed. The floor will need to be flat with slabs and it\'s sensible to have a double door to ensure it is wide enough for easy access.');
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

  Widget thirdPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Farm3.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.66,
            left: Get.width * 0.1,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Grass',
                          'As much as everyone likes real grass it can make spaces inaccessible for people with mobility issues.Laying artificial grass can support with the accessibility and be low maintenance.');
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
            top: Get.height * 0.06,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Storage',
                          'Using a garden shed as storage is good, but you will need to make sure that there is no lip/step into the shed. The floor will need to be flat with slabs and its sensible to have a double door to ensure it is wide enough for easy access.');
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
            top: Get.height * 0.16,
            left: Get.width * 0.6,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Seating',
                          'Ensure you have the ability to move one or more of the chairs out of the way. Big sofa furniture is wide and inaccessible for most. Using single chairs or small benches which can be removed easily helps accessibility.');
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

  Widget fourthPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Farm4.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.16,
            left: Get.width * 0.00,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Seating',
                          'Ensure you have the ability to move one or more of the chairs out of the way. Big sofa furniture is wide and inaccessible for most. Using single chairs or small benches which can be removed easy helps accessibility.');
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
            top: Get.height * 0.55,
            left: Get.width * 0.79,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Plants',
                          'Avoid plants with spines or thorns. People tend to have greater wellness if the plants have a smell and bright colours.');
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
            'assets/images/Farm5.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.53,
            left: Get.width * 0.00,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Plants',
                          'Avoid plants with spines or thorns. People tend to have greater wellness if the plants have a smell and bright colours.');
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
            top: Get.height * 0.83,
            left: Get.width * 0.55,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Paths',
                          'Having paths is always nice but it depends on what the path is made out of. It could make parts of the garden inaccessible. When laying a path use materials such as safety matting or rubber tarmac, rather than loose stones.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.43,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.06,
            left: Get.width * 0.8,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Lighting',
                          'It is always sensible to have some form of lighting in a garden, this could be simple floor level solar panel lights,or lights on the edge of the paths.');
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
            'assets/images/Farm6.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.04,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Lighting',
                          'It is always sensible to have some form of lighting in a garden, this could be simple floor level solar panel lights,or lights on the edge of the paths.');
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
            top: Get.height * 0.47,
            left: Get.width * 0.8,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Flowerbeds',
                          'Installing raised flowerbeds will allow people with mobility issues and wheelchair users to get involved and be hands-on within the garden. ');
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

  Widget seventhPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Farm7.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.48,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Flowerbeds',
                          'Installing raised flowerbeds will allow people with mobility issues and wheelchair users to get involved and be hands-on within the garden. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.4,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eightPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Farm8.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.33,
            left: Get.width * 0.22,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Mower',
                          'People with physical disabilities will find maintaining a garden hard. If they have grass it would be sensible to consider an automated robotic lawnmower. ');
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
}
