import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';

class NotificationSettingsScreen extends GetView<NodeController> {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        key: controller.scaffoldKeyNotificationSettings,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 32.w,
                height: 32.h,
                margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(color: kWhiteColor, width: 1.5),
                  color: kWhiteColor.withOpacity(0.12),
                ),
                child: const Center(
                  child: Icon(Icons.keyboard_arrow_left,
                      color: kWhiteColor, size: 20),
                ),
              ),
            ),
            title: Text(
              'Notifications Settings',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Push notifications',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.w,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Push notifications',
                    style: AppStyles.labelTextStyle().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Push notifications are messages sent from our app to your device.',
                    style: AppStyles.labelTextStyle().copyWith(
                      color: kGray400,
                    ),
                  ),
                  trailing: Obx(
                    () => Switch(
                      activeColor: kRedColor,
                      inactiveTrackColor: kWhiteColor.withOpacity(0.17),
                      activeTrackColor: kRedColor,
                      thumbColor: WidgetStateProperty.all(kWhiteColor),
                      value: controller.isPushNot.value,
                      onChanged: (bool value) {
                        controller.isPushNot.value =
                            !controller.isPushNot.value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(kSettingsAccountActivityRoute);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Account activity',
                      style: AppStyles.labelTextStyle().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Pause notifications for a short time',
                      style: AppStyles.labelTextStyle().copyWith(
                        color: kGray400,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(kSettingsSecurityAlertsRoute);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Security alerts',
                      style: AppStyles.labelTextStyle().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Pause notifications for a short time',
                      style: AppStyles.labelTextStyle().copyWith(
                        color: kGray400,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(kSettingsProductAnnouncementRoute);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Product announcements',
                      style: AppStyles.labelTextStyle().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Pause notifications for a short time',
                      style: AppStyles.labelTextStyle().copyWith(
                        color: kGray400,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: kWhiteColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
