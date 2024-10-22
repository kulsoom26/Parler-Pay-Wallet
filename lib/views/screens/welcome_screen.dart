import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_scaffold.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKeyWelcome = GlobalKey<ScaffoldState>();
    return CustomScaffold(
      className: runtimeType.toString(),
      screenName: '',
      scaffoldKey: scaffoldKeyWelcome,
      padding: EdgeInsets.zero,
      isFullBody: true,
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Image.asset(kWelcomeBg1, width: Get.width),
            Positioned(
              top: 460,
              left: 0,
              right: 0,
              child: Image.asset(
                kLogo,
                width: 143.w,
                height: 55.h,
              ),
            ),
            Positioned(
              top: 55,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(kLoginRoute);
                },
                child: Text(
                  'Log In',
                  style: AppStyles.labelTextStyle().copyWith(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              top: 540,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Manage & Use Your\nDigital Rewards',
                  style: AppStyles.labelTextStyle().copyWith(fontSize: 30.sp),
                ),
              ),
            ),
            Positioned(
              top: 660,
              left: 15,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(kLoginRoute);
                },
                child: Container(
                  width: Get.width * 0.9,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(9999.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        kInitial,
                        width: 24.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Sign in with Parler',
                        style: AppStyles.labelTextStyle().copyWith(
                            color: kGray700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(kCreatePasswordRoute);
                  },
                  child: Center(
                    child: Text(
                      'I don\'t have an account',
                      style: AppStyles.labelTextStyle().copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
