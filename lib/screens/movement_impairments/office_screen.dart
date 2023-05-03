import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/movement_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/movement_impairments/office_tutorial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OfficeScreen extends StatefulWidget {
  const OfficeScreen({Key? key}) : super(key: key);

  @override
  State<OfficeScreen> createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  ThemeController themeController = Get.put(ThemeController());
  MovementController movementController = Get.put(MovementController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovementController>(builder: (movementController) {
      return movementController.office
          ? OfficeTutorial()
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
                          sixth(),
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
            'assets/images/Office1.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.08,
            left: Get.width * 0.75,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Doors',
                          'If the doors are fire doors make sure these are fitted with an automated system to open them. If they are normal doors try to leave them open for wheelchair users to gain easy access.');
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
            top: Get.height * 0.75,
            left: Get.width * 0.3,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Floor Cabling',
                          'Having cables on the floor is seen as a trip hazard or a stumbling block for wheelchair users. Using under desks cable trays or an adjustable desk will keep the floor clear. ');
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

  Widget secondPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Office2.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.075,
            left: Get.width * 0.03,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Doors',
                          'If the doors are fire doors make sure these are fitted with an automated system to open them. If they are normal doors try to leave them open for wheelchair users to gain easy access.');
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

  Widget thirdPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Office3.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.62,
            left: Get.width * 0.3,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Plug sockets',
                          'Change under the desk plug sockets to desk top sockets, this will allow them to be accessible to all.');
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
            top: Get.height * 0.05,
            left: Get.width * 0.4,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Lighting',
                          'The light in an office space needs to be distributed evenly. There should be no large differences in the level of lighting, which means the light should not be too dark, or too bright in any area. Avoid glossy, shiny, and polished surfaces to keep the glare to a minimum.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.45,
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
            'assets/images/Office4.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.48,
            left: Get.width * 0.03,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Desks / Workstations',
                          'Having the option to raise or lower the height of a desk or workstation can make a positive difference to a wheelchair user. Power assisted ones can quickly be adjusted to support whoever is using the desk.');
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
            top: Get.height * 0.75,
            left: Get.width * 0.05,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Boxes / deliveries',
                          'Ensure you have a place for deliveries, allowing everything to be kept out of the way and less of a trip hazard.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.5,
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
            'assets/images/Office5.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.3,
            left: Get.width * 0.6,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Chairs',
                          'Ensure that the chairs are suitable for the person, office space and use. They should be adjustable in all ways e.g., height, arm rest, tilt etc.');
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

  Widget sixth() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Office6.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.3,
            left: Get.width * 0.03,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Chairs',
                          'Ensure that the chairs are suitable for the person, office space and use. They should be adjustable in all ways e.g., height, arm rest, tilt etc.');
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
            top: Get.height * 0.82,
            left: Get.width * 0.2,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Flooring',
                          'Make sure where possible the floors are level and choose chairs that are not in rows, or fixed, to make the area accessible.');
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

  Widget seventhPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Office7.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.26,
            left: Get.width * 0.4,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Computer Screens',
                          'Many screens are not placed at the correct height for people. Using an easily adjustable monitor arm is a simple but effective way someone can adjust their screen to help themselves.');
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
            top: Get.height * 0.55,
            left: Get.width * 0.07,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Corridors',
                          'Make sure that the corridors between desks are wide enough and clutter free.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.5,
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
            'assets/images/Office8.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.58,
            left: Get.width * 0.03,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.2,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.3,
            left: Get.width * 0.25,
            child: InkWell(
              onTap: () {},
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
