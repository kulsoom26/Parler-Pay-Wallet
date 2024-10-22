import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomFilterModal extends StatelessWidget {
  const CustomFilterModal({super.key, required this.color1, required this.color2});
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [color1, color2],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SizedBox(
                width: 40.w,
              ),
              Center(
                  child: Text(
                'Filter',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
              )),
              Spacer(),
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
                        Center(child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          Spacer(),
          
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              width: Get.width,
              height: 56.h,
              decoration: BoxDecoration(
                color: kRedColor,
                
                borderRadius: BorderRadius.circular(9999.r)
              ),
              child: Center(
                child: Text('Done', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.w600),),
              ),
              ),
          ),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }
}