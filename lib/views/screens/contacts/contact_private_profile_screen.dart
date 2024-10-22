import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/contacts/controller/contacts_controller.dart';

class ContactPrivateProfileDetailScreen extends GetView<ContactController> {
  const ContactPrivateProfileDetailScreen({super.key});

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
        key: controller.scaffoldKeyContactPrivateProfileDetail,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(controller: controller),
              const Divider(
                color: kStrokeColor,
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isActivity.value = true;
                          controller.isNFT.value = false;
                        },
                        child: Container(
                          width: 85.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            color: controller.isActivity.isTrue
                                ? kWhiteColor.withOpacity(0.12)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(9999.r),
                            border: Border.all(
                              color: controller.isActivity.isTrue
                                  ? kWhiteColor.withOpacity(0.2)
                                  : Colors.transparent,
                              width: controller.isActivity.isTrue ? 1 : 0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Activity',
                              style: AppStyles.labelTextStyle().copyWith(
                                  fontSize: 16.sp,
                                  color: controller.isActivity.isTrue
                                      ? kWhiteColor
                                      : kGray400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      width: 12.w,
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isActivity.value = false;
                          controller.isNFT.value = true;
                        },
                        child: Container(
                          width: 72.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            color: controller.isNFT.isTrue
                                ? kWhiteColor.withOpacity(0.12)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(9999.r),
                            border: Border.all(
                              color: controller.isNFT.isTrue
                                  ? kWhiteColor.withOpacity(0.2)
                                  : Colors.transparent,
                              width: controller.isNFT.isTrue ? 1 : 0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'NFT\'s',
                              style: AppStyles.labelTextStyle().copyWith(
                                  fontSize: 16.sp,
                                  color: controller.isNFT.isTrue
                                      ? kWhiteColor
                                      : kGray400),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Obx(() {
                if (controller.isActivity.isTrue) {
                  List<Widget> profileWidgets = [];
                  for (var item in controller.profileDetailList) {
                    profileWidgets.add(
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    color: kWhiteColor.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(999.r),
                                    border: Border.all(
                                      width: 1,
                                      color: item['color'],
                                    ),
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                    item['image'],
                                    width: item['width'],
                                  )),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      overflow: TextOverflow.visible,
                                      style: AppStyles.labelTextStyle()
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    Text(
                                      item['date'],
                                      style: AppStyles.labelTextStyle()
                                          .copyWith(
                                              color: kGray400, fontSize: 12.sp),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        item['isPlus']
                                            ? Text(
                                                '+ ',
                                                style:
                                                    AppStyles.labelTextStyle()
                                                        .copyWith(
                                                            fontSize: 16.sp,
                                                            color: kGreenColor),
                                              )
                                            : Text(
                                                '- ',
                                                style:
                                                    AppStyles.labelTextStyle()
                                                        .copyWith(
                                                            fontSize: 16.sp,
                                                            color: kRedColor),
                                              ),
                                        Text(
                                          item['amount'],
                                          overflow: TextOverflow.visible,
                                          style: AppStyles.labelTextStyle()
                                              .copyWith(fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      item['status'],
                                      style: AppStyles.labelTextStyle()
                                          .copyWith(
                                              color: kGray400, fontSize: 12.sp),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      item['isLike'].value =
                                          !item['isLike'].value;
                                      if (item['isLike'].value) {
                                        item['isDislike'].value = false;
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(999.r),
                                          color: item['isLike'].value
                                              ? Colors.transparent
                                              : kWhiteColor.withOpacity(0.12),
                                          border: Border.all(
                                              width: 1,
                                              color: item['isLike'].value
                                                  ? kRedColor
                                                  : kWhiteColor
                                                      .withOpacity(0.2))),
                                      child: Center(
                                        child: Image.asset(
                                          item['isLike'].value
                                              ? kLikeActiveIcon
                                              : kLikeInactiveIcon,
                                          width: 17.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      item['isDislike'].value =
                                          !item['isDislike'].value;
                                      if (item['isDislike'].value) {
                                        item['isLike'].value = false;
                                      }
                                    },
                                    child: Container(
                                      width: 40.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(999.r),
                                          color: item['isDislike'].value
                                              ? Colors.transparent
                                              : kWhiteColor.withOpacity(0.12),
                                          border: Border.all(
                                              width: 1,
                                              color: item['isDislike'].value
                                                  ? kRedColor
                                                  : kWhiteColor
                                                      .withOpacity(0.2))),
                                      child: Center(
                                        child: Image.asset(
                                          item['isDislike'].value
                                              ? kDislikeActiveIcon
                                              : kDislikeInactiveIcon,
                                          width: 17.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                      width: 40.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(999.r),
                                          color: kWhiteColor.withOpacity(0.12),
                                          border: Border.all(
                                              width: 1,
                                              color:  kWhiteColor
                                                      .withOpacity(0.2))),
                                      child: const Center(
                                        child: Icon(Icons.more_vert, color: kWhiteColor,)
                                      ),
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: profileWidgets,
                  );
                } else {
                  return Container();
                }
              })
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

  final ContactController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                kNotContactProfileHeader,
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
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_vert_sharp,
                    color: kWhiteColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Image.asset(
                  kUser6,
                  width: 56.w,
                  height: 56.h,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 83.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: kWhiteColor,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        color: kWhiteColor.withOpacity(0.12)),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add, color: kWhiteColor,),
                            SizedBox(width: 3.w,),
                            Text('Add', style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),)
                          ],
                        )),
                  ),
                ),
                SizedBox(width: 12.w,),
                GestureDetector(
                  onTap: () {
                    controller.isProfileFav1.value =
                        !controller.isProfileFav1.value;
                  },
                  child: Obx(
                    () => Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: controller.isProfileFav1.isTrue
                                ? Colors.amber
                                : kWhiteColor,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          color: controller.isProfileFav1.isTrue
                              ? Colors.amber.withOpacity(0.12)
                              : kWhiteColor.withOpacity(0.12)),
                      child: Center(
                        child: Obx(() => controller.isProfileFav1.isTrue
                            ? const Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            : const Icon(
                                Icons.star_border,
                                color: kWhiteColor,
                              )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: kWhiteColor,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        color: kWhiteColor.withOpacity(0.12)),
                    child: Center(
                        child: Image.asset(
                      kOpenIcon,
                      width: 15.w,
                    )),
                  ),
                ),
                
                
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Bessie Cooper',
                style: AppStyles.labelTextStyle()
                    .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '@bessie_cooper',
                style: AppStyles.labelTextStyle()
                    .copyWith(fontSize: 14.sp, color: kGray400),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Text(
                  '43',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  ' Rank',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 14.sp, color: kGray400),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  '13K',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  ' Friends',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 14.sp, color: kGray400),
                ),
               
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(kEnableContactRoute, arguments: {'service': 'send'});
                    },
                    child: Container(
                      width: 168.5.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          color: kRedColor,
                          borderRadius: BorderRadius.circular(9999.r)),
                      child: Center(
                        child: Text(
                          'Send',
                          style: AppStyles.labelTextStyle().copyWith(
                              color: kWhiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(kEnableContactRoute, arguments: {'service': 'request'});
                    },
                    child: Container(
                      width: 168.5.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                          color: kRedColor,
                          borderRadius: BorderRadius.circular(9999.r)),
                      child: Center(
                        child: Text(
                          'Request',
                          style: AppStyles.labelTextStyle().copyWith(
                              color: kWhiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
