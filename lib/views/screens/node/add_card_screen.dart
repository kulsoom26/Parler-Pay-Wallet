import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_textfield.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';

class AddCardScreen extends GetView<NodeController> {
  const AddCardScreen({super.key});

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
        key: controller.scaffoldKeyAddCard,
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Add a credit / debit card',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Your profile will allow you and your friends to easily find one another and send payments back and fourth.',
                  style: AppStyles.labelTextStyle().copyWith(color: kGray400),
                ),
                SizedBox(
                  height: 36.h,
                ),
                CustomTextField(
                  hint: "Card number",
                  controller: controller.addCard,
                  hintColor: kWhiteColor,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    CustomTextField(
                      hint: "Expire date",
                      controller: controller.addExp,
                      width: 172.5.w,
                      hintColor: kWhiteColor,
                    ),
                    const Spacer(),
                    CustomTextField(
                      hint: "CVV",
                      controller: controller.addCVC,
                      width: 172.5.w,
                      hintColor: kWhiteColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  hint: 'Billing zip',
                  controller: controller.addBilling,
                  hintColor: kWhiteColor,
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
                          controller.isCheck1.value =
                              !controller.isCheck1.value;
                        },
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: controller.isCheck1.isFalse
                                  ? Border.all(color: kGreyColor, width: 1)
                                  : null,
                              color: controller.isCheck1.isFalse
                                  ? Colors.transparent
                                  : kCheckBoxFilledColor),
                          child: controller.isCheck1.isFalse
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
                  height: 130.h,
                ),
                CustomButton(
                    height: 56.h,
                    width: 361.w,
                    onPressed: () {
                      Get.back();
                    },
                    bgColor: kRedColor,
                    fontColor: kWhiteColor,
                    title: 'Add Card'),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
