import 'package:ability_consultancy/screens/auth/forgot_password_screen.dart';
import 'package:ability_consultancy/screens/auth/personal_screen.dart';
import 'package:ability_consultancy/screens/messaging/email_screen.dart';
import 'package:ability_consultancy/screens/messaging/whats_app_screen.dart';
import 'package:ability_consultancy/screens/store/lets_get_started_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            LetsGetStartedScreen(),
            const WhatsAppScreen(),
            const EmailScreen(),
            PersonalScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController!.jumpToPage(index);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.phone_android),
            title: const Text('Message'),
            activeColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.chat),
            title: const Text('Message'),
            activeColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            activeColor: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
