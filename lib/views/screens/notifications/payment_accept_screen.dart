import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_loader.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_textfield.dart';
import 'package:parler_pay_wallet/views/screens/notifications/controller/notifications_controller.dart';

import '../../../utils/app_images.dart';

class PaymentAcceptScreen extends GetView<NotificationController> {
  const PaymentAcceptScreen({super.key});

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
        key: controller.scaffoldKeyNotificationPaymentAccept,
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
              'Payment Request',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25.h),
                Container(
                  width: Get.width,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        color: kWhiteColor.withOpacity(0.2),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(9999.r)),
                  child: ListTile(
                    minVerticalPadding: 2,
                    minTileHeight: 45,
                    contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
                    leading: Image.asset(
                      kToken,
                      width: 28.w,
                    ),
                    title: RichText(
                      text: TextSpan(
                        style: AppStyles.labelTextStyle().copyWith(),
                        children: const [
                          TextSpan(text: '224,682,234.21836174 '),
                          TextSpan(
                            text: 'OPTIO',
                            style: TextStyle(color: kGray400),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.visible,
                    ),
                    subtitle: Text(
                      '\$5,564.12 available',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.labelTextStyle().copyWith(
                        color: kGreyIconColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 106.h),
                Image.asset(kUser7, width: 64.w,),
                SizedBox(height: 10.h,),
                Text('Jenny Johnson has sent you a request.', style: AppStyles.labelTextStyle().copyWith(color: kGray400, fontSize: 18.sp),),
                SizedBox(height: 24.h,),
                Row(
                  children: [
                    Text('4,224.21', style: AppStyles.labelTextStyle().copyWith(fontSize: 60.sp),),
                    SizedBox(width: 12.w,),
                    Text('OPTIO', style: AppStyles.labelTextStyle().copyWith(color: kGray200, fontSize: 30.sp),)
                  ],
                ),
                SizedBox(height: 4.h,),
                Text('\$221.21', style: AppStyles.labelTextStyle().copyWith(fontSize: 30.sp),),
                SizedBox(height: 180.h,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => _enterPasscodeModal(context),
                );
                      },
                      child: Container(
                        width: 172.5.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: kRedColor,
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(kCheckIcon, width: 13.33.w),
                            SizedBox(width: 8.w,),
                            Text('Accept', style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                     GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 172.5.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: kRedColor
                          ),
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(kCloseIcon, width: 8.33.w, color: kRedColor,),
                            SizedBox(width: 8.w,),
                            Text('Decline', style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _enterPasscodeModal(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 80.w,
            child: const Divider(
              color: kGray500,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: 40.w,
              ),
              Center(
                  child: Text(
                'Preview Transaction',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
              )),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        color: kWhiteColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child:
                        const Center(child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          SizedBox(height: 28.h),
          Text('Enter Your Passcode',
              style: AppStyles.labelTextStyle().copyWith(
                  color: kWhiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'This passcode serves as a protective shield, safeguarding your account from unauthorized access. ',
            textAlign: TextAlign.center,
            style: AppStyles.labelTextStyle().copyWith(color: kGray200),
          ),
          SizedBox(
            height: 16.h,
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.passcode[index].isNotEmpty
                              ? kWhiteColor
                              : kWhiteColor.withOpacity(0.32),
                          width: 1),
                      borderRadius: BorderRadius.circular(30.r),
                      color: kWhiteColor.withOpacity(0.12)),
                  child: Center(
                    child: Text(
                      controller.passcode[index],
                      style: TextStyle(color: kWhiteColor, fontSize: 24.sp),
                    ),
                  ),
                );
              }),
            );
          }),
          SizedBox(height: 20.h),
          Center(
            child: SizedBox(
              width: 221.w,
              height: 64.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((1).toString());
                      },
                      child: Text(
                        (1).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((2).toString());
                      },
                      child: Text(
                        (2).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((3).toString());
                      },
                      child: Text(
                        (3).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: SizedBox(
              width: 221.w,
              height: 64.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((4).toString());
                      },
                      child: Text(
                        (4).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((5).toString());
                      },
                      child: Text(
                        (5).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((6).toString());
                      },
                      child: Text(
                        (6).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: SizedBox(
              width: 221.w,
              height: 64.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((7).toString());
                      },
                      child: Text(
                        (7).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((8).toString());
                      },
                      child: Text(
                        (8).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((9).toString());
                      },
                      child: Text(
                        (9).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: SizedBox(
              width: 221.w,
              height: 64.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        '',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                      onTap: () {
                        controller.addDigit((0).toString());
                      },
                      child: Text(
                        (0).toString(),
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 36.sp),
                      )),
                  GestureDetector(
                    onTap: () {
                      controller.removeLastDigit();
                    },
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
              height: 56.h,
              width: Get.width,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => _enterPasswordModal(context),
                );
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: 'Continue'),
          SizedBox(
            height: 16.h,
          ),
          Center(
              child: GestureDetector(
            onTap: () {},
            child: Text(
              'I forgot my passcode',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ))
        ],
      ),
    );
  }

  Widget _enterPasswordModal(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 80.w,
            child: const Divider(
              color: kGray500,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: 40.w,
              ),
              Center(
                  child: Text(
                'Preview Transaction',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
              )),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        color: kWhiteColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child:
                        const Center(child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Text('Enter your password',
              style: AppStyles.labelTextStyle().copyWith(
                  color: kWhiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'This passcode serves as a protective shield, safeguarding your account from unauthorized access. ',
            textAlign: TextAlign.center,
            style: AppStyles.labelTextStyle().copyWith(color: kGray200),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
              hint: 'Password:', controller: TextEditingController()),
          SizedBox(
            height: 300.h,
          ),
          CustomButton(
              height: 56.h,
              width: Get.width,
              onPressed: () {
                Get.back();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => LoadingModal(
                    isRequest: false,
                  ),
                );
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: 'Continue'),
          SizedBox(
            height: 16.h,
          ),
          Center(
              child: GestureDetector(
            onTap: () {},
            child: Text(
              'I forgot my password',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ))
        ],
      ),
    );
  }
}
