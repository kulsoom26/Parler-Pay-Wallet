import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_textfield.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';
import '../../custom_widgets/custom_image_picker.dart';

class SettingsEditProfileScreen extends GetView<NodeController> {
  const SettingsEditProfileScreen({super.key});

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
        key: controller.scaffoldKeyEditProfile,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(controller: controller),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    CustomTextField(hint: 'First Name', controller: controller.firstName, width: 174.5, hintColor: kWhiteColor,),
                    const Spacer(),
                    CustomTextField(hint: 'Last Name', controller: controller.lastName, width: 174.5, hintColor: kWhiteColor,),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomTextField(hint: 'Username', controller: controller.userName, hintColor: kWhiteColor,),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomTextField(hint: 'Enter your email address', controller: controller.email, hintColor: kWhiteColor,),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomTextField(hint: 'Phone number', controller: controller.phone, hintColor: kWhiteColor,),
              ),
              SizedBox(height: 48.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomButton(height: 56.h, width: 361.w, onPressed: (){Get.back();}, bgColor: kRedColor, fontColor: kWhiteColor, title: 'Save'),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kDeleteIcon, width: 15.w,),
                  SizedBox(width: 8.w,),
                  Text('Delete account', style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp, color: kGray400),)
                ],
              )       
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.controller,
  });

  final NodeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                kProfileHeader1,
              ),
              fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(0.12),
                        border: Border.all(width: 1, color: kWhiteColor),
                        borderRadius: BorderRadius.circular(9999.r)),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w,),
                Text('Edit Profile', style: AppStyles.labelTextStyle().copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(kDeleteIcon, width: 24.w,)
                )
              ],
            ),
            SizedBox(
              height: 59.h,
            ),
            const CustomProfileImagePicker()
            
          ],
        ),
      ),
    );
  }
}
