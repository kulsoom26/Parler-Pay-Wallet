import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/views/screens/notifications/controller/notifications_controller.dart';
import '../../../utils/app_styles.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

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
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          key: controller.scaffoldKeyNotification,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: kWhiteColor),
            title: Text(
              'Notification',
              style: AppStyles.labelTextStyle().copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Custom_Tabbar(controller: controller),
                )),
              ),
              SliverFillRemaining(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              kUser7,
                              width: 48.w,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Received',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'You\'ve received a payment of [amount] from [user].',
                                    style:
                                        AppStyles.labelTextStyle().copyWith(),
                                    overflow: TextOverflow.visible,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: kGreenColor,
                                ),
                                borderRadius: BorderRadius.circular(999.r),
                                color: kWhiteColor.withOpacity(0.12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  kSendMoneyIcon,
                                  width: 10.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Received',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'You\'ve received a payment of [amount] from [user].',
                                    style:
                                        AppStyles.labelTextStyle().copyWith(),
                                    overflow: TextOverflow.visible,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: kRedColor,
                                ),
                                borderRadius: BorderRadius.circular(999.r),
                                color: kWhiteColor.withOpacity(0.12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  kIncomingIcon,
                                  width: 10.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Sent',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Your payment of [amount] to [user] was successful.',
                                    style:
                                        AppStyles.labelTextStyle().copyWith(),
                                    overflow: TextOverflow.visible,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              kUser7,
                              width: 48.w,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Request',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '[User] has requested [amount] from you.',
                                    style:
                                        AppStyles.labelTextStyle().copyWith(),
                                    overflow: TextOverflow.visible,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              kNotificationPaymentAcceptRoute);
                                        },
                                        child: Container(
                                          width: 102.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(999.r),
                                            color:
                                                kWhiteColor.withOpacity(0.12),
                                            border: Border.all(
                                              width: 1,
                                              color:
                                                  kWhiteColor.withOpacity(0.17),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                kCheckIcon,
                                                color: kGreenColor,
                                                width: 13.33.w,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                'Accept',
                                                style:
                                                    AppStyles.labelTextStyle()
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Container(
                                        width: 102.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(999.r),
                                          color: kWhiteColor.withOpacity(0.12),
                                          border: Border.all(
                                            width: 1,
                                            color:
                                                kWhiteColor.withOpacity(0.17),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              kCloseIcon,
                                              color: kRedColor,
                                              width: 13.33.w,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              'Reject',
                                              style: AppStyles.labelTextStyle()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: kRedColor,
                                ),
                                borderRadius: BorderRadius.circular(999.r),
                                color: kWhiteColor.withOpacity(0.12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  kCloseIcon,
                                  width: 10.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Request Denied',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: kGray500),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(
                                                fontSize: 12.sp,
                                                color: kGray500),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: AppStyles.labelTextStyle()
                                          .copyWith(color: kGray500),
                                      children: [
                                        TextSpan(
                                            text:
                                                'Your payment request of [amount] was '),
                                        TextSpan(
                                          text: 'denied',
                                          style: TextStyle(color: kRedColor),
                                        ),
                                        TextSpan(text: ' by [user].'),
                                      ],
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: kRedColor,
                                ),
                                borderRadius: BorderRadius.circular(999.r),
                                color: kWhiteColor.withOpacity(0.12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  kPaymentRequestIcon,
                                  width: 20.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Request',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style: AppStyles.labelTextStyle()
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '[User] has requested [amount] from you.',
                                    style:
                                        AppStyles.labelTextStyle().copyWith(),
                                    overflow: TextOverflow.visible,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 102.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(999.r),
                                            color:
                                                kWhiteColor.withOpacity(0.12),
                                            border: Border.all(
                                              width: 1,
                                              color:
                                                  kWhiteColor.withOpacity(0.17),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                kCheckIcon,
                                                color: kGreenColor,
                                                width: 13.33.w,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                'Accept',
                                                style:
                                                    AppStyles.labelTextStyle()
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Container(
                                        width: 102.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(999.r),
                                          color: kWhiteColor.withOpacity(0.12),
                                          border: Border.all(
                                            width: 1,
                                            color:
                                                kWhiteColor.withOpacity(0.17),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              kCloseIcon,
                                              color: kRedColor,
                                              width: 13.33.w,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              'Reject',
                                              style: AppStyles.labelTextStyle()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: kGreenColor),
                                borderRadius: BorderRadius.circular(999.r),
                                color: kWhiteColor.withOpacity(0.12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  kCheckIcon,
                                  width: 10.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Request Approved',
                                        style:
                                            AppStyles.labelTextStyle().copyWith(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style:
                                            AppStyles.labelTextStyle().copyWith(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          AppStyles.labelTextStyle().copyWith(),
                                      children: [
                                        TextSpan(
                                            text:
                                                'Your payment request of [amount] was '),
                                        TextSpan(
                                          text: 'approved',
                                          style: TextStyle(color: kGreenColor),
                                        ),
                                        TextSpan(text: ' by [user].'),
                                      ],
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: kYelloweColor,
                                ),
                                borderRadius: BorderRadius.circular(999.r),
                                color: kWhiteColor.withOpacity(0.12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  kPendingIcon,
                                  width: 18.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Payment Request Pending',
                                        style:
                                            AppStyles.labelTextStyle().copyWith(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        'Jun 21',
                                        style:
                                            AppStyles.labelTextStyle().copyWith(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          AppStyles.labelTextStyle().copyWith(),
                                      children: [
                                        TextSpan(
                                            text:
                                                'Your payment request of [amount] is '),
                                        TextSpan(
                                          text: 'pending.',
                                          style:
                                              TextStyle(color: kYelloweColor),
                                        ),
                                      ],
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_Tabbar extends StatelessWidget {
  const Custom_Tabbar({
    super.key,
    required this.controller,
  });

  final NotificationController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.isAll.value = true;
                controller.isFriendRequests.value = false;
                controller.isTransactions.value = false;
                controller.isPaymentRequests.value = false;
              },
              child: Obx(
                () => Container(
                  width: 46.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                      color: controller.isAll.value
                          ? kWhiteColor
                          : kWhiteColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(999.r),
                      border: Border.all(
                          width: controller.isAll.value ? 0 : 1,
                          color: controller.isAll.value
                              ? Colors.transparent
                              : kWhiteColor.withOpacity(0.2))),
                  child: Center(
                    child: Text(
                      'All',
                      style: AppStyles.labelTextStyle().copyWith(
                          color:
                              controller.isAll.value ? kBlackColor : kGray400,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
              onTap: () {
                controller.isAll.value = false;
                controller.isFriendRequests.value = true;
                controller.isTransactions.value = false;
                controller.isPaymentRequests.value = false;
              },
              child: Obx(
                () => Container(
                  width: 123.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                      color: controller.isFriendRequests.value
                          ? kWhiteColor
                          : kWhiteColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(999.r),
                      border: Border.all(
                          width: controller.isFriendRequests.value ? 0 : 1,
                          color: controller.isFriendRequests.value
                              ? Colors.transparent
                              : kWhiteColor.withOpacity(0.2))),
                  child: Center(
                    child: Text(
                      'Friend Requests',
                      style: AppStyles.labelTextStyle().copyWith(
                          color: controller.isFriendRequests.value
                              ? kBlackColor
                              : kGray400,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
              onTap: () {
                controller.isAll.value = false;
                controller.isFriendRequests.value = false;
                controller.isTransactions.value = true;
                controller.isPaymentRequests.value = false;
              },
              child: Obx(
                () => Container(
                  width: 104.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                      color: controller.isTransactions.value
                          ? kWhiteColor
                          : kWhiteColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(999.r),
                      border: Border.all(
                          width: controller.isTransactions.value ? 0 : 1,
                          color: controller.isTransactions.value
                              ? Colors.transparent
                              : kWhiteColor.withOpacity(0.2))),
                  child: Center(
                    child: Text(
                      'Transactions',
                      style: AppStyles.labelTextStyle().copyWith(
                          color: controller.isTransactions.value
                              ? kBlackColor
                              : kGray400,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
              onTap: () {
                controller.isAll.value = false;
                controller.isFriendRequests.value = false;
                controller.isTransactions.value = false;
                controller.isPaymentRequests.value = true;
              },
              child: Obx(
                () => Container(
                  width: 136.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                      color: controller.isPaymentRequests.value
                          ? kWhiteColor
                          : kWhiteColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(999.r),
                      border: Border.all(
                          width: controller.isPaymentRequests.value ? 0 : 1,
                          color: controller.isPaymentRequests.value
                              ? Colors.transparent
                              : kWhiteColor.withOpacity(0.2))),
                  child: Center(
                    child: Text(
                      'Payment Requests',
                      style: AppStyles.labelTextStyle().copyWith(
                          color: controller.isPaymentRequests.value
                              ? kBlackColor
                              : kGray400,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
          ],
        ),
      ],
    );
  }
}
