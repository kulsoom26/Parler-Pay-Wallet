import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../screens/create_wallet/controller/create_wallet_controller.dart';

class CustomProfileImagePicker extends StatefulWidget {
  const CustomProfileImagePicker({super.key});

  @override
  State<CustomProfileImagePicker> createState() =>
      _CustomProfileImagePickerState();
}

class _CustomProfileImagePickerState extends State<CustomProfileImagePicker> {
  CreateWalletController controller = Get.put(CreateWalletController());

  Future<void> _getImageFromCameraOrGallery(BuildContext context) async {
    await showModalBottomSheet<File?>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          'Camera',
                          style: AppStyles.labelTextStyle().copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: kBlueColor),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          await controller.getImageCamera();
                        },
                      ),
                      Divider(height: 1.h),
                      ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          'Gallery',
                          style: AppStyles.labelTextStyle().copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: kBlueColor),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          await controller.getImageGallery();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel', style: AppStyles.labelTextStyle().copyWith(color: kBlueColor, fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Obx(
            () => Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kWhiteColor, width: 2),
              ),
              child: controller.isUploading.isTrue
                  ? const CircularProgressIndicator(
                      color: kPrimaryColor,
                    )
                  : controller.imagePath.value.isEmpty
                      ? CircleAvatar(
                          radius: 150,
                          backgroundColor: Colors.transparent,
                          foregroundColor: kPrimaryColor,
                          child: Center(
                            child: Image.asset(kDummy) 
                            // Icon(
                            //   Icons.person,
                            //   color: kWhiteColor,
                            //   size: 70,
                            // ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 150,
                          backgroundColor: Colors.transparent,
                          foregroundColor: kPrimaryColor,
                          backgroundImage:
                              FileImage(File(controller.imagePath.value)),
                        ),
            ),
          ),
          GestureDetector(
              onTap: () async {
                _getImageFromCameraOrGallery(context);
              },
              child: Image.asset(
                kAddImage,
                width: 50.w,
              )),
        ],
      ),
    );
  }
}
