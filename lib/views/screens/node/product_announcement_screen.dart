import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';

class ProductAnnouncementScreen extends GetView<NodeController> {
  const ProductAnnouncementScreen({super.key});

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
        key: controller.scaffoldKeyProductAnnouncements,
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
              'Product Announcements',
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
                  'Product Announcement notifications',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Text(
                  'Product announcements include notifications about new features, app updates, security patches, upcoming releases, and special promotions or offers.',
                  style: AppStyles.labelTextStyle().copyWith(color: kGray400),
                ),
                SizedBox(
                  height: 24.h,
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
                      value: controller.isPushNot3.value,
                      onChanged: (bool value) {
                        controller.isPushNot3.value =
                            !controller.isPushNot3.value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'In-app',
                    style: AppStyles.labelTextStyle().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'In-app notifications are messages or alerts that appear within the app itself to provide real-time updates.',
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
                      value: controller.isInAppProductAnnoun.value,
                      onChanged: (bool value) {
                        controller.isInAppProductAnnoun.value =
                            !controller.isInAppProductAnnoun.value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Email',
                    style: AppStyles.labelTextStyle().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Email notifications are sent to your email address.',
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
                      value: controller.isEmailProdAnnoun.value,
                      onChanged: (bool value) {
                        controller.isEmailProdAnnoun.value =
                            !controller.isEmailProdAnnoun.value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Text message',
                    style: AppStyles.labelTextStyle().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Text message notifications are sent to your phone number.',
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
                      value: controller.isTextProdAnnoun.value,
                      onChanged: (bool value) {
                        controller.isTextProdAnnoun.value =
                            !controller.isTextProdAnnoun.value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
