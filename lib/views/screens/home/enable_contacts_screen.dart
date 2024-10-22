import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';
import '../../../utils/app_styles.dart';

class EnableContactScreen extends GetView<HomeController> {
  const EnableContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> arguments = Get.arguments;
    final String? service = arguments['service'];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        key: controller.scaffoldKeyEnableContact,
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
          title: Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: kWhiteColor),
                hintText: 'Search by address, name, or...',
                hintStyle: TextStyle(color: kWhiteColor.withOpacity(0.5)),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kWhiteColor.withOpacity(0.12)),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kWhiteColor),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                filled: true,
                fillColor: kWhiteColor.withOpacity(0.05),
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              ),
              style: const TextStyle(color: kWhiteColor),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Image.asset(kQRIcon, width: 25.w),
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(kContact, width: 40.w,),
                SizedBox(height: 16.h,),
                Text('Let’s Find Your Contacts', style: AppStyles.labelTextStyle().copyWith(fontSize: 24.sp),),
                SizedBox(height: 10.h,),
                Text('Search by name, username, email address, phone or by enabling your contacts.', textAlign: TextAlign.center, style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp),),
                SizedBox(height: 32.h,),
                CustomButton(height: 44.h, width: 175.w, onPressed: (){
                  showAllowContactsDialog(context, service!);
                  
                }, bgColor: kRedColor, fontColor: kWhiteColor, title: 'Enable Contacts')
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showAllowContactsDialog(BuildContext context, String service) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kWhiteColor,
          
          title: Text(
            "“ParlerPay” Would Like Full Access to Your Contacts",
            textAlign: TextAlign.center,
            style: AppStyles.appBarHeadingTextStyle()
                .copyWith(fontWeight: FontWeight.w800, fontSize: 17.sp, color: kBlackColor),
          ),
          // content: Container(
          //   width: 238.w,
          //   height: 71.h,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.r),
          //     color: kBlackColor.withOpacity(0.06)
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
                
          //       Text(
          //         "Contacts may include additional data, such as locations, photos, relations, birthdays, notes, and more.",
          //         textAlign: TextAlign.center,
          //         style: AppStyles.labelTextStyle().copyWith(
          //           fontSize: 13.sp,
          //           fontWeight: FontWeight.w400,
          //           color: Color(0xFF6E7065),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          actionsPadding: EdgeInsets.zero,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  '578 Contacts', style: AppStyles.labelTextStyle().copyWith(color: kBlackColor, fontWeight: FontWeight.w800, fontSize: 13.sp),),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(
                textAlign: TextAlign.center,
                'Contacts may include additional data, such as locations, photos, relations, birthdays, notes, and more.', style: AppStyles.labelTextStyle().copyWith(color: kBlackColor, fontSize: 13.sp),),
            ),
            Divider(color: kStrokeColor.withOpacity(0.36),),
            SizedBox(height: 10.h,),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.back();
                  Get.toNamed(kFindContactRoute, arguments: {'service':service});
                },
                child: Text('Select Contacts...', style: AppStyles.labelTextStyle().copyWith(color: kBlueColor, fontSize: 17.sp),),
              ),
            ),
            SizedBox(height: 10.h,),
            Divider(color: kStrokeColor.withOpacity(0.36),),
            SizedBox(height: 10.h,),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.back();
                  Get.toNamed(kFindContactRoute, arguments: {'service':service});
                },
                child: Text('Allow Full Access', style: AppStyles.labelTextStyle().copyWith(color: kBlueColor, fontSize: 17.sp),),
              ),
            ),
            SizedBox(height: 10.h,),
            Divider(color: kStrokeColor.withOpacity(0.36),),
            SizedBox(height: 10.h,),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Text('Don\'t Allow', style: AppStyles.labelTextStyle().copyWith(color: kBlueColor, fontSize: 17.sp),),
              ),
            ),
            SizedBox(height: 10.h,),

          ],
        );
      },
    );
  }

}
