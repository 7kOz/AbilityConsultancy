import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppScreen extends StatefulWidget {
  const WhatsAppScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppScreen> createState() => _WhatsAppScreenState();
}

class _WhatsAppScreenState extends State<WhatsAppScreen> {
  TextEditingController messageController = TextEditingController();
  ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/introBg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.02),
              appBar(),
              SizedBox(height: Get.height * 0.01),
              Container(
                height: Get.height * 0.7,
                width: Get.width * 0.9,
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: Get.height,
                          width: Get.width * 0.8,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.02,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: Get.height * 0.68,
                          width: Get.width * 0.9,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: Get.height * 0.04),
                              Image.asset(
                                'assets/images/logo.png',
                                height: Get.height * 0.1,
                                fit: BoxFit.fitHeight,
                              ),
                              SizedBox(height: Get.height * 0.04),
                              Text(
                                'Message Us',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.width * 0.05,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.03),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  maxLines: 6,
                                  //controller: messageController,
                                  onChanged: (value) {
                                    setState(() {
                                      messageController.text = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.04,
                                      vertical: Get.height * 0.02,
                                    ),
                                    labelText: 'Your Message',
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2)),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: Get.width * 0.04,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.05),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  onTap: messageController.text == ''
                                      ? () {}
                                      : () {
                                          openWhatsAppChat();
                                        },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(34),
                                    child: Container(
                                      height: Get.height * 0.075,
                                      width: Get.width * 0.9,
                                      color: messageController.text == ''
                                          ? Colors.grey
                                          : themeController.greenButton,
                                      child: Center(
                                        child: Text(
                                          'Send',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Get.width * 0.04,
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [],
          ),
          Image.asset(
            'assets/images/logo.png',
            height: Get.height * 0.04,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }

  void openWhatsAppChat() async {
    String phoneNumber = '+447799770362';
    String message = messageController.text.replaceAll(RegExp(' '), '%20');
    var url = 'https://wa.me/+447799770362?text=$message';
    if (await canLaunch(url)) {
      await launch(url);
      setState(() {
        messageController.clear();
        messageController.text = '';
      });
    } else {
      Get.snackbar('Failed', 'Oops Something Went Wrong Please Try Again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      setState(() {
        messageController.clear();
        messageController.text = '';
      });
    }
  }
}
