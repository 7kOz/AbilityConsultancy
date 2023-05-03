import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/movement_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/movement_impairments/living_room_tutorial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LivingroomScreen extends StatefulWidget {
  const LivingroomScreen({Key? key}) : super(key: key);

  @override
  State<LivingroomScreen> createState() => _LivingroomScreenState();
}

class _LivingroomScreenState extends State<LivingroomScreen> {
  ThemeController themeController = Get.put(ThemeController());
  MovementController movementController = Get.put(MovementController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovementController>(
      builder: (movementController) {
        return movementController.livingRoom
            ? LivingRoomTutorial()
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
      },
    );
  }

  Widget firstPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Home1.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.05,
            left: Get.width * 0.42,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Doors',
                          'Widening of doors and room entrances for wheelchairs and other mobility equipment is essential to make a home accessible.');
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
            top: Get.height * 0.28,
            left: Get.width * 0.42,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Assisted / electric Doors',
                          'Installing assisted doors will allow for free movement around the house for those people with mobility or strength issues.');
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

  Widget secondPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Home2.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.48,
            left: Get.width * 0.7,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Steps',
                          'For smaller or single steps a ramp could be installed. ');
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
            'assets/images/Home3.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.13,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Hand rails',
                          'Installing handrails in specific places would assist with movement around the house for some people.  These are especially useful by the front door, back door, kitchen, and bathroom. They can be used on the stairs if the person is able to use the stairs but needs extra support. ');
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
            top: Get.height * 0.46,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Steps',
                          'For smaller or single steps a ramp could be installed. ');
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
            top: Get.height * 0.4,
            left: Get.width * 0.70,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Table',
                          'Everyone likes to eat at a table, but tables are not always the right height for wheelchairs. Installing an adjustable table or adding a lower / higher surface onto the table will allow for everyone to sit around the table at the same time.');
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
            top: Get.height * 0.13,
            left: Get.width * 0.7,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Stairs',
                          'People who use a wheelchair may be unable to use the stairs, so the installation of a stairlift or lift is important to ensure that the house is accessible and useable.  A stairlift does require some independent movement and strength, which means that a through floor ceiling lift maybe preferred. ');
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

  Widget fourthPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Home4.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.4,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Stairs',
                          'People who use a wheelchair may be unable to use the stairs, so the installation of a stairlift or lift is important to ensure that the house is accessible and useable.  A stairlift does require some independent movement and strength, which means that a through floor ceiling lift maybe preferred. ');
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
            top: Get.height * 0.13,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Hand rails',
                          'Installing handrails in specific places would assist with movement around the house for some people.  These are especially useful by the front door, back door, kitchen, and bathroom. They can be used on the stairs if the person is able to use the stairs but needs extra support. ');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.26,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.14,
            left: Get.width * 0.8,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('TV and entertainment',
                          'Installing the tv on the wall with an entertainment system will reduce the amount of furniture in the room and will increase the accessibility of the room.');
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
            top: Get.height * 0.5,
            left: Get.width * 0.63,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Chairs',
                          'Replacing a standard sofa chair with an electric adjustable chair will provide someone with mobility issues more support in standing up and transferring between a wheelchair and a sitting room  chair.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.36,
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
            'assets/images/Home5.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.14,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('TV and entertainment',
                          'Installing the tv on the wall with an entertainment system will reduce the amount of furniture in the room and will increase the accessibility of the room.');
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
            top: Get.height * 0.5,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Chairs',
                          'Replacing a standard sofa chair with an electric adjustable chair will provide someone with mobility issues more support in standing up and transferring between a wheelchair and a sitting room  chair.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.16,
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
            'assets/images/Home6.png',
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
                      return dialogWidget('Lights',
                          'Light switches are sometimes small and fiddley to turn on. Installing a light switch pad is a simple way to turn the lights on for people with restricted movement.');
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
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Plug sockets',
                          'Most plug sockets are positioned at the height where many people with mobility issues may struggle. Raise the height of the sockets and ensure easy access plugs are installed. ');
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

  Widget seventhPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Home7.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.36,
            left: Get.width * 0.6,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Coat stand',
                          'Replace a traditional coat stand with a pull down one that attaches to the wall so that the person can hang their coat up high and out of the way. Doing this also supports with reducing the clutter.');
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

  Widget eigthPage() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Home8.png',
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: Get.height * 0.36,
            left: Get.width * 0.0,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Coat stand',
                          'Replace a traditional coat stand with a pull down one that attaches to the wall so that the person can hang their coat up high and out if the way. Doing this also supports with reducing the clutter.');
                    });
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.15,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.13,
            left: Get.width * 0.05,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialogWidget('Access to outside',
                          'Installation of an intercom system will allow people to take control of their security. This could be an intercom for outside and / or other rooms and floors in the house.');
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
}
