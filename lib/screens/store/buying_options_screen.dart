import 'package:ability_consultancy/base/app_colors.dart';
import 'package:ability_consultancy/controllers/store_controller.dart';
import 'package:ability_consultancy/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class BuyingOptionsScreen extends StatelessWidget {
  BuyingOptionsScreen({Key? key}) : super(key: key);
  StoreController storeController = Get.put(StoreController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<StoreController>(
      builder: (storeController) {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/introBg.png'),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.05,
              horizontal: Get.width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.02),
                appBar1(),
                appBar2(),
                SizedBox(height: Get.height * 0.03),
                buyingOptionsText1(),
                buyingOptionsText2(),
                SizedBox(height: Get.height * 0.02),
                firstRowStore(),
                secondScreenRowStore(),
                SizedBox(height: Get.height * 0.02),
                secondRowStore(),
              ],
            ),
          ),
        );
      },
    ));
  }

  Widget appBar1() {
    return Visibility(
      visible: storeController.firstPage == true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                    fontSize: themeController.phone
                        ? Get.width * 0.04
                        : Get.width * 0.03,
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Get.toNamed('infoScreen');
            },
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            child: Image.asset(
              'assets/images/infoIcon.png',
              height: Get.height * 0.035,
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar2() {
    return Visibility(
      visible: storeController.secondPage == true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  storeController.onFirstPage();
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
                    fontSize: themeController.phone
                        ? Get.width * 0.04
                        : Get.width * 0.03,
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Get.toNamed('infoScreen');
            },
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            child: Image.asset(
              'assets/images/infoIcon.png',
              height: Get.height * 0.035,
            ),
          ),
        ],
      ),
    );
  }

  Widget buyingOptionsText1() {
    return Visibility(
      visible: storeController.firstPage == true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Buying Options',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: Get.width * 0.06,
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Please select which sections you wish to purchase.\nYou can add other sections at any time and save 15%.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
          ),
        ],
      ),
    );
  }

  Widget buyingOptionsText2() {
    return Visibility(
      visible: storeController.secondPage == true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'More Buying Options',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: Get.width * 0.06,
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Please select which item you wish\nto purchase and save 15% on the normal price.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize:
                  themeController.phone ? Get.width * 0.04 : Get.width * 0.03,
            ),
          ),
        ],
      ),
    );
  }

  Widget firstRowStore() {
    return Visibility(
      visible: storeController.firstPage == true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () async {
              try {
                await Purchases.purchaseProduct('002',
                    type: PurchaseType.inapp);
                //Give Access From Db.
                Get.toNamed('/visualImpairmentMainScreen');
              } catch (e) {
                print(e);
              }
            },
            child: Image.asset(
              'assets/images/SingleProduct1Redone.png',
              height: Get.height * 0.23,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Get.toNamed('/hearingImpairmentMainScreen');
            },
            child: Image.asset(
              'assets/images/SingleProduct2Redone.png',
              height: Get.height * 0.23,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Get.toNamed('/aboutMovementImpairmentsScreen');
            },
            child: Image.asset(
              'assets/images/SingleProduct3Redone.png',
              height: Get.height * 0.23,
            ),
          )
        ],
      ),
    );
  }

  Widget secondRowStore() {
    return Visibility(
      visible: storeController.firstPage == true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/AllProducts1Redone.png',
            height: Get.height * 0.23,
          ),
          Image.asset(
            'assets/images/AllProducts1Redone.png',
            height: Get.height * 0.23,
          ),
          Image.asset(
            'assets/images/AllProducts1Redone.png',
            height: Get.height * 0.23,
          )
        ],
      ),
    );
  }

  Widget secondScreenRowStore() {
    return Visibility(
      visible: storeController.secondPage == true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/AllProducts4Redone.png',
                height: Get.height * 0.3,
              ),
              Image.asset(
                'assets/images/AllProducts5Redone.png',
                height: Get.height * 0.3,
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.05),
          themeController.children
              ? Image.asset(
                  'assets/images/children.png',
                  fit: BoxFit.fill,
                  height: themeController.phone
                      ? Get.height * 0.3
                      : Get.height * 0.2,
                )
              : themeController.teenagers
                  ? Image.asset(
                      'assets/teenImages/teens.png',
                      fit: BoxFit.fill,
                      height: themeController.phone
                          ? Get.height * 0.3
                          : Get.height * 0.2,
                    )
                  : Image.asset(
                      'assets/seniorImages/seniors.png',
                      fit: BoxFit.fill,
                      height: themeController.phone
                          ? Get.height * 0.3
                          : Get.height * 0.2,
                    ),
        ],
      ),
    );
  }
}
