import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/controller/create_wallet_controller.dart';

class BackupScreen extends GetView<CreateWalletController> {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: controller.scaffoldKeyBackUp,
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
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Backup your wallet.',
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
                'This is your secret recovery phrase. It is used to recover your assets if you ever lose your device or switch to a different wallet.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                textAlign: TextAlign.justify,
                'Please save these 12 words in a secure location and never share them with anyone.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              Container(
                width: Get.width,
                height: 80.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kWhiteColor),
                    borderRadius: BorderRadius.circular(20.r),
                    color: kWhiteColor.withOpacity(0.12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Obx(
                          () => Text(
                            overflow: TextOverflow.visible,
                            controller.isShowCode.isFalse
                                ? controller.backUpCodeHide.value
                                : controller.backUpCode.value,
                            style: AppStyles.labelTextStyle()
                                .copyWith(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: GestureDetector(
                          onTap: () {
                            controller.isShowCode.value =
                                !controller.isShowCode.value;
                          },
                          child: Icon(
                            controller.isShowCode.isTrue
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: kGreyIconColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: controller.backUpCode.value));

                        controller.showCopiedMessage.value = true;
                        Future.delayed(Duration(seconds: 2), () {
                          controller.showCopiedMessage.value = false;
                        });
                      },
                      child: const Icon(
                        Icons.copy,
                        color: kWhiteColor,
                        size: 20,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Copy to clipboard',
                    style: AppStyles.labelTextStyle()
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(() => Center(
                    child: AnimatedOpacity(
                      opacity: controller.showCopiedMessage.value ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: controller.showCopiedMessage.isTrue
                          ? Container(
                              width: 122.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                  color: kGreenColor.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                      color: kGreenColor, width: 1.5)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.h, vertical: 5.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: kGreenColor,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'Copied',
                                      style:
                                          AppStyles.labelTextStyle().copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ),
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
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetContent();
                  },
                );
              },
              title: "Continue"),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 80.w,
            child: const Divider(
              color: kGray500,
              thickness: 1.5,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGray500, width: 1.5),
                  borderRadius: BorderRadius.circular(16.r)),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Center(
                  child: Icon(
                    Icons.close,
                    color: kBlackColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          const Icon(Icons.warning_amber_rounded, size: 50, color: kRedColor),
          SizedBox(height: 16.sp),
          Text(
            'Warning',
            style: AppStyles.labelTextStyle().copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.normal,
                color: kBlackColor),
          ),
          const SizedBox(height: 16),
          Text(
            'If you lose your recovery phrase, we cannot be held responsible for losses or liabilities resulting from not following the security instructions.',
            textAlign: TextAlign.center,
            style: AppStyles.labelTextStyle()
                .copyWith(color: kGray600, fontSize: 16.sp),
          ),
          const SizedBox(height: 24),
          CustomButton(
              height: 56.h,
              width: Get.width * 0.9,
              onPressed: () {
                Get.back();
                Get.toNamed(kCreatePasscodeRoute);
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: "I Understand"),
        ],
      ),
    );
  }
}
