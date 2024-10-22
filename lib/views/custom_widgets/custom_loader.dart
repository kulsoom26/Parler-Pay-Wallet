import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

class LoadingModal extends StatefulWidget {
  LoadingModal({required this.isRequest});
  final bool isRequest;
  @override
  _LoadingModalState createState() => _LoadingModalState();
}

class _LoadingModalState extends State<LoadingModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    Future.delayed(Duration(seconds: 3), () {
      _controller.stop();
      Get.back();
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => _doneModal(context, widget.isRequest),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
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
            child: Divider(
              color: kGray500,
            ),
          ),
          Expanded(
            child: Center(
              child: RotationTransition(
                turns: _controller,
                child: Image.asset(
                  kLoader,
                  width: 50.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _doneModal(BuildContext context, bool isRequest) {
    HomeController controller = Get.put(HomeController());
    return Container(
      decoration: BoxDecoration(
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
            child: Divider(
              color: kGray500,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.topRight,
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
                  child: Center(child: Icon(Icons.close, color: kWhiteColor))),
            ),
          ),
          SizedBox(height: 20.h),
          Image.asset(
            kUser2,
            width: 64.w,
          ),
          SizedBox(height: 20.h),
          RichText(
            textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'You',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kWhiteColor, fontSize: 18.sp),
                  children: [
                TextSpan(
                  text: ' successfully',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kGreenColor, fontSize: 18.sp),
                ),
                TextSpan(
                  text: ' sent',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kWhiteColor, fontSize: 18.sp),
                ),
                TextSpan(
                  text: ' 4,224.21 OPTIO',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kWhiteColor, fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: ' to Cody Fisher',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kWhiteColor, fontSize: 18.sp),
                ),
              ])),
              SizedBox(height: 20.h),
          isRequest == false ? Container(
            width: Get.width,
            height: 314.h,
            decoration: BoxDecoration(
              color: kWhiteColor.withOpacity(0.04),
              border:
                  Border.all(color: kWhiteColor.withOpacity(0.32), width: 1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To:',
                    style: AppStyles.labelTextStyle()
                        .copyWith(fontSize: 14.sp, color: kWhiteColor),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        kUser2,
                        width: 24.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Cody Fisher',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 16.sp, color: kWhiteColor),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.labelTextStyle()
                          .copyWith(fontSize: 14.sp, color: kGray400),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Amount:',
                    style: AppStyles.labelTextStyle()
                        .copyWith(fontSize: 14.sp, color: kWhiteColor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        kToken,
                        width: 24.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '4,224.21 OPTIO (\$220.21)',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 16.sp, color: kWhiteColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Gas Fee:',
                    style: AppStyles.labelTextStyle()
                        .copyWith(fontSize: 14.sp, color: kWhiteColor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        kToken2,
                        width: 24.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '0.000123 ETH (\$4.21)',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 16.sp, color: kWhiteColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Total:',
                    style: AppStyles.labelTextStyle()
                        .copyWith(fontSize: 14.sp, color: kWhiteColor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        kToken,
                        width: 24.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '4,224.21 OPTIO (\$224.42)',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 16.sp, color: kWhiteColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ):
          
          Text(
            'We let Cody know that you have requested a payment. You can view the status of your request in your Transaction history.',
            textAlign: TextAlign.center,
            style: AppStyles.labelTextStyle().copyWith(color: kGray300),
          ),
          isRequest ? SizedBox(
            height: 40.h,
          ):
          SizedBox(
            height: 140.h,
          ),
          CustomButton(
              height: 56.h,
              width: Get.width,
              onPressed: () {
                Get.back();
                controller.balance.value = controller.price.text;
                Get.offAllNamed(kBottomNavbarRoute);
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: 'Done'),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
