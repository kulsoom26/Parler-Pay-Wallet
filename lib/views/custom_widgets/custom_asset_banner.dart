import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class CustomAssetBanner extends StatelessWidget {
  const CustomAssetBanner({
    super.key,
    required this.subtitle,
    required this.isTapNPay,
  });

  final String subtitle;
  final bool isTapNPay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Balance',
            style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
          ),
          SizedBox(height: 3.h),
          Text(
            '\$453.21',
            style: AppStyles.labelTextStyle().copyWith(
              color: kWhiteColor,
              fontSize: 48.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            subtitle,
            style: AppStyles.labelTextStyle().copyWith(
              color: kWhiteColor,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 48.h),
          Padding(
            padding: isTapNPay ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: kWhiteColor.withOpacity(0.12),
                        child: Center(
                          child: Image.asset(kConvertIcon, width: 20.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Convert',
                      style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: kWhiteColor.withOpacity(0.12),
                        child: Center(
                          child: Image.asset(kSendMoneyIcon, width: 15.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Send',
                      style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: kWhiteColor.withOpacity(0.12),
                        child: Center(
                          child: Image.asset(kQRIcon, width: 20.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Receive',
                      style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
                    ),
                  ],
                ),
                if (isTapNPay)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(kParlerPayRoute);
                        },
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: kBlueColor,
                          child: Center(
                            child: Icon(Icons.add, color: kWhiteColor, size: 20.w),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Tap & Pay',
                        style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}