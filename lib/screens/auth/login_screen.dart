import 'package:ability_consultancy/api/local_auth_api.dart';
import 'package:ability_consultancy/api/shared_pref.dart';
import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: GetBuilder<AuthController>(
        builder: (authController) {
          return Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/createAccountBg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.1,
                horizontal:
                    themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * 0.15),
                  welcomeBackText(),
                  SizedBox(height: Get.height * 0.03),
                  loginFields(authController),
                  SizedBox(height: Get.height * 0.03),
                  loginButton(authController),
                  SizedBox(height: Get.height * 0.03),
                  saveEmail(),
                  const Spacer(),
                  loginWithFaceID(),
                  SizedBox(height: Get.height * 0.02),
                  createAnAccount(),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }

  Widget welcomeBackText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome Back!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: Get.width * 0.06,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          'Please use your email and\npassword or use faceID',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: Get.width * 0.0375,
          ),
        ),
      ],
    );
  }

  Widget loginFields(AuthController authController) {
    return Column(
      children: [
        TextFormField(
          controller: authController.loginEmailController,
          validator: ((value) {}),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04,
              vertical: Get.height * 0.01,
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.mail,
                color: Colors.grey,
                size: Get.width * 0.05,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(34),
                borderSide: const BorderSide(color: Colors.white, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(34),
                borderSide: const BorderSide(color: Colors.white, width: 2)),
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.03),
        TextFormField(
          controller: authController.loginPasswordController,
          validator: ((value) {}),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04,
              vertical: Get.height * 0.01,
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.lock,
                color: Colors.grey,
                size: Get.width * 0.05,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(34),
                borderSide: const BorderSide(color: Colors.white, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(34),
                borderSide: const BorderSide(color: Colors.white, width: 2)),
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget loginButton(AuthController controller) {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          authController.loginUsingEmailAndPassword(
            authController.loginEmailController.text,
            authController.loginPasswordController.text,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
            color: themeController.orangeButton,
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: themeController.phone
                      ? Get.width * 0.04
                      : Get.width * 0.03,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget saveEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  authController.onSaveEmail();
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.lightBlue.shade300,
                    ),
                  ),
                  child: authController.saveEmail == false
                      ? Container()
                      : Center(
                          child: Icon(
                            Icons.check,
                            color: AppColors.greenButton,
                            size: 15,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Save Email ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  fontSize: themeController.phone
                      ? Get.width * 0.04
                      : Get.width * 0.03,
                ),
              ),
            ],
          ),
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Get.toNamed('forgotPasswordScreen');
            },
            child: Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
                fontSize:
                    themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget loginWithFaceID() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();

          if (isAuthenticated) {
            authController.loginUsingEmailAndPassword(
              UserSimplePrefrences.getUserEmail() as String,
              UserSimplePrefrences.getUserPassword() as String,
            );
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: themeController.phone ? Get.width * 0.9 : Get.width * 0.8,
            color: themeController.greenButton,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login With FaceID',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: themeController.phone
                          ? Get.width * 0.04
                          : Get.width * 0.03,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/faceIdIcon.png',
                    height: 30,
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
            fontSize:
                themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
          ),
        ),
        InkWell(
          onTap: () {
            Get.offAndToNamed('createAccountScreen');
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
          ),
        ),
      ],
    );
  }
}
