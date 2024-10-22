import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.onPressed,
      required this.bgColor,
      required this.fontColor,
      required this.title});
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color fontColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(9999.r),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.labelTextStyle().copyWith(
                fontSize: 16.sp,
                color: fontColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
