import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/controller/create_wallet_controller.dart';

import '../../custom_widgets/custom_textfield.dart';

class CreateProfileScreen extends GetView<CreateWalletController> {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: controller.scaffoldKeyCreateProfile,
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
                'Create your profile.',
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
                'Your profile will allow you and your friends to easily find one another and send payments back and fourth.',
                style: AppStyles.labelTextStyle().copyWith(color: kGreyColor),
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomTextField(
                hint: 'Enter your email address',
                controller: controller.profileEmail,
                isPassword: false,
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
              bgColor: controller.isDisabledCreateProfile.isTrue
                  ? kRedColor.withOpacity(0.3)
                  : kRedColor,
              fontColor: controller.isDisabledCreateProfile.isTrue
                  ? kWhiteColor.withOpacity(0.3)
                  : kWhiteColor,
              onPressed: controller.isDisabledCreateProfile.isTrue ? (){}:() {
                
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
  const BottomSheetContent({super.key});

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
          Image.asset(kUserIcon, width: 35.w,),
          SizedBox(height: 16.sp),
          Text(
            'We found an account.',
            style: AppStyles.labelTextStyle().copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.normal,
                color: kBlackColor),
          ),
          const SizedBox(height: 16),
          Text(
            'We found a Parler account with this email address. Do you want to link this account?',
            textAlign: TextAlign.center,
            style: AppStyles.labelTextStyle()
                .copyWith(color: kGray600, fontSize: 16.sp),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: (){
              Get.back();
              Get.toNamed(kVerificationRoute);
            },
            child: Center(
              child: Text('Skip this', style: AppStyles.labelTextStyle().copyWith(color: kBlackColor, fontSize: 16.sp, fontWeight: FontWeight.w600),),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: Get.width * 0.9,
                  height: 56.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999.r),
                      border: Border.all(
                        color: const Color(0xFFD4D4D4),
                        width: 1
                      )),
                      
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
                        'Link Parler account',
                        style: AppStyles.labelTextStyle().copyWith(
                            color: kGray700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}


