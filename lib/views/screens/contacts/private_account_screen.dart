import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/contacts/controller/contacts_controller.dart';

class PrivateAccountDetailScreen extends GetView<ContactController> {
  const PrivateAccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kRedColor,kPrimaryColor2, kPrimaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        key: controller.scaffoldKeyPrivateAccountDetail,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(controller: controller),
              Divider(
                color: kStrokeColor,
              ),
              SizedBox(
                height: 118.87.h,
              ),
              Center(child: Image.asset(kPrivateIcon, width: 36.67,)),
              SizedBox(height: 18.h,),
              Center(
                child: Text(
                  'Private Account', style: AppStyles.labelTextStyle().copyWith(fontSize: 18.sp, color: kWhiteColor, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.h,),
              Center(
                child: Text(
                  'This account is set to private.', style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp, color: kGray400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.controller,
  });

  final ContactController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      width: Get.width,
      
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(0.12),
                        border: Border.all(width: 1, color: kWhiteColor),
                        borderRadius: BorderRadius.circular(9999.r)),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.more_vert_sharp,
                    color: kWhiteColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(999.r),
                    border: Border.all(width: 1, color: kWhiteColor.withOpacity(0.17))
                  ),
                  child: Center(
                    child: Image.asset(kContactUserIcon, width: 22.4,),
                  ),
                ),
                Spacer(),
                
                GestureDetector(
                  onTap: () {
                    controller.isProfileFav1.value =
                        !controller.isProfileFav1.value;
                  },
                  child: Obx(
                    () => Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: controller.isProfileFav1.isTrue
                                ? Colors.amber
                                : kWhiteColor,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          color: controller.isProfileFav1.isTrue
                              ? Colors.amber.withOpacity(0.12)
                              : kWhiteColor.withOpacity(0.12)),
                      child: Center(
                        child: Obx(() => controller.isProfileFav1.isTrue
                            ? Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            : Icon(
                                Icons.star_border,
                                color: kWhiteColor,
                              )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: kWhiteColor,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        color: kWhiteColor.withOpacity(0.12)),
                    child: Center(
                        child: Image.asset(
                      kOpenIcon,
                      width: 15.w,
                    )),
                  ),
                ),
                
                
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.labelTextStyle()
                    .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Private Account',
                style: AppStyles.labelTextStyle()
                    .copyWith(fontSize: 14.sp, color: kGray400),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Text(
                  '5,311,321',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  ' Rank',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 14.sp, color: kGray400),
                ),
                
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(kEnableContactRoute, arguments: {'service': 'send'});
                    },
                    child: Container(
                      width: 168.5.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          color: kRedColor,
                          borderRadius: BorderRadius.circular(9999.r)),
                      child: Center(
                        child: Text(
                          'Send',
                          style: AppStyles.labelTextStyle().copyWith(
                              color: kWhiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(kEnableContactRoute, arguments: {'service': 'request'});
                    },
                    child: Container(
                      width: 168.5.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          color: kRedColor,
                          borderRadius: BorderRadius.circular(9999.r)),
                      child: Center(
                        child: Text(
                          'Request',
                          style: AppStyles.labelTextStyle().copyWith(
                              color: kWhiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
