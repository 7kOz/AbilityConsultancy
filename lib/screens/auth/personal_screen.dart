import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  String uid = '';
  String name = '';
  String address = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    getUserData();
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
                          child: FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(uid)
                                .get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.blueAccent),
                                );
                              }
                              if (snapshot.hasData && !snapshot.data!.exists) {
                                return const Center(
                                  child: Text('Document Does Not Exist'),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.blueAccent),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Map<String, dynamic> data = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: Get.height * 0.05),
                                    Text(
                                      'My Details',
                                      style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: themeController.phone
                                            ? Get.width * 0.04
                                            : Get.width * 0.03,
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.1),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Address',
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                          Text(
                                            data['address'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.05),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                          Text(
                                            data['name'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.05),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Email',
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                          Text(
                                            data['email'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.05),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Password',
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                          Text(
                                            '***********',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: themeController.phone
                                                  ? Get.width * 0.035
                                                  : Get.width * 0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.blueAccent),
                              );
                            },
                          )),
                    ),
                  )
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

  Future getUserData() async {
    setState(() {
      uid = FirebaseAuth.instance.currentUser!.uid;
    });
  }
}
