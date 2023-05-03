import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class IntroTextWidget extends StatelessWidget {
  const IntroTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: Get.width * 0.05),
          ),
          const SizedBox(height: 4),
          Text(
            'Ability\nConsultancy',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Get.width * 0.05),
          ),
          const SizedBox(height: 4),
          Text(
            'Breaking down the barriers\nand stigma of disability',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: Get.width * 0.04),
          ),
        ],
      ),
    );
  }
}
