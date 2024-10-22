import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';

import '../../utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        color: kNavbarBg,
        child: Column(

          children: [
            SizedBox(height: 70.h,),
            CircleAvatar(
              radius: 60.w,
                backgroundImage: AssetImage(kDummy)
              ),
              SizedBox(height: 10.h,),
              Center(child: Text('Jess Kramer', style: AppStyles.labelTextStyle().copyWith(fontSize: 24.sp, color: kGray900),)),
             SizedBox(height: 5.h,),
             Center(child: Text('@jess_kram', style: AppStyles.labelTextStyle().copyWith(color: kGray200),)),
            SizedBox(height: 24.h,),
            Divider(color: kGray300,),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Image.asset(kConnectionsIcon, width: 16.25.w,),
                    SizedBox(width: 25.w,),
                    Text('Connections', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Image.asset(kOptioIcon, width: 16.25.w,),
                    SizedBox(width: 24.w,),
                    Text('Optio Blockchain', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Image.asset(kPlayIcon, width: 16.25.w,),
                    SizedBox(width: 25.w,),
                    Text('PlayTV', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Image.asset(kShopIcon, width: 21.75.w,),
                    SizedBox(width: 20.w,),
                    Text('Shop', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Image.asset(kNewsIcon, width: 19.25.w,),
                    SizedBox(width: 20.w,),
                    Text('News', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Image.asset(kAddIcon, width: 24.w,),
                    SizedBox(width: 18.w,),
                    Text('Invite', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
           
            Spacer(),
            
            Divider(color: kGray300,),
            SizedBox(height:15.h),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Settings & Support', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                Icon(Icons.expand_more, color: kWhiteColor),
              ],
            ),
            ),
            SizedBox(height:15.h),
          ],
        ),
      ),
    );
  }
}