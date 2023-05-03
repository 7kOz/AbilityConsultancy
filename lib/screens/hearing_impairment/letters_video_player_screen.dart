import 'package:ability_consultancy/screens/hearing_impairment/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class LettersVideoPlayerScreen extends StatefulWidget {
  String asset;
  String letterAsset;
  LettersVideoPlayerScreen(
      {Key? key, required this.asset, required this.letterAsset})
      : super(key: key);

  @override
  State<LettersVideoPlayerScreen> createState() =>
      _LettersVideoPlayerScreenState();
}

class _LettersVideoPlayerScreenState extends State<LettersVideoPlayerScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(
      controller: controller,
      letterAsset: widget.letterAsset,
    );
  }
}
