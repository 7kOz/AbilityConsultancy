import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/introBg.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.05,
            horizontal: Get.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.02),
              appBar(),
              SizedBox(height: Get.height * 0.02),
              Container(
                height: Get.height * 0.8,
                width: Get.width,
                child: Stack(
                  children: [
                    Positioned(
                      right: Get.width * 0.05,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(34),
                        child: Container(
                          height: Get.height * 0.6,
                          width: Get.width * 0.8,
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.02,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(34),
                        child: Container(
                          height: Get.height * 0.775,
                          width: Get.width * 0.9,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Information',
                                    style: TextStyle(
                                      fontSize: themeController.phone
                                          ? Get.width * 0.06
                                          : Get.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'License',
                                  style: TextStyle(
                                    fontSize: themeController.phone
                                        ? Get.width * 0.05
                                        : Get.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '20 Licences - £425 - Save £75',
                                  style: TextStyle(
                                    fontSize: themeController.phone
                                        ? Get.width * 0.04
                                        : Get.width * 0.03,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '50 Licences - £1,000 - Save £250',
                                  style: TextStyle(
                                    fontSize: themeController.phone
                                        ? Get.width * 0.04
                                        : Get.width * 0.03,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '100 Licences - £1,875 - Save £625',
                                  style: TextStyle(
                                    fontSize: themeController.phone
                                        ? Get.width * 0.04
                                        : Get.width * 0.03,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '100 Licences - £3,750 - Save £1,250',
                                  style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Text(
                                  'Multi Licenses',
                                  style: TextStyle(
                                    fontSize: themeController.phone
                                        ? Get.width * 0.05
                                        : Get.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          'Buying multi-license will be for the full app - no individual Element. Bespoke purchases are available,please contact:',
                                      style: TextStyle(
                                        fontSize: themeController.phone
                                            ? Get.width * 0.04
                                            : Get.width * 0.03,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' info@abilitydigital.co.uk',
                                          style: TextStyle(
                                            fontSize: themeController.phone
                                                ? Get.width * 0.04
                                                : Get.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' to discuss your needs.',
                                          style: TextStyle(
                                            fontSize: themeController.phone
                                                ? Get.width * 0.04
                                                : Get.width * 0.03,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Text(
                                  'Bundle',
                                  style: TextStyle(
                                    fontSize: themeController.phone
                                        ? Get.width * 0.05
                                        : Get.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          'Bundle of the app and the Disability awareness course is availavle to purchase Contact: ',
                                      style: TextStyle(
                                        fontSize: themeController.phone
                                            ? Get.width * 0.04
                                            : Get.width * 0.03,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'info@abilitydigital.co.uk',
                                          style: TextStyle(
                                            fontSize: themeController.phone
                                                ? Get.width * 0.04
                                                : Get.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' to discuss your needs.',
                                          style: TextStyle(
                                            fontSize: themeController.phone
                                                ? Get.width * 0.04
                                                : Get.width * 0.03,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Text(
                                  'Usage on one device for 1 year\nNo updates available',
                                  style: TextStyle(
                                    fontSize: themeController.phone
                                        ? Get.width * 0.04
                                        : Get.width * 0.03,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
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
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.white,
            size: Get.width * 0.06,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            Get.back();
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Text(
            'Previous',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
          ),
        )
      ],
    );
  }
}
