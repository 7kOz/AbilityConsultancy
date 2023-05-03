import 'package:ability_consultancy/controllers/movement_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class OfficeTutorial extends StatefulWidget {
  const OfficeTutorial({super.key});

  @override
  State<OfficeTutorial> createState() => _OfficeTutorialState();
}

class _OfficeTutorialState extends State<OfficeTutorial> {
  CachedVideoPlayerController controller = CachedVideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/ability-consultant.appspot.com/o/Tutorials%2FOffice11.mp4?alt=media&token=357ef669-20a4-4db3-ab54-845838abb955');
  ThemeController themeController = Get.put(ThemeController());
  MovementController movementController = Get.put(MovementController());

  @override
  void initState() {
    controller.initialize().then((value) {
      controller.play();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: controller.value.isInitialized
            ? Column(
                children: [
                  AspectRatio(
                    aspectRatio: 0.575,
                    child: CachedVideoPlayer(controller),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  InkWell(
                    onTap: () {
                      movementController.toggleoffice();
                    },
                    child: ClipRRect(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      'Skip Tutorial',
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.025),
                ],
              )
            : Container(
                child: const Center(child: CircularProgressIndicator()),
              ),
      ),
    );
  }
}
