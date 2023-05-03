import 'dart:ui';

import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LightPerceptionInOneEyeAndPoorVisionInTheOtherScreen
    extends StatefulWidget {
  List<CameraDescription> cameras;
  LightPerceptionInOneEyeAndPoorVisionInTheOtherScreen(
      {Key? key, required this.cameras})
      : super(key: key);

  @override
  State<LightPerceptionInOneEyeAndPoorVisionInTheOtherScreen> createState() =>
      _LightPerceptionInOneEyeAndPoorVisionInTheOtherScreenState();
}

class _LightPerceptionInOneEyeAndPoorVisionInTheOtherScreenState
    extends State<LightPerceptionInOneEyeAndPoorVisionInTheOtherScreen> {
  ThemeController themeController = Get.put(ThemeController());
  late CameraController cameraController;
  bool show = true;

  @override
  void initState() {
    super.initState();
    cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // print('User Denied Camera Access');
            break;
          default:
            //print('Other Error');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container(
        height: Get.height * 0.5,
        width: Get.width * 0.5,
        color: Colors.transparent,
      );
    }
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            child: CameraPreview(
              cameraController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: Get.height,
                width: Get.width * 0.5,
                child: Image.asset(
                  'assets/images/lightPerceptionBg.png',
                  height: Get.height,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  height: Get.height,
                  width: Get.width * 0.5,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: Get.height * 0.03),
              appBar(),
              Visibility(
                visible: show == true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.7,
                    color: Colors.white,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.64,
                          color: themeController.orangeButton,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Light perception in one eye and poor vision in the other',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Get.width * 0.0325,
                                ),
                              ),
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
        ],
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  setState(() {
                    show = false;
                  });
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
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
                                            'Loss of sight in one eye can impact severely on someone\'s overall vision. It is common to have different levels of vision in both eyes. Common conditions where this might happen are Age Related Degeneration with Cataract and, Glaucoma with Diabetic Retinopathy.',
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: Get.width * 0.035),
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
                                        setState(() {
                                          show = true;
                                        });
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
                                    left: Get.width * 0.075,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        height: Get.height * 0.08,
                                        width: Get.width * 0.65,
                                        color: Colors.white,
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Container(
                                              height: Get.height * 0.05,
                                              width: Get.width * 0.58,
                                              color:
                                                  themeController.orangeButton,
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Text(
                                                    'Light perception in one eye and poor vision in the other',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            Get.width * 0.031),
                                                  ),
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
                      });
                },
                child: Image.asset(
                  'assets/images/infoIcon.png',
                  height: Get.height * 0.04,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/images/logo.png',
                height: Get.height * 0.04,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
