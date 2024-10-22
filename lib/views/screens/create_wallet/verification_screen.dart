import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/controller/create_wallet_controller.dart';

import '../../../utils/app_images.dart';

class VerificationScreen extends GetView<CreateWalletController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: controller.scaffoldKeyVerification,
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
                  SizedBox(
                    width: 36.5.w,
                    child: const Divider(
                      color: kRedColor,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Verification Code',
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
                'Please enter the 6 digit verification code we have sent you. Your code will expire in 15 minutes.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  fillColor: kWhiteColor.withOpacity(0.12),
                  alignment: Alignment.center,
                  filled: true,
                  borderColor: kWhiteColor,
                  contentPadding: EdgeInsets.zero,
                  borderWidth: 1,
                  fieldWidth: 50.w,
                  fieldHeight: 50.h,
                  borderRadius: BorderRadius.circular(25.r),
                  showFieldAsBox: true,
                  focusedBorderColor: kWhiteColor,
                  enabledBorderColor: kWhiteColor.withOpacity(0.32),
                  textStyle: AppStyles.labelTextStyle()
                      .copyWith(color: kWhiteColor, fontSize: 16.sp),
                  onSubmit: (code) {
                    controller.code = code;
                    controller.isDisabledVerification.value = false;
                  }),
              SizedBox(
                height: 16.h,
              ),
              Obx(() => AnimatedOpacity(
                    opacity: controller.showVerificationError.value ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: controller.showVerificationError.isTrue
                        ? Container(
                            width: Get.width * 0.85,
                            height: 56.h,
                            decoration: BoxDecoration(
                                color: kRedColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12.r),
                                border:
                                    Border.all(color: kRedColor, width: 1.5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.h, vertical: 5.h),
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
                                      'The code you entered was incorrect. Please try again.',
                                      style:
                                          AppStyles.labelTextStyle().copyWith(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            height: 56.h,
                          ),
                  )),
              SizedBox(
                height: 300.h,
              ),
              Obx(
                () => CustomButton(
                    height: 56.h,
                    width: 361.w,
                    bgColor: controller.isDisabledVerification.isTrue
                        ? kRedColor.withOpacity(0.3)
                        : kRedColor,
                    fontColor: controller.isDisabledVerification.isTrue
                        ? kWhiteColor.withOpacity(0.3)
                        : kWhiteColor,
                    onPressed: controller.isDisabledVerification.isTrue
                        ? () {}
                        : () {
                            print(controller.code);
                            if (controller.code != '123456') {
                              controller.showVerificationError.value = true;
                              print('errror...................');
                              Future.delayed(Duration(seconds: 2), () {
                                controller.showVerificationError.value = false;
                              });
                            } else {
                              Get.toNamed(kProfileImageRoute);
                            }
                          },
                    title: "Continue"),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Didn’t receive a code?',
                      style:
                          AppStyles.labelTextStyle().copyWith(color: kGray200),
                      children: [
                        TextSpan(
                            text: ' Send Again',
                            style: AppStyles.labelTextStyle()
                                .copyWith(color: kBlueColor))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
