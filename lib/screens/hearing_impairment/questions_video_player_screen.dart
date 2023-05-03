import 'package:ability_consultancy/screens/hearing_impairment/video_player_question_widget.dart';
import 'package:ability_consultancy/screens/hearing_impairment/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class QuestionsVideoPlayerScreen extends StatefulWidget {
  String asset;
  String letterAsset;
  QuestionsVideoPlayerScreen(
      {Key? key, required this.asset, required this.letterAsset})
      : super(key: key);

  @override
  State<QuestionsVideoPlayerScreen> createState() =>
      _QuestionsVideoPlayerScreenState();
}

class _QuestionsVideoPlayerScreenState
    extends State<QuestionsVideoPlayerScreen> {
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
    return VideoPlayerQuestionsWidget(
      controller: controller as VideoPlayerController,
      letterAsset: widget.letterAsset,
    );
  }
}
