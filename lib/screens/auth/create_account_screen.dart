import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/auth_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: GetBuilder<AuthController>(
        builder: (authController) {
          return Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/introBg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.050,
                horizontal:
                    themeController.phone ? Get.width * 0.05 : Get.width * 0.1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.025),
                  Image.asset('assets/images/logo.png',
                      height: Get.height * 0.05),
                  SizedBox(height: Get.height * 0.025),
                  createYourAccountText(),
                  SizedBox(height: Get.height * 0.02),
                  textFields(authController),
                  SizedBox(height: Get.height * 0.03),
                  acceptTermsOfService(authController),
                  SizedBox(height: Get.height * 0.03),
                  createAccountButton(authController),
                  SizedBox(height: Get.height * 0.03),
                  alreadyHaveAnAccount(),
                ],
              ),
            ),
          );
        },
      )),
    );
  }

  Widget createYourAccountText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Create Your Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: Get.width * 0.05,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          'Please fill out this form below\nto complete registration',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: Get.width * 0.0325,
          ),
        ),
      ],
    );
  }

  Widget textFields(AuthController authController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: authController.signUpAddressController,
          validator: ((value) {
            if (value!.isEmpty) {
              return 'Address is required';
            }
          }),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04,
              vertical: Get.height * 0.01,
            ),
            hintText: 'Your address',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.home,
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
          controller: authController.signUpNameController,
          validator: ((value) {
            if (value!.isEmpty) {
              return 'Name is required';
            }
          }),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04,
              vertical: Get.height * 0.01,
            ),
            hintText: 'Your name',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.person,
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
          controller: authController.signUpEmailController,
          validator: ((value) {
            if (value!.isEmpty) {
              return 'Email is required';
            }
          }),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04,
              vertical: Get.height * 0.01,
            ),
            hintText: 'Email address',
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
            labelStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.03),
        TextFormField(
          controller: authController.signUpPasswordController,
          validator: ((value) {
            if (value!.isEmpty) {
              return 'Password is required';
            }
          }),
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
                Icons.remove_red_eye,
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
          controller: authController.signUpConfirmPasswordController,
          validator: ((value) {
            if (value!.isEmpty) {
              return 'Confirm password';
            }
          }),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04,
              vertical: Get.height * 0.01,
            ),
            hintText: 'Confirm password',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.remove_red_eye,
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

  Widget acceptTermsOfService(AuthController authController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              authController.onAcceptTermsOfService();
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.lightBlue.shade300,
                ),
              ),
              child: authController.acceptTermsOfService == false
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
            'I accept ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
          ),
          Text(
            'term of service',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
          ),
        ],
      ),
    );
  }

  Widget createAccountButton(AuthController authController) {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: authController.signUpAddressController.text == '' ||
                authController.signUpNameController.text == '' ||
                authController.signUpEmailController.text == '' ||
                authController.signUpPasswordController.text == '' ||
                authController.signUpConfirmPasswordController.text == '' ||
                authController.acceptTermsOfService != true
            ? () {
                //print('grey');
              }
            : () async {
                String? _credentials =
                    await authController.registerUserUsingEmailAndPassword(
                  authController.signUpEmailController.text,
                  authController.signUpPasswordController.text,
                );
                Future.delayed(const Duration(seconds: 1), () {
                  authController.addUserDataToDb(_credentials as String);
                });
                //print('green');
                Get.toNamed('/phoneVerificationScreen');
              },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: Get.width * 0.9,
            color: authController.signUpAddressController.text == '' ||
                    authController.signUpNameController.text == '' ||
                    authController.signUpEmailController.text == '' ||
                    authController.signUpPasswordController.text == '' ||
                    authController.signUpConfirmPasswordController.text == '' ||
                    authController.acceptTermsOfService != true
                ? Colors.grey
                : themeController.greenButton,
            child: Center(
              child: Text(
                'Create an account',
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

  Widget alreadyHaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
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
            Get.offAndToNamed('loginScreen');
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Text(
            'Login here',
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
