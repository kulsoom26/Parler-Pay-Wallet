import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';
import '../../../utils/app_images.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';

class EditBankScreen extends GetView<NodeController> {
  const EditBankScreen({super.key});

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
        key: controller.scaffoldKeyEditBank,
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
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    kDeleteIcon,
                    width: 18.w,
                  ),
                ),
              )
            ],
            title: Text(
              'Edit bank ending in ...4567',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(
                  hint: "Name",
                  controller: controller.bankName,
                  hintColor: kWhiteColor,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  hint: "Account Number",
                  controller: controller.accountNumber,
                  isPassword: true,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  hint: 'IBAN Number',
                  controller: controller.iban,
                  isPassword: true,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  hint: 'Number',
                  controller: controller.num,
                  isPassword: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isCheck.value = !controller.isCheck.value;
                        },
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: controller.isCheck.isFalse
                                  ? Border.all(color: kGreyColor, width: 1)
                                  : null,
                              color: controller.isCheck.isFalse
                                  ? Colors.transparent
                                  : kCheckBoxFilledColor),
                          child: controller.isCheck.isFalse
                              ? null
                              : const Center(
                                  child: Icon(
                                    Icons.check,
                                    color: kWhiteColor,
                                    size: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Save as default payment method.',
                            style: AppStyles.labelTextStyle().copyWith(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.visible,
                            'I understand that if I lose my password, I will not be able to access my recovery phrase, resulting in the loss of all my assets.',
                            style: AppStyles.labelTextStyle()
                                .copyWith(color: kGreyColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150.h,
                ),
                CustomButton(
                    height: 56.h,
                    width: 361.w,
                    onPressed: () {
                      Get.back();
                    },
                    bgColor: kRedColor,
                    fontColor: kWhiteColor,
                    title: 'Save'),
                SizedBox(
                  height: 20.h,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        kDeleteIcon,
                        width: 15.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Delete',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 16.sp, color: kGray400),
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
            SizedBox(
              height: 16.h,
            ),
            const Icon(Icons.warning_amber_rounded, size: 50, color: kRedColor),
            SizedBox(height: 16.sp),
            Text(
              'Are you sure?',
              style: AppStyles.labelTextStyle().copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: AppStyles.labelTextStyle().copyWith(color: kGray400),
                children: const [
                  TextSpan(
                      text:
                          'Are you sure you want to delete the card ending in '),
                  TextSpan(
                    text: '...4343?',
                    style: TextStyle(color: kWhiteColor),
                  ),
                ],
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomButton(
              height: 56.h,
              width: Get.width * 0.9,
              onPressed: () {
                Get.close(2);
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: "Delete",
            ),
          ],
        ),
      ),
    );
  }
}
