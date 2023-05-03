import 'package:ability_consultancy/api/shared_pref.dart';
import 'package:ability_consultancy/base/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    if (UserSimplePrefrences.getRemember() == null) {
      print('null');
    } else if (UserSimplePrefrences.getRemember() == true) {
      onLoadFromShared(true);
      print(saveEmail);
      print(loginEmailController.text);
      print(loginPasswordController.text);
    } else if (UserSimplePrefrences.getRemember() == false) {
      onLoadFromShared(false);
    }
  }

  //SignUp Vars
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController signUpAddressController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  bool acceptTermsOfService = false;

  TextEditingController otpController = TextEditingController();
  String countryCode = '';
  TextEditingController phoneController = TextEditingController();

  //LoginVars

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool saveEmail = false;

  TextEditingController forgotEmailController = TextEditingController();

  //SignUp Functions

  onAcceptTermsOfService() {
    acceptTermsOfService = !acceptTermsOfService;
    update();
  }

  onSaveEmail() async {
    saveEmail = !saveEmail;
    update();
    if (saveEmail == true) {
      onSaveToShared(
        loginEmailController.text,
        loginPasswordController.text,
      );
      saveEmail = UserSimplePrefrences.getRemember() as bool;
      update();
      print(saveEmail);
    } else {
      onDontSaveToShared();
      saveEmail = UserSimplePrefrences.getRemember() as bool;
      update();
      print(saveEmail);
    }
  }

  onSaveToShared(String email, String password) async {
    await UserSimplePrefrences.setRemember(true);
    await UserSimplePrefrences.setUserEmail(email);
    await UserSimplePrefrences.setUserPassword(password);
  }

  onDontSaveToShared() async {
    await UserSimplePrefrences.setRemember(false);
  }

  onLoadFromShared(bool b) async {
    if (b == true) {
      saveEmail = UserSimplePrefrences.getRemember() as bool;
      loginEmailController.text = UserSimplePrefrences.getUserEmail() as String;
      loginPasswordController.text =
          UserSimplePrefrences.getUserPassword() as String;
      update();
    } else {
      saveEmail = false;
      update();
    }
  }

  onCountryCode(CountryCode code) {
    countryCode = code.toString();
    update();
  }

  Future<String?> registerUserUsingEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credentials.user!.uid;
    } on FirebaseAuthException {
      print('Error Registering User');
    } catch (e) {
      print(e);
    }
  }

  addUserDataToDb(String _uid) async {
    await FirebaseFirestore.instance.collection('Users').doc(_uid).set({
      'name': signUpNameController.text,
      'email': signUpEmailController.text,
      'address': signUpAddressController.text,
      'id': _uid,
      'visionPackage': false,
      'hearingPackage': false,
      'movementPackage': false,
      'allPackages': false,
      'joinedAt': DateTime.now(),
    });
    signUpAddressController.clear();
    signUpNameController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    signUpConfirmPasswordController.clear();
    update();
  }

  //LoginFunctions
  Future<void> loginUsingEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.toNamed('/navBarScreen');
    } on FirebaseAuthException {
      Get.snackbar(
        'Login Error',
        'Credentials don\'t match',
        backgroundColor: AppColors.orangeButton,
        colorText: Colors.white,
      );
    } catch (e) {
      print('General Error: ${e}');
    }
  }

  Future resetPassword() async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: forgotEmailController.text.trim(),
      );
      Get.snackbar('Success', 'Password Reset Email Sent Successfully',
          backgroundColor: AppColors.greenButton,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed('loginScreen');
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Failed', 'Oops Something Went Wrong Please Try Again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAndToNamed('/');
    } catch (e) {
      print(e);
    }
  }
}
