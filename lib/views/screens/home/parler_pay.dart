import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';
import '../../../utils/app_styles.dart';

class ParlerPayScreen extends GetView<HomeController> {
  const ParlerPayScreen({super.key});

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
        key: controller.scaffoldKeyParlerPay,
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
            'Use Digital Asset',
            style: AppStyles.appBarHeadingTextStyle().copyWith(fontSize: 24.sp),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Image.asset(kOpenIcon, width: 24.w),
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 361.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: kWhiteColor.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(9999.r),
                    color: kWhiteColor.withOpacity(0.12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.parleyPayIndex.value = 0;
                        },
                        child: Obx(
                          () => Container(
                            width: 117.67.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: controller.parleyPayIndex.value == 0
                                  ? kWhiteColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(9999.r),
                            ),
                            child: Center(
                              child: Text(
                                'Receive OPTIO',
                                style: AppStyles.labelTextStyle().copyWith(
                                    color: controller.parleyPayIndex.value == 0
                                        ? kBlackColor
                                        : kWhiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.parleyPayIndex.value = 1;
                        },
                        child: Obx(
                          () => Container(
                            width: 117.67.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: controller.parleyPayIndex.value == 1
                                  ? kWhiteColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(9999.r),
                            ),
                            child: Center(
                              child: Text(
                                'Parler Pay',
                                style: AppStyles.labelTextStyle().copyWith(
                                    color: controller.parleyPayIndex.value == 1
                                        ? kBlackColor
                                        : kWhiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.parleyPayIndex.value = 2;
                        },
                        child: Obx(
                          () => Container(
                            width: 117.67.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: controller.parleyPayIndex.value == 2
                                  ? kWhiteColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(9999.r),
                            ),
                            child: Center(
                              child: Text(
                                'Scan Code',
                                style: AppStyles.labelTextStyle().copyWith(
                                    color: controller.parleyPayIndex.value == 2
                                        ? kBlackColor
                                        : kWhiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Container(
                  width: 329.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        width: 1,
                        color: kWhiteColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(9999)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                    child: Row(
                      children: [
                        Image.asset(
                          kToken,
                          width: 28.w,
                          height: 28.h,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Column(
                          children: [
                            Text(
                              'Optio',
                              style: AppStyles.labelTextStyle(),
                            ),
                            Text(
                              'Optio',
                              style: AppStyles.labelTextStyle().copyWith(
                                  color: kGreyIconColor, fontSize: 12.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: kWhiteColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 329.w,
                  height: 527.h,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scan to send payment',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 18.sp, color: kBlackColor),
                      ),
                      Image.asset(kQRImage),
                      Image.asset(
                        kParlerPayLogo,
                        width: 115.w,
                        height: 45.h,
                      )
                    ],
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
