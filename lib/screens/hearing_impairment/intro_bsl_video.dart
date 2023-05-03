import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/hearing_impairment/video_player_introbsl.dart';
import 'package:ability_consultancy/screens/hearing_impairment/video_player_question_widget.dart';
import 'package:ability_consultancy/screens/hearing_impairment/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class IntroBslVideoPlayerScreen extends StatefulWidget {
  String asset;

  IntroBslVideoPlayerScreen({Key? key, required this.asset}) : super(key: key);

  @override
  State<IntroBslVideoPlayerScreen> createState() =>
      _IntroBslVideoPlayerScreenState();
}

class _IntroBslVideoPlayerScreenState extends State<IntroBslVideoPlayerScreen> {
  VideoPlayerController? controller;

  @override
  void initState() {
    //Try Asset String if not
    controller = VideoPlayerController.network(widget.asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller?.play());
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerBslIntroWidget(
      controller: controller as VideoPlayerController,
    );
  }
}
