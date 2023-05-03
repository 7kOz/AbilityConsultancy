import 'dart:convert';

import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/auth/forgot_password_screen.dart';
import 'package:ability_consultancy/screens/auth/personal_screen.dart';
import 'package:ability_consultancy/screens/store/lets_get_started_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  ThemeController themeController = Get.put(ThemeController());

  String username = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    getUserData();
    //print(userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                              'Email Us',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Get.width * 0.05,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Text(
                              'info@ability-digital.co.uk',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Get.width * 0.04,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                //controller: nameController,
                                onChanged: (value) {
                                  setState(() {
                                    nameController.text = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.04,
                                    vertical: Get.height * 0.02,
                                  ),
                                  labelText: 'Your Name',
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
                            SizedBox(height: Get.height * 0.02),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                maxLines: 4,
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
                            SizedBox(height: Get.height * 0.02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                onTap: nameController.text == '' ||
                                        messageController.text == ''
                                    ? () {}
                                    : () {
                                        sendEmail(
                                            name: nameController.text,
                                            email: userEmail,
                                            message: messageController.text);
                                      },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(34),
                                  child: Container(
                                    height: Get.height * 0.075,
                                    width: Get.width * 0.9,
                                    color: nameController.text == '' ||
                                            messageController.text == ''
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
                            SizedBox(height: Get.height * 0.01),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  Future sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final serviceId = 'service_q2ox9bm';
    final templateId = 'template_0gcbgaf';
    final userId = 'ECSENKK0oS8DdJ8tM';
    final accessToken = 'jHu7t1uYIcxl6e0m7JK8H';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'accessToken': accessToken,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_message': message,
          }
        },
      ),
    );
    Get.snackbar('Success', 'Your Email Has Been Sent Successfully',
        backgroundColor: themeController.greenButton,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);

    Future.delayed(const Duration(seconds: 2), () {
      messageController.clear();
      nameController.clear();
    });
    // print(message);
    // print(response.body);
  }

  Future getUserData() async {
    setState(() {
      userEmail = FirebaseAuth.instance.currentUser!.email as String;
    });
  }
}
