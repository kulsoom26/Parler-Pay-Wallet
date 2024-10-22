import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/screens/auth/controller/auth_controller.dart';

import '../../custom_widgets/custom_textfield.dart';

class ForgotPasscodeScreen extends GetView<AuthController> {
  const ForgotPasscodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: controller.scaffoldForgotPasscode,
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
                'Forgot Passcode?',
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
                'Log into your account with your secure password.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomTextField(
                hint: 'Create a password',
                controller: controller.forgotPasscode,
                isPassword: true,
              ),
              SizedBox(
                height: 380.h,
              ),
              Obx(
                () => CustomButton(
                    height: 56.h,
                    width: 361.w,
                    bgColor: controller.isDisabled.value
                        ? kRedColor.withOpacity(0.3)
                        : kRedColor,
                    fontColor: controller.isDisabled.value
                        ? kWhiteColor.withOpacity(0.3)
                        : kWhiteColor,
                    onPressed: controller.isDisabled.value ? () {} : () {},
                    title: "Log In"),
              ),
              SizedBox(
                height: 32.h,
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(kForgotPasswordRoute);
                },
                child: Text(
                  'I forgot my password',
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
