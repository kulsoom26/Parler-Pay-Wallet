import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';
import '../../../utils/app_images.dart';

class PaymentMethodScreen extends GetView<NodeController> {
  const PaymentMethodScreen({super.key});

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
        key: controller.scaffoldKeyPaymentMethod,
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
              'Payment Methods',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Saved Payment Methods',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Select your preferred payment methods for your account. Charges will only apply when you complete a transaction.',
                  style: AppStyles.labelTextStyle().copyWith(color: kGray400),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(kSettingsEditCardRoute);
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 31.76.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.82.r),
                            color: kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              width: 1,
                              color: kWhiteColor.withOpacity(0.2),
                            )),
                        child: const Center(
                          child: Icon(
                            Icons.credit_card,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Mastercard ...4343',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 16.sp),
                      ),
                      const Spacer(),
                      Container(
                        height: 28.h,
                        width: 73.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            color: kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              width: 1,
                              color: kWhiteColor.withOpacity(0.2),
                            )),
                        child: Center(
                            child: Text(
                          'Default',
                          style: AppStyles.labelTextStyle()
                              .copyWith(fontSize: 12.sp),
                        )),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: kWhiteColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(kSettingsEditBankRoute);
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 31.76.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.82.r),
                            color: kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              width: 1,
                              color: kWhiteColor.withOpacity(0.2),
                            )),
                        child: Center(
                          child: Image.asset(
                            kBank,
                            width: 18.w,
                            height: 18.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Ally Bank (4567)',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 16.sp),
                      ),
                      const Spacer(),
                      // Container(
                      //   height: 28.h,
                      //   width: 73.w,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(32.r),
                      //       color: kWhiteColor.withOpacity(0.12),
                      //       border: Border.all(
                      //         width: 1,
                      //         color: kWhiteColor.withOpacity(0.2),
                      //       )),
                      //   child: Center(
                      //       child: Text(
                      //     'Default',
                      //     style: AppStyles.labelTextStyle()
                      //         .copyWith(fontSize: 12.sp),
                      //   )),
                      // ),
                      SizedBox(
                        width: 12.w,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: kWhiteColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                Text(
                  'Add Payment Method',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 26.h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const BottomSheetContent();
                      },
                    );
                  },
                  child: Container(
                    width: 361.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: kWhiteColor,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Add new payment method',
                          style: AppStyles.labelTextStyle()
                              .copyWith(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )
                // CustomButton(height: 52.h, width: 361.w, onPressed: (){}, bgColor: kRedColor, fontColor: kWhiteColor, title: 'Add new payment method'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
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
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  'Choose Payment Type',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(color: kGray500, width: 1.5),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: kWhiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.toNamed(kSettingsAddCardRoute);
              },
              child: Container(
                width: 361.w,
                height: 100.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: kWhiteColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  color: kWhiteColor.withOpacity(0.12),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Icon(
                          Icons.credit_card,
                          color: kWhiteColor.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Credit / Debit Card',
                              style: AppStyles.labelTextStyle().copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              overflow: TextOverflow.visible,
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              style: AppStyles.labelTextStyle()
                                  .copyWith(color: kGray400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.toNamed(kSettingsLinkBankRoute);
              },
              child: Container(
                width: 361.w,
                height: 100.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: kWhiteColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  color: kWhiteColor.withOpacity(0.12),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Image.asset(
                            kBank,
                            width: 24.h,
                            color: kWhiteColor.withOpacity(0.8),
                          )),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Link Bank Account',
                              style: AppStyles.labelTextStyle().copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              overflow: TextOverflow.visible,
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              style: AppStyles.labelTextStyle()
                                  .copyWith(color: kGray400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              height: 56.h,
              width: 361.w,
              onPressed: () {
                Get.back();
              },
              bgColor: kWhiteColor.withOpacity(0.12),
              fontColor: kWhiteColor,
              title: 'Cancel',
            )
          ],
        ),
      ),
    );
  }
}
