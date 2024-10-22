import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

class CustomAddPaymentModal extends StatelessWidget {
  const CustomAddPaymentModal({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: 40.w,
              ),
              Center(
                  child: Text(
                'Add a payment method',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kBlackColor, fontWeight: FontWeight.w600),
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
                      color: kBlackColor.withOpacity(0.12),
                      border: Border.all(
                        color: kBlackColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child:
                        const Center(child: Icon(Icons.close, color: kBlackColor))),
              ),
            ],
          ),
          SizedBox(height: 22.h),
          Container(
            width: Get.width,
            height: 208.h,
            decoration: BoxDecoration(
              color: kGray200,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return AddBank();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          kBank,
                          width: 20.w,
                          color: kBlackColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bank Account',
                                style: AppStyles.labelTextStyle().copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'No fee for spending money or online purchases.',
                                style: AppStyles.labelTextStyle()
                                    .copyWith(color: kGray600, fontSize: 12.sp),
                                overflow: TextOverflow.visible,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  const Divider(
                    color: kGray300,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return AddCard();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          kCreditCard,
                          width: 20.w,
                          color: kBlackColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Credit / Debit Card',
                                style: AppStyles.labelTextStyle().copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'We charge a 3% fee for spending money with credit cards. We don’t charge for purchases with debit card payments.',
                                style: AppStyles.labelTextStyle()
                                    .copyWith(color: kGray600, fontSize: 12.sp),
                                overflow: TextOverflow.visible,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
              height: 56.h,
              width: Get.width * 0.9,
              onPressed: () {
                Get.back();
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: "Done"),
        ],
      ),
    );
  }
}

class AddBank extends StatelessWidget {
  const AddBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: 40.w,
              ),
              Center(
                  child: Text(
                'Link bank account',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kBlackColor, fontWeight: FontWeight.w600),
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
                      color: kBlackColor.withOpacity(0.12),
                      border: Border.all(
                        color: kBlackColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child:
                        const Center(child: Icon(Icons.close, color: kBlackColor))),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomTextField1(
              hint: 'Routing Number:', controller: TextEditingController()),
          SizedBox(height: 10.h),
          CustomTextField1(
              hint: 'Account Number:', controller: TextEditingController()),
          SizedBox(height: 10.h),
          CustomTextField1(
              hint: 'Confirm Account Number:',
              controller: TextEditingController()),
          const SizedBox(height: 10),
          Text(
            'To verify your bank account, you will see two seperate deposits and two withdrawls on your bank statement over the next three days, each for less than \$1.',
            style: AppStyles.labelTextStyle()
                .copyWith(color: kGray600, fontSize: 12.sp),
          ),
          const SizedBox(height: 10),
          CustomButton(
              height: 56.h,
              width: Get.width * 0.9,
              onPressed: () {
                Get.back();
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: "Save and Continue"),
        ],
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: 40.w,
              ),
              Center(
                  child: Text(
                'Add a credit / debit card',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kBlackColor, fontWeight: FontWeight.w600),
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
                      color: kBlackColor.withOpacity(0.12),
                      border: Border.all(
                        color: kBlackColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child:
                        const Center(child: Icon(Icons.close, color: kBlackColor))),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomTextField1(
              hint: 'Card Number:', controller: TextEditingController()),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField1(
                  width: 170.w,
                  hint: 'Exp Date:',
                  controller: TextEditingController()),
              CustomTextField1(
                  width: 170.w,
                  hint: 'CVV:',
                  controller: TextEditingController()),
            ],
          ),
          SizedBox(height: 10.h),
          CustomTextField1(
              hint: 'Billing zip:', controller: TextEditingController()),
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(
                  text: 'By adding a new card, you agree to the',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kGray600, fontSize: 12.sp),
                  children: [
                TextSpan(
                  text: ' terms & conditions',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kBlueColor, fontSize: 12.sp),
                )
              ])),
          SizedBox(height: 30.h),
          CustomButton(
              height: 56.h,
              width: Get.width * 0.9,
              onPressed: () {
                Get.back();
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: "Save and Continue"),
        ],
      ),
    );
  }
}

class CustomTextField1 extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLines;
  final double? height;
  final double? width;

  const CustomTextField1({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.maxLines,
    this.height,
    this.width,
  });

  @override
  _CustomTextField1State createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 361.w,
      height: widget.height ?? 56.h,
      margin: EdgeInsets.only(top: 10.h),
      child: TextField(
        controller: widget.controller,
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15.h, left: 15.w),
          hintText: widget.hint,
          hintStyle: AppStyles.labelTextStyle().copyWith(
              fontSize: 16.sp,
              color: kBlackColor.withOpacity(0.7).withOpacity(0.5)),
          filled: true,
          fillColor: kBlackColor.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9999),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9999),
            borderSide: const BorderSide(color: kBlackColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9999),
            borderSide: BorderSide(color: kBlackColor.withOpacity(0.17)),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: kWhiteColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        onChanged: (value) {},
        onSubmitted: (val) {},
        style: AppStyles.labelTextStyle()
            .copyWith(fontSize: 16.sp, color: kBlackColor),
      ),
    );
  }
}
