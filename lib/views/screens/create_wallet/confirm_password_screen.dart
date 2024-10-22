import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_textfield.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/controller/create_wallet_controller.dart';


class ConfirmPasswordScreen extends GetView<CreateWalletController> {
  const ConfirmPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: controller.scaffoldKeyConfirmPassword,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    width: 36.5.w,
                    child: Divider(
                      color: kWhiteColor.withOpacity(0.32),
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 36.5.w,
                    child: const Divider(
                      color: kRedColor,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 36.5.w,
                    child: Divider(
                      color: kWhiteColor.withOpacity(0.32),
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 36.5.w,
                    child: Divider(
                      color: kWhiteColor.withOpacity(0.32),
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 36.5.w,
                    child: Divider(
                      color: kWhiteColor.withOpacity(0.32),
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 36.5.w,
                    child: Divider(
                      color: kWhiteColor.withOpacity(0.32),
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Confirm your password.',
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
                'We just want to take the extra secure step and make sure that you know your password.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomTextField(
                hint: 'Confirm password',
                controller: controller.confirmPassword,
                isPassword: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(() => AnimatedOpacity(
                opacity: controller.showConfirmPasswordError.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: controller.showConfirmPasswordError.isTrue
                    ? Container(
                        width: Get.width * 0.85,
                        height: 56.h,
                        decoration: BoxDecoration(
                            color: kRedColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: kRedColor, width: 1.5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 25.w,
                                height: 25.h,
                                padding: EdgeInsets.only(left: 10.w),
                                child: Image.asset(
                                  kWarningIcon,
                                  width: 20.w,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Flexible(
                                child: Text(
                                  overflow: TextOverflow.visible,
                                  'The password you entered does not match. Please try again.',
                                  style: AppStyles.labelTextStyle().copyWith(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              )),
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
              bgColor: controller.isDisabled2.isTrue
                  ? kRedColor.withOpacity(0.3)
                  : kRedColor,
              fontColor: controller.isDisabled2.isTrue
                  ? kWhiteColor.withOpacity(0.3)
                  : kWhiteColor,
              onPressed: () {
                if (controller.password.text !=
                    controller.confirmPassword.text) {
                 controller.showConfirmPasswordError.value = true;
                  Future.delayed(const Duration(seconds: 2), () {
                    controller.showConfirmPasswordError.value = false;
                  });
                } else {
                  Get.toNamed(kBackupRoute);
                }
              },
              title: "Continue"),
        ),
      ),
    );
  }
}
