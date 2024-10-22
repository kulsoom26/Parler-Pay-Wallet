import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/screens/auth/controller/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: controller.scaffoldKeyLogin,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: kWhiteColor, width: 1)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: kWhiteColor,
                      size: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Log In',
                style: AppStyles.labelTextStyle().copyWith(
                    color: kWhiteColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                textAlign: TextAlign.justify,
                'Log into your account with your 6 digit passcode.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.passcode[index].isNotEmpty
                                  ? kWhiteColor
                                  : kWhiteColor.withOpacity(0.32),
                              width: 1),
                          borderRadius: BorderRadius.circular(30.r),
                          color: kWhiteColor.withOpacity(0.12)),
                      child: Center(
                        child: Text(
                          controller.passcode[index],
                          style: TextStyle(color: kWhiteColor, fontSize: 24.sp),
                        ),
                      ),
                    );
                  }),
                );
              }),
              SizedBox(height: 48.h),
              Center(
                child: SizedBox(
                  width: 300.w,
                  height: 64.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((1).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (1).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((2).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (2).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((3).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (3).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: SizedBox(
                  width: 300.w,
                  height: 64.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((4).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (4).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((5).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (5).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((6).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (6).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: SizedBox(
                  width: 300.w,
                  height: 64.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((7).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (7).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((8).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (8).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((9).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (9).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: SizedBox(
                  width: 300.w,
                  height: 64.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addDigit((0).toString());
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              (0).toString(),
                              style: AppStyles.labelTextStyle()
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.removeLastDigit();
                        },
                        child: Container(
                          height: 60.h,
                          width: 100.w,
                          color: Colors.transparent,
                          child: const Center(
                            child: Icon(
                              Icons.backspace_outlined,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              Obx(
                () => CustomButton(
                    height: 56.h,
                    width: 361.w,
                    bgColor: controller.isPasscodeComplete.value
                        ? kRedColor
                        : kRedColor.withOpacity(0.3),
                    fontColor: controller.isPasscodeComplete.value
                        ? kWhiteColor
                        : kWhiteColor.withOpacity(0.3),
                    onPressed: controller.isPasscodeComplete.value
                        ? () {
                            Get.toNamed(kBottomNavbarRoute);
                          }
                        : () {},
                    title: "Log In"),
              ),
              SizedBox(
                height: 32.h,
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(kForgotPasscodeRoute);
                },
                child: Text(
                  'I forgot my passcode',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
