import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/views/screens/node/node_screen.dart';
import 'package:parler_pay_wallet/views/screens/profile/profile_screen.dart';

import '../../../utils/app_colors.dart';
import '../contacts/contacts_screen.dart';
import '../home/home_screen.dart';
import '../notifications/notifications_screen.dart';
import 'controller/bottom_navbar_controller.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomNavBarController controller = Get.put(CustomNavBarController());

    List<Widget> screens = [
      const HomeScreen(),
      const ContactScreen(),
      const NotificationScreen(),
      const NodeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: kNavbarBg.withOpacity(0.72),
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => Container(
            decoration: BoxDecoration(
              color: kNavbarBg.withOpacity(0.72),
            ),
            child: BottomNavigationBar(
              backgroundColor: kNavbarBg.withOpacity(0.72),
              currentIndex: controller.currentIndex.value,
              items: [
                _buildNavBarItem(index: 0, asset: kNav1Icon, label: ''),
                _buildNavBarItem(index: 1, asset: kNav2Icon, label: ''),
                _buildNavBarItem(index: 2, asset: kNav3Icon, label: ''),
                _buildNavBarItem(index: 3, asset: kNav4Icon, label: ''),
                _buildProfileNavBarItem(index: 4, asset: kDummy, label: ''),
              ],
              onTap: controller.changeIndex,
              selectedLabelStyle: const TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelStyle: TextStyle(
                color: kWhiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
              selectedItemColor: kWhiteColor,
              unselectedItemColor: kWhiteColor.withOpacity(0.5),
            ),
          )),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
      {required int index, required String asset, required String label}) {
    final CustomNavBarController controller =
        Get.find<CustomNavBarController>();

    return BottomNavigationBarItem(
        backgroundColor: kNavbarBg.withOpacity(0.72),
        icon: Align(
          alignment: Alignment.center,
          child: Obx(() => Image.asset(
                width: 25.h,
                asset,
                color: controller.currentIndex.value == index
                    ? kWhiteColor
                    : kWhiteColor.withOpacity(0.5),
              )),
        ),
        label: label);
  }

  BottomNavigationBarItem _buildProfileNavBarItem(
      {required int index, required String asset, required String label}) {
    // ignore: unused_local_variable
    final CustomNavBarController controller =
        Get.find<CustomNavBarController>();

    return BottomNavigationBarItem(
        backgroundColor: kNavbarBg.withOpacity(0.72),
        icon: Align(
          alignment: Alignment.center,
          child: CircleAvatar(
                radius: 16.h, 
                backgroundImage: AssetImage(asset),
              )
        ),
        label: label);
  }
}
