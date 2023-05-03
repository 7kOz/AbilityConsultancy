import 'package:ability_consultancy/api/shared_pref.dart';
import 'package:ability_consultancy/base/nav_barScreen.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:ability_consultancy/screens/auth/create_account_screen.dart';
import 'package:ability_consultancy/screens/auth/forgot_password_screen.dart';
import 'package:ability_consultancy/screens/auth/intro_screen.dart';
import 'package:ability_consultancy/screens/auth/login_screen.dart';
import 'package:ability_consultancy/screens/auth/personal_screen.dart';
import 'package:ability_consultancy/screens/auth/phone_verification_screen.dart';
import 'package:ability_consultancy/screens/auth/theme_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/about_bsl_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/about_hearing_impairments_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/actions_bsl_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/family_bsl_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/greetings_bsl_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/hearing_impairment_main_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/learn_bsl_options_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/learn_bsl_alphabet_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/manners_bsl_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/questions_bsl_screen.dart';
import 'package:ability_consultancy/screens/hearing_impairment/quiz_bsl_screen.dart';
import 'package:ability_consultancy/screens/messaging/email_screen.dart';
import 'package:ability_consultancy/screens/messaging/whats_app_screen.dart';
import 'package:ability_consultancy/screens/movement_impairments/about_movement_impairments.dart';
import 'package:ability_consultancy/screens/movement_impairments/lets_get_started_mobility_screen.dart';
import 'package:ability_consultancy/screens/movement_impairments/mobility_options_screen.dart';
import 'package:ability_consultancy/screens/store/buying_options_screen.dart';
import 'package:ability_consultancy/screens/store/info_screen.dart';
import 'package:ability_consultancy/screens/store/lets_get_started_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/about_visual_impairment_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/hazy_vision_with_light_scatter_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/light_perception_in_both_eyes_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/light_perception_in_one_eye_and_poor_vision_in_the_other_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/loss_of_central_vision_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/loss_of_half_vision_in_each_eye_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/loss_of_half_vision_in_one_eye_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/patchy_vision_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/reduced_calirty_of_vision_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/total_loss_of_peripheral_vision_screen.dart';
import 'package:ability_consultancy/screens/visual_impairment/visual_impairment_main.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/object_wrappers.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as res;

late List<CameraDescription> _cameras;

final _configuration =
    PurchasesConfiguration('appl_EpjOCJgspiDijKdnVHJVcznUpKa');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  await Firebase.initializeApp();
  await UserSimplePrefrences.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
  await Purchases.configure(_configuration);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return res.ResponsiveSizer(builder: (context, orientation, screenType) {
      res.Device.screenType == res.ScreenType.tablet
          ? themeController.onTablet()
          : themeController.onPhone();
      return GetMaterialApp(
        initialRoute: '/',
        defaultTransition: Transition.cupertino,
        debugShowCheckedModeBanner: false,
        title: 'Ability Consultancy',
        getPages: [
          GetPage(
            name: '/',
            page: () => ThemeScreen(),
          ),
          GetPage(
            name: '/introScreen',
            page: () => IntroScreen(),
          ),
          GetPage(
            name: '/createAccountScreen',
            page: () => CreateAccountScreen(),
          ),
          GetPage(
            name: '/phoneVerificationScreen',
            page: () => PhoneVerificationScreen(),
          ),
          GetPage(
            name: '/loginScreen',
            page: () => LoginScreen(),
          ),
          GetPage(
            name: '/letsGetStartedScreen',
            page: () => LetsGetStartedScreen(),
          ),
          GetPage(
            name: '/buyingOptionsScreen',
            page: () => BuyingOptionsScreen(),
          ),
          GetPage(
            name: '/infoScreen',
            page: () => InfoScreen(),
          ),
          GetPage(
            name: '/visualImpairmentMainScreen',
            page: () => VisualImpairmentMainScreen(),
          ),
          GetPage(
            name: '/aboutVisualImpairmentScreen',
            page: () => AboutVisualImpairmentScreen(),
          ),
          GetPage(
            name: '/totalLossOfPeripheralVisionScreen',
            page: () => TotalLossOfPeripheralVisionScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/lossOfHalfVisionInEachEyeScreen',
            page: () => LossOfHalfVisionInEachEyeScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/lossOfHalfVisionInOneEyeScreen',
            page: () => LossOfHalfVisionInOneEyeScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/lossOfCentralVisionScreen',
            page: () => LossOfCentralVisionScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/hazyVisionWithLightScatterScreen',
            page: () => HazyVisionWithLightScatterScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/patchyVisionScreen',
            page: () => PatchyVisionScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/lightPerceptionInOneEyeAndPoorVisionInTheOtherScreen',
            page: () => LightPerceptionInOneEyeAndPoorVisionInTheOtherScreen(
                cameras: _cameras),
          ),
          GetPage(
            name: '/lightPerceptionInBothEyesScreen',
            page: () => LightPerceptionInBothEyesScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/reducedClarityOfVisionScreen',
            page: () => ReducedClarityOfVisionScreen(cameras: _cameras),
          ),
          GetPage(
            name: '/hearingImpairmentMainScreen',
            page: () => HearingImpairmentMainScreen(),
          ),
          GetPage(
            name: '/learnBslOptionsScreen',
            page: () => LearnBslOptionsScreen(),
          ),
          GetPage(
            name: '/aboutHearingImpairmentsScreen',
            page: () => AboutHearingImpairmentsScreen(),
          ),
          GetPage(
            name: '/learnBslAlphabetScreen',
            page: () => LearnBslAlphabetScreen(),
          ),
          GetPage(
            name: '/aboutBslScreen',
            page: () => AboutBslScreen(),
          ),
          GetPage(
            name: '/questionsBslScreen',
            page: () => QuestionsBslScreen(),
          ),
          GetPage(
            name: '/familyBslScreen',
            page: () => FamilyBslScreen(),
          ),
          GetPage(
            name: '/greetingsBslScreen',
            page: () => GreetingsBslScreen(),
          ),
          GetPage(
            name: '/mannersBslAlphabetScreen',
            page: () => MannersBslAlphabetScreen(),
          ),
          GetPage(
            name: '/actionsBslScreen',
            page: () => ActionsBslScreen(),
          ),
          GetPage(
            name: '/quizBslScreen',
            page: () => QuizBslScreen(),
          ),
          GetPage(
            name: '/aboutMovementImpairmentsScreen',
            page: () => AboutMovementImpairmentsScreen(),
          ),
          GetPage(
            name: '/letsGetStartedMobilityScreen',
            page: () => LetsGetStartedMobilityScreen(),
          ),
          GetPage(
            name: '/mobilityOptionsScreen',
            page: () => MobilityOptionsScreen(),
          ),
          GetPage(
            name: '/forgotPasswordScreen',
            page: () => ForgotPasswordScreen(),
          ),
          GetPage(
            name: '/emailScreen',
            page: () => EmailScreen(),
          ),
          GetPage(
            name: '/personalScreen',
            page: () => PersonalScreen(),
          ),
          GetPage(
            name: '/navBarScreen',
            page: () => NavBarScreen(),
          ),
          GetPage(
            name: '/whatsappScreen',
            page: () => WhatsAppScreen(),
          ),
        ],
      );
    });
  }
}
