import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/auth_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerificationScreen extends StatelessWidget {
  PhoneVerificationScreen({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthController>(
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
              horizontal: Get.width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.15),
                oneLastStepText(),
                SizedBox(height: Get.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              height: Get.height * 0.0645,
                              width: Get.width * 0.26,
                              color: Colors.white,
                              child: CountryListPick(
                                theme: CountryTheme(
                                  initialSelection: '+44',
                                  isShowFlag: true,
                                  isShowTitle: false,
                                  isShowCode: true,
                                  isDownIcon: false,
                                  showEnglishName: false,
                                ),
                                initialSelection: '+44',
                                onChanged: (CountryCode? value) {
                                  authController.onCountryCode(value!);
                                  print(authController.countryCode);
                                },
                              )),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      child: const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                        width: 1,
                      ),
                    ),
                    Container(
                      height: Get.height * 0.1,
                      width: Get.width * 0.6,
                      child: TextFormField(
                        controller: authController.phoneController,
                        validator: ((value) {}),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.02,
                          ),
                          hintText: '0000-0000-0000',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          labelStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Center(
                  child: Image.asset(
                    themeController.children
                        ? 'assets/images/children.png'
                        : themeController.teenagers
                            ? 'assets/teenImages/teens.png'
                            : 'assets/seniorImages/seniors.png',
                    height: Get.height * 0.25,
                    fit: BoxFit.fill,
                  ),
                ),
                Spacer(),
                verifyPhoneNumbertButton(),
                SizedBox(height: Get.height * 0.03),
                alreadyHaveAnAccount(),
              ],
            ),
          ),
        );
      },
    ));
  }

  Widget oneLastStepText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'One Last Step',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: Get.width * 0.05,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          'Please verify your phone number\nto complete your setup',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: Get.width * 0.04,
          ),
        ),
      ],
    );
  }

  Widget verifyPhoneNumbertButton() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          Get.toNamed('/loginScreen');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: Get.height * 0.075,
            width: Get.width * 0.9,
            color: themeController.greenButton,
            child: Center(
              child: Text(
                'Verify phone number',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width * 0.045,
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
            fontSize: Get.width * 0.035,
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed('loginScreen');
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Text(
            'Login here',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
              fontSize: Get.width * 0.035,
            ),
          ),
        ),
      ],
    );
  }
}
