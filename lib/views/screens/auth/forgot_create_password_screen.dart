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

class ForgotCreatePasswordScreen extends GetView<AuthController> {
  const ForgotCreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: controller.scaffoldKeyForgotCreatePassword,
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
                'Create a password.',
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
                'Please create a secure password for your recovery backup and save it somewhere safe. We cannot reset or access your password at anytime, so make sure you store it in a safe place.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomTextField(
                hint: 'Create a password',
                controller: controller.forgotCreatePassword,
                isPassword: true,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isCheck.value = !controller.isCheck.value;
                        if (controller.isCheck.isTrue &&
                            controller.forgotCreatePassword.text != '') {
                          controller.isDisabled2.value = false;
                        }
                        if (!controller.isCheck.value) {
                          controller.isDisabled2.value = true;
                        }
                      },
                      child: Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: controller.isCheck.isFalse
                                ? Border.all(color: kGreyColor, width: 1)
                                : null,
                            color: controller.isCheck.isFalse
                                ? Colors.transparent
                                : kCheckBoxFilledColor),
                        child: controller.isCheck.isFalse
                            ? null
                            : const Center(
                                child: Icon(
                                  Icons.check,
                                  color: kWhiteColor,
                                  size: 20,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: Text(
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.visible,
                      'I understand that if I lose my password, I will not be able to access my recovery phrase, resulting in the loss of all my assets.',
                      style: AppStyles.labelTextStyle()
                          .copyWith(color: kGreyColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 270.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        child: Obx(
          () => CustomButton(
              height: 56.h,
              width: 361.w,
              bgColor: controller.isDisabled2.value
                  ? kRedColor.withOpacity(0.3)
                  : kRedColor,
              fontColor: controller.isDisabled2.value
                  ? kWhiteColor.withOpacity(0.3)
                  : kWhiteColor,
              onPressed: controller.isDisabled2.value
                  ? () {}
                  : () {
                      Get.toNamed(kResetConfirmPasswordRoute);
                    },
              title: "Continue"),
        ),
      ),
    );
  }
}
