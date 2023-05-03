import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerQuestionsWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final String letterAsset;
  VideoPlayerQuestionsWidget({
    Key? key,
    required this.controller,
    required this.letterAsset,
  }) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) => controller != null &&
          controller.value.isInitialized
      ? Material(
          color: Colors.transparent,
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/introBg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: buildVideo()),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.05,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.close, color: Colors.black)),
                    ],
                  ),
                ),
                Positioned(
                    bottom: Get.height * 0.04,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.025),
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: themeController.greenButton.withOpacity(0.6),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'The Word  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Get.width * 0.03,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            letterAsset != ''
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Image.asset(
                                      letterAsset,
                                      height: Get.height * 0.035,
                                      fit: BoxFit.fitHeight,
                                    ))
                                : Container(),
                          ],
                        )),
                      ),
                    ))
              ],
            ),
          ),
        )
      : Container(
          height: Get.height * 0.2,
          width: Get.width,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: themeController.phone ? 0.5 : 0.75,
        child: VideoPlayer(controller),
      );
}


// Material(
//           child: Container(
//             height: Get.height * 0.8,
//             width: Get.width,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/introBg.png'),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             alignment: Alignment.center,
//             child: Padding(
//               padding: EdgeInsets.all(Get.height * 0.04),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Container(
//                   height: Get.height * 0.8,
//                   width: Get.width,
//                   color: Colors.grey.shade200,
//                   child: Stack(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8.0, vertical: 16),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(16),
//                               child: buildVideo(),
//                             ),
//                           ),
//                           SizedBox(height: Get.height * 0.05),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: InkWell(
//                               onTap: () {
//                                 Get.toNamed('aboutBslScreen');
//                               },
//                               splashColor: Colors.transparent,
//                               splashFactory: NoSplash.splashFactory,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: Container(
//                                   height: Get.height * 0.075,
//                                   width: Get.width * 0.9,
//                                   color: themeController.greenButton,
//                                   child: Center(
//                                     child: Text(
//                                       'About BSL',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: Get.width * 0.04,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: Get.height * 0.02),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: InkWell(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: Container(
//                                   height: Get.height * 0.075,
//                                   width: Get.width * 0.9,
//                                   color: themeController.greenButton,
//                                   child: Center(
//                                     child: Text(
//                                       'Close',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: Get.width * 0.04,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Positioned(
//                         bottom: Get.height * 0.25,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(50),
//                             child: Container(
//                               height: Get.height * 0.1,
//                               width: Get.width * 0.8,
//                               color: Colors.white,
//                               child: Center(
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(50),
//                                   child: Container(
//                                     height: Get.height * 0.07,
//                                     width: Get.width * 0.75,
//                                     color: themeController.orangeButton,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         letterAsset != ''
//                                             ? Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     right: 16.0),
//                                                 child: Image.asset(
//                                                   letterAsset,
//                                                   height: Get.height * 0.02,
//                                                   fit: BoxFit.fitHeight,
//                                                   color: themeController
//                                                       .orangeButton,
//                                                 ))
//                                             : Container(),
//                                         Center(
//                                           child: Text(
//                                             'The Word',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: Get.width * 0.04,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ),
//                                         letterAsset != ''
//                                             ? Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     right: 16.0),
//                                                 child: Image.asset(
//                                                   letterAsset,
//                                                   height: Get.height * 0.02,
//                                                   fit: BoxFit.fitHeight,
//                                                 ))
//                                             : Container(),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         )