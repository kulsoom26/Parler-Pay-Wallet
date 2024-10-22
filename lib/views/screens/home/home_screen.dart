import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_add_payment_modal.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';

import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_drawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

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
        key: controller.scaffoldKeyHome,
        backgroundColor: Colors.transparent,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: kWhiteColor),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Image.asset(kQRIcon, width: 25.w),
              ),
            ),
          ],
          title: Image.asset(
            kLogo,
            width: 90.w,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45.h),
              Center(
                child: Text(
                  'Welcome back!',
                  style: AppStyles.labelTextStyle()
                      .copyWith(color: kGray900, fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Obx(
                  () => Text(
                    controller.balance.value,
                    style: AppStyles.appBarHeadingTextStyle().copyWith(
                        color: kWhiteColor,
                        fontSize: 72.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kEnableContactRoute,
                            arguments: {'service': 'send'});
                      },
                      child: Container(
                        width: 175.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                            color: kRedColor,
                            border: Border.all(
                              color: kRedColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(9999.r)),
                        child: Center(
                          child: Text(
                            'Send',
                            style: AppStyles.labelTextStyle().copyWith(
                                color: kWhiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kEnableContactRoute,
                            arguments: {'service': 'request'});
                      },
                      child: Container(
                        width: 175.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                            color: kRedColor,
                            border: Border.all(
                              color: kRedColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(9999.r)),
                        child: Center(
                          child: Text(
                            'Request',
                            style: AppStyles.labelTextStyle().copyWith(
                                color: kWhiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(() => controller.balance.value == '\$0.00'
                    ? _buildHorizontalGridView()
                    : Container()),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: kBlackColor.withOpacity(0.5),
                    border: const Border(top: BorderSide(color: kPrimaryColor))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Assets',
                            style: AppStyles.labelTextStyle().copyWith(
                                color: kWhiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            kAddOpt,
                            height: 32.h,
                            width: 32.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      for (var item in controller.assetList) ...{
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: item['onTap'],
                          leading: Image.asset(item['image'],
                              width: 30.w, height: 30.h),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: AppStyles.labelTextStyle().copyWith(
                                    color: kWhiteColor, fontSize: 16.sp),
                              ),
                              Text(
                                item['subtitle'],
                                style: AppStyles.labelTextStyle()
                                    .copyWith(color: kGray400, fontSize: 12.sp),
                              ),
                            ],
                          ),
                          trailing: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                item['price'],
                                style: AppStyles.labelTextStyle().copyWith(
                                    color: kWhiteColor, fontSize: 16.sp),
                              ),
                              Text(
                                item['subPrice'],
                                style: AppStyles.labelTextStyle()
                                    .copyWith(color: kGray400),
                              ),
                            ],
                          ),
                        ),
                      },
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'Payment Methods',
                        style: AppStyles.labelTextStyle().copyWith(
                            color: kWhiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 37.w,
                          height: 31.h,
                          decoration: BoxDecoration(
                            color: kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              color: kWhiteColor.withOpacity(0.32),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3.82.r),
                          ),
                          child: Center(
                            child: Image.asset(
                              kMasterCard,
                              width: 26.w,
                            ),
                          ),
                        ),
                        title: Text(
                          'Mastercard ....4343',
                          style: AppStyles.labelTextStyle()
                              .copyWith(color: kWhiteColor, fontSize: 16.sp),
                        ),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            color: kGray400,
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 37.w,
                          height: 31.h,
                          decoration: BoxDecoration(
                            color: kWhiteColor.withOpacity(0.12),
                            border: Border.all(
                              color: kWhiteColor.withOpacity(0.32),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3.82.r),
                          ),
                          child: Center(
                            child: Image.asset(
                              kBank,
                              width: 17.w,
                            ),
                          ),
                        ),
                        title: Text(
                          'Ally Bank (9281)',
                          style: AppStyles.labelTextStyle()
                              .copyWith(color: kWhiteColor, fontSize: 16.sp),
                        ),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            color: kGray400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAddPaymentModal();
                            },
                          );
                        },
                        child: Container(
                          width: 208.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9999.r),
                            border: Border.all(color: kRedColor, width: 1.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: kWhiteColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Add payment method',
                                style: AppStyles.labelTextStyle().copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: kWhiteColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Contacts',
                            style: AppStyles.labelTextStyle().copyWith(
                                color: kWhiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.keyboard_arrow_right,
                              color: kGray400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 120.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: controller.userList.length,
                          itemBuilder: (context, index) {
                            var item = controller.userList[index];
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 44.r,
                                  backgroundImage: AssetImage(item['image']),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Flexible(
                                    child: Text(
                                  item['name'],
                                  style: AppStyles.labelTextStyle()
                                      .copyWith(fontSize: 12.sp),
                                ))
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: Get.width,
                          height: 48.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9999.r),
                            color: kRedColor,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  kSend,
                                  width: 20.w,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'Invite your friends & earn \$50!',
                                  style: AppStyles.labelTextStyle().copyWith(
                                      fontSize: 16.sp,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        height: 710.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(kHomeJoinBg), fit: BoxFit.fill),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(height: 15.h,),
                            Image.asset(
                              kOptionLogo,
                              width: 100.w,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            GradientText(
                              text: 'Join The Optio\nNode Network',
                              style:
                                  AppStyles.appBarHeadingTextStyle().copyWith(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF06E5FF),
                                  Color(0xFF285FF6),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.w),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Support millions of independent voices, calling for personal responsibility while defending individual sovereignty in the digital realm.',
                                style: AppStyles.labelTextStyle().copyWith(
                                  color: kGray700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Image.asset(
                              kHomeJoinImage,
                              width: 273.w,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: Get.width * 0.7,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999.r),
                                  color: kWhiteColor,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        kNav3Icon,
                                        color: kBlueColor,
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        'Shop Optio Nodes!',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: kBlueColor,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalGridView() {
    return SizedBox(
      height: 320.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildGridItem(index);
        },
      ),
    );
  }

  Widget _buildGridItem(int index) {
    String image;
    if (index == 0) {
      image = kItem1;
    } else if (index == 1) {
      image = kItem2;
    } else if (index == 2) {
      image = kItem3;
    } else {
      image = kItem4;
    }
    print(image);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: kPrimaryColor, width: 2),
      ),
      child: Center(
          child: Container(
        width: 268.w,
        height: 320.h,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w, top: 10.h),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kWhiteColor,
                        width: 1,
                      ),
                      color: kWhiteColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: kWhiteColor,
                      size: 20.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Text(
              'Connect with friends',
              style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              textAlign: TextAlign.center,
              'Use ParlerPay with your friends to easily send or request money.',
              style: AppStyles.labelTextStyle()
                  .copyWith(color: kWhiteColor, fontSize: 10.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 200.w,
              height: 44.h,
              decoration: BoxDecoration(
                  color: kWhiteColor.withOpacity(0.12),
                  border: Border.all(
                    color: kWhiteColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(9999.r)),
              child: Center(
                child: Text(
                  'Get Started',
                  style: AppStyles.labelTextStyle()
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({super.key, 
    required this.text,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
