import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';
import '../../../utils/app_images.dart';

class SettingsAccountScreen extends GetView<NodeController> {
  const SettingsAccountScreen({super.key});

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
        key: controller.scaffoldKeyAccountScreen,
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
              'Account',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(kSettingsEditProfiletRoute);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      kDummy,
                      width: 56.w,
                    ),
                    title: Text(
                      'Edit Profile',
                      style: AppStyles.labelTextStyle().copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Edit your profile picture, cover photo and more.',
                      style:
                          AppStyles.labelTextStyle().copyWith(color: kGray400),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      kPublicIcon,
                      width: 20.w,
                    ),
                    title: Text(
                      'Public',
                      style: AppStyles.labelTextStyle()
                          .copyWith(color: kWhiteColor, fontSize: 16.sp),
                    ),
                    subtitle: Text(
                      'Anyone on ParlerPay can see.',
                      style: AppStyles.labelTextStyle()
                          .copyWith(fontSize: 14.sp, color: kGray400),
                    ),
                    trailing: Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isSelectedPublic.value = true;
                          controller.isSelectedFriends.value = false;
                          controller.isSelectedPrivate.value = false;
                        },
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: controller.isSelectedPublic.value
                                ? Colors.transparent
                                : kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              width: 1,
                              color: controller.isSelectedPublic.value
                                  ? kRedColor
                                  : kWhiteColor.withOpacity(0.17),
                            ),
                            borderRadius: BorderRadius.circular(9999.r),
                          ),
                          child: controller.isSelectedPublic.value
                              ? const Center(
                                  child: CircleAvatar(
                                    backgroundColor: kRedColor,
                                    radius: 5,
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    )),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      kFriendsIcon,
                      width: 20.w,
                    ),
                    title: Text(
                      'Friends',
                      style: AppStyles.labelTextStyle()
                          .copyWith(color: kWhiteColor, fontSize: 16.sp),
                    ),
                    subtitle: Text(
                      'Only friends on ParlerPay can see.',
                      style: AppStyles.labelTextStyle()
                          .copyWith(fontSize: 14.sp, color: kGray400),
                    ),
                    trailing: Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isSelectedPublic.value = false;
                          controller.isSelectedFriends.value = true;
                          controller.isSelectedPrivate.value = false;
                        },
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: controller.isSelectedFriends.value
                                ? Colors.transparent
                                : kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              width: 1,
                              color: controller.isSelectedFriends.value
                                  ? kRedColor
                                  : kWhiteColor.withOpacity(0.17),
                            ),
                            borderRadius: BorderRadius.circular(9999.r),
                          ),
                          child: controller.isSelectedFriends.value
                              ? const Center(
                                  child: CircleAvatar(
                                    backgroundColor: kRedColor,
                                    radius: 5,
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    )),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      kPrivateIcon,
                      width: 20.w,
                    ),
                    title: Text(
                      'Private',
                      style: AppStyles.labelTextStyle()
                          .copyWith(color: kWhiteColor, fontSize: 16.sp),
                    ),
                    subtitle: Text(
                      'Remove public details.',
                      style: AppStyles.labelTextStyle()
                          .copyWith(fontSize: 14.sp, color: kGray400),
                    ),
                    trailing: Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isSelectedPublic.value = false;
                          controller.isSelectedFriends.value = false;
                          controller.isSelectedPrivate.value = true;
                        },
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: controller.isSelectedPrivate.value
                                ? Colors.transparent
                                : kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              width: 1,
                              color: controller.isSelectedPrivate.value
                                  ? kRedColor
                                  : kWhiteColor.withOpacity(0.17),
                            ),
                            borderRadius: BorderRadius.circular(9999.r),
                          ),
                          child: controller.isSelectedPrivate.value
                              ? const Center(
                                  child: CircleAvatar(
                                    backgroundColor: kRedColor,
                                    radius: 5,
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
