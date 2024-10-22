import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_button.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_loader.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_textfield.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';

import '../../../utils/app_images.dart';

class SendMoneyScreen extends GetView<HomeController> {
  const SendMoneyScreen({super.key});

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
        key: controller.scaffoldKeySendMoney,
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
          title: Row(
            children: [
              Image.asset(
                kUser2,
                width: 45.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cody Fisher',
                    style: AppStyles.labelTextStyle().copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '0xF1b5dF47E3d9a6e06A6dF5D....',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.labelTextStyle().copyWith(
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => _buildTypeModal(),
                    );
                  },
                  child: Obx(
                    () => Container(
                      width: Get.width,
                      height:
                          controller.selectedAccount.value == '' ? 60.h : 73.h,
                      decoration: BoxDecoration(
                          color: kWhiteColor.withOpacity(0.12),
                          border: Border.all(
                            color: kWhiteColor.withOpacity(0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(9999.r)),
                      child: Obx(
                        () => ListTile(
                          contentPadding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 10.h),
                          leading: Obx(() => Image.asset(
                                controller.selectedLogo.value,
                                width: 28.w,
                              )),
                          title: Obx(() => Text(
                                controller.selectedTitle.value,
                                style: AppStyles.labelTextStyle()
                                    .copyWith(color: kWhiteColor),
                              )),
                          subtitle: controller.selectedAccount.value.isNotEmpty
                              ? Obx(() => Text(
                                    controller.selectedAccount.value,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.labelTextStyle().copyWith(
                                        color: kGreyIconColor, fontSize: 12.sp),
                                  ))
                              : null,
                          trailing: const Icon(
                            Icons.keyboard_arrow_down,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => controller.isCrypto.isTrue
                              ? Container()
                              : Text(
                                  '\$',
                                  style: AppStyles.labelTextStyle()
                                      .copyWith(fontSize: 30.sp),
                                )),
                          SizedBox(
                            width: 160.w,
                            child: TextField(
                              style: AppStyles.labelTextStyle().copyWith(
                                  color: kWhiteColor, fontSize: 60.sp),
                              keyboardType: TextInputType.number,
                              controller: controller.price,
                              onSubmitted: (value) {
                                controller.rate.value = '212.22';
                                controller.balance.value = value;
                                controller.isDisabled1.value = false;
                              },
                              onChanged: (value) {
                                controller.isDisabled1.value = false;
                                controller.balance.value = value;
                                // controller.rate.value = '212.22';
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(
                                      r'^\d{0,3}(\.\d{0,1})?$|^\d{0,2}(\.\d{0,2})?$|^\d{0,1}(\.\d{0,3})?$|^\d{0,4}$'),
                                ),
                                LengthLimitingTextInputFormatter(5)
                              ],
                              decoration: InputDecoration(
                                hintText: '0.00',
                                hintStyle: AppStyles.labelTextStyle().copyWith(
                                    color: kWhiteColor, fontSize: 60.sp),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Obx(() => controller.isCrypto.isFalse
                              ? Container()
                              : Text(
                                  controller.cryptoName.value,
                                  style: AppStyles.labelTextStyle()
                                      .copyWith(fontSize: 30.sp),
                                )),
                          SizedBox(
                            width: 15.w,
                          ),
                          Image.asset(
                            kCross,
                            height: 24.h,
                            width: 24.w,
                          )
                        ],
                      ),
                      Obx(() => controller.isCrypto.isTrue
                          ? RichText(
                              text: TextSpan(
                                  text: '\$',
                                  style: AppStyles.labelTextStyle().copyWith(
                                      color: kGray200, fontSize: 30.sp),
                                  children: [
                                    TextSpan(
                                      text: controller.rate.value,
                                      style: AppStyles.labelTextStyle()
                                          .copyWith(
                                              color: kGray200, fontSize: 30.sp),
                                    ),
                                  ]),
                            )
                          : Container()),
                      SizedBox(height: 30.h),
                      SizedBox(height: 50.h),
                      GestureDetector(
                        onTap: () {
                          if (controller.isDisabled1.isFalse) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => _confirmationModal(context),
                            );
                          }
                        },
                        child: Obx(
                          () => CircleAvatar(
                            radius: 30.r,
                            backgroundColor: controller.isDisabled1.isFalse
                                ? kRedColor
                                : kRedColor.withOpacity(0.6),
                            child: Icon(Icons.arrow_upward,
                                color: controller.isDisabled1.isFalse
                                    ? kWhiteColor
                                    : kWhiteColor.withOpacity(0.5),
                                size: 30.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeModal() {
    return Container(
      decoration: const BoxDecoration(
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
            child: const Divider(
              color: kGray500,
            ),
          ),
          SizedBox(
            height: 15.h,
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
                'Choose Asset',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
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
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        color: kWhiteColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Center(
                        child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            width: 279.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: kWhiteColor.withOpacity(0.12),
              border:
                  Border.all(color: kWhiteColor.withOpacity(0.20), width: 1),
              borderRadius: BorderRadius.circular(999.r),
            ),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.index.value = 0;
                    },
                    child: Container(
                      width: 138.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                          color: controller.index.value == 0
                              ? kWhiteColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999.r)),
                      child: Center(
                        child: Text(
                          'Digital Asset',
                          style: AppStyles.labelTextStyle().copyWith(
                              color: controller.index.value == 0
                                  ? kPrimaryColor
                                  : kWhiteColor,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.index.value = 1;
                    },
                    child: Container(
                      width: 138.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                          color: controller.index.value == 1
                              ? kWhiteColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999.r)),
                      child: Center(
                        child: Text(
                          'Bank & Cards',
                          style: AppStyles.labelTextStyle().copyWith(
                              color: controller.index.value == 1
                                  ? kPrimaryColor
                                  : kWhiteColor,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Obx(
            () => controller.index.value == 0
                ? Column(
                    children: controller.assetList.map((item) {
                      // Ensure that the item map contains non-null values
                      if (item['image'] == null ||
                          item['title'] == null ||
                          item['subtitle'] == null ||
                          item['price'] == null ||
                          item['subPrice'] == null) {
                        return Container(); // or handle the error appropriately
                      }

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          controller.selectedLogo.value = item['image']!;
                          controller.selectedAccount.value =
                              '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df';
                          if (item['title'] == 'Optio') {
                            controller.selectedTitle.value = '2,221.21 OPTIO';
                            controller.cryptoName.value = 'OPTIO';
                            controller.isCrypto.value = true;
                          } else if (item['title'] == 'Bitcoin') {
                            controller.selectedTitle.value = '2,221.21 BTC';
                            controller.cryptoName.value = 'BTC';
                            controller.isCrypto.value = true;
                          } else if (item['title'] == 'Ethereum') {
                            controller.selectedTitle.value = '2,221.21 ETH';
                            controller.cryptoName.value = 'ETH';
                            controller.isCrypto.value = true;
                          } else {
                            controller.selectedTitle.value = '2,221.21 USDC';
                            controller.cryptoName.value = 'USDC';
                            controller.isCrypto.value = true;
                          }
                          Get.back();
                        },
                        leading: Image.asset(item['image']!,
                            width: 30.w, height: 30.h),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title']!,
                              style: AppStyles.labelTextStyle().copyWith(
                                  color: kWhiteColor, fontSize: 16.sp),
                            ),
                            Text(
                              item['subtitle']!,
                              style: AppStyles.labelTextStyle()
                                  .copyWith(color: kGray400, fontSize: 12.sp),
                            ),
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item['price']!,
                              style: AppStyles.labelTextStyle().copyWith(
                                  color: kWhiteColor, fontSize: 16.sp),
                            ),
                            Text(
                              item['subPrice']!,
                              style: AppStyles.labelTextStyle()
                                  .copyWith(color: kGray400),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )
                : Column(
                    children: [
                      ListTile(
                        onTap: () {
                          controller.selectedLogo.value = kMasterCard;
                          controller.selectedTitle.value =
                              'Mastercard ....4343';
                          controller.cryptoName.value = '';
                          controller.selectedAccount.value = '';
                          controller.isCrypto.value = false;
                          Get.back();
                        },
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
                      ),
                      ListTile(
                        onTap: () {
                          controller.selectedLogo.value = kBank;
                          controller.selectedTitle.value = 'Ally Bank (9281)';
                          controller.cryptoName.value = '';
                          controller.selectedAccount.value = '';
                          controller.isCrypto.value = false;
                          Get.back();
                        },
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
                      ),
                      SizedBox(
                        height: 120.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9999.r),
                                border: Border.all(
                                  width: 1,
                                  color: kWhiteColor,
                                ),
                                color: kWhiteColor.withOpacity(0.12),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Add new payment method',
                            style: AppStyles.labelTextStyle()
                                .copyWith(fontSize: 16.sp),
                          )
                        ],
                      )
                    ],
                  ),
          ),
          controller.index.value == 1
              ? SizedBox(
                  height: 32.h,
                )
              : const SizedBox(),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: Get.width,
              height: 56.h,
              decoration: BoxDecoration(
                  color: kWhiteColor.withOpacity(0.12),
                  border: Border.all(
                      color: kWhiteColor.withOpacity(0.32), width: 1.5),
                  borderRadius: BorderRadius.circular(9999.r)),
              child: Center(
                child: Text(
                  'Cancel',
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
    );
  }

  Widget _confirmationModal(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
      padding: EdgeInsets.all(15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 80.w,
            child: const Divider(
              color: kGray500,
            ),
          ),
          SizedBox(
            height: 15.h,
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
                'Preview Transaction',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
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
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        color: kWhiteColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Center(
                        child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            width: Get.width,
            height: 248.h,
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            width: Get.width,
            height: 195.h,
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
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 2,
                      minTileHeight: 35,
                      leading: Image.asset(
                        kPublicIcon,
                        width: 20.w,
                      ),
                      title: Text(
                        'Public',
                        style: AppStyles.labelTextStyle()
                            .copyWith(color: kWhiteColor, fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        'Anyone on ParlerPay can see.',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 14.sp, color: kGray400),
                      ),
                      trailing: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.isSelectedPublic.value = true;
                            controller.isSelectedFriends.value = false;
                            controller.isSelectedPrivate.value = false;
                          },
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: controller.isSelectedPublic.value
                                  ? Colors.transparent
                                  : kWhiteColor.withOpacity(0.12),
                              border: Border.all(
                                width: 1,
                                color: controller.isSelectedPublic.value
                                    ? kRedColor
                                    : kWhiteColor.withOpacity(0.17),
                              ),
                              borderRadius: BorderRadius.circular(9999.r),
                            ),
                            child: controller.isSelectedPublic.value
                                ? const Center(
                                    child: CircleAvatar(
                                      backgroundColor: kRedColor,
                                      radius: 5,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      )),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 2,
                      minTileHeight: 35,
                      leading: Image.asset(
                        kFriendsIcon,
                        width: 20.w,
                      ),
                      title: Text(
                        'Friends',
                        style: AppStyles.labelTextStyle()
                            .copyWith(color: kWhiteColor, fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        'Only friends on ParlerPay can see.',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 14.sp, color: kGray400),
                      ),
                      trailing: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.isSelectedPublic.value = false;
                            controller.isSelectedFriends.value = true;
                            controller.isSelectedPrivate.value = false;
                          },
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: controller.isSelectedFriends.value
                                  ? Colors.transparent
                                  : kWhiteColor.withOpacity(0.12),
                              border: Border.all(
                                width: 1,
                                color: controller.isSelectedFriends.value
                                    ? kRedColor
                                    : kWhiteColor.withOpacity(0.17),
                              ),
                              borderRadius: BorderRadius.circular(9999.r),
                            ),
                            child: controller.isSelectedFriends.value
                                ? const Center(
                                    child: CircleAvatar(
                                      backgroundColor: kRedColor,
                                      radius: 5,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      )),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 2,
                      minTileHeight: 35,
                      leading: Image.asset(
                        kPrivateIcon,
                        width: 20.w,
                      ),
                      title: Text(
                        'Private',
                        style: AppStyles.labelTextStyle()
                            .copyWith(color: kWhiteColor, fontSize: 16.sp),
                      ),
                      subtitle: Text(
                        'Remove public details.',
                        style: AppStyles.labelTextStyle()
                            .copyWith(fontSize: 14.sp, color: kGray400),
                      ),
                      trailing: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.isSelectedPublic.value = false;
                            controller.isSelectedFriends.value = false;
                            controller.isSelectedPrivate.value = true;
                          },
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: controller.isSelectedPrivate.value
                                  ? Colors.transparent
                                  : kWhiteColor.withOpacity(0.12),
                              border: Border.all(
                                width: 1,
                                color: controller.isSelectedPrivate.value
                                    ? kRedColor
                                    : kWhiteColor.withOpacity(0.17),
                              ),
                              borderRadius: BorderRadius.circular(9999.r),
                            ),
                            child: controller.isSelectedPrivate.value
                                ? const Center(
                                    child: CircleAvatar(
                                      backgroundColor: kRedColor,
                                      radius: 5,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Preview your transaction before sending rewards to ensure accuracy and security. Double-check recipient details, amounts, and any additional notes to guarantee a smooth transfer.',
            textAlign: TextAlign.justify,
            style: AppStyles.labelTextStyle().copyWith(color: kGray200),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomButton(
              height: 56.h,
              width: Get.width,
              onPressed: () {
                Get.back();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => _enterPasscodeModal(context),
                );
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: 'Continue'),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: Get.width,
              height: 56.h,
              decoration: BoxDecoration(
                  color: kWhiteColor.withOpacity(0.12),
                  border: Border.all(
                      color: kWhiteColor.withOpacity(0.32), width: 1.5),
                  borderRadius: BorderRadius.circular(9999.r)),
              child: Center(
                child: Text(
                  'Cancel',
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
    );
  }

  Widget _enterPasscodeModal(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            child: const Divider(
              color: kGray500,
            ),
          ),
          SizedBox(
            height: 15.h,
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
                'Preview Transaction',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
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
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        color: kWhiteColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Center(
                        child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          SizedBox(height: 28.h),
          Text('Enter Your Passcode',
              style: AppStyles.labelTextStyle().copyWith(
                  color: kWhiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'This passcode serves as a protective shield, safeguarding your account from unauthorized access. ',
            textAlign: TextAlign.center,
            style: AppStyles.labelTextStyle().copyWith(color: kGray200),
          ),
          SizedBox(
            height: 16.h,
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.passcode[index].isNotEmpty
                              ? kWhiteColor
                              : kWhiteColor.withOpacity(0.32),
                          width: 1),
                      borderRadius: BorderRadius.circular(30.r),
                      color: kWhiteColor.withOpacity(0.12)),
                  child: Center(
                    child: Text(
                      controller.passcode[index],
                      style: TextStyle(color: kWhiteColor, fontSize: 24.sp),
                    ),
                  ),
                );
              }),
            );
          }),
          SizedBox(height: 20.h),
          // Center(
          //   child: SizedBox(
          //     width: 221.w,
          //     height: 64.h,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((1).toString());
          //             },
          //             child: Text(
          //               (1).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((2).toString());
          //             },
          //             child: Text(
          //               (2).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((3).toString());
          //             },
          //             child: Text(
          //               (3).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 16.h),
          // Center(
          //   child: SizedBox(
          //     width: 221.w,
          //     height: 64.h,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((4).toString());
          //             },
          //             child: Text(
          //               (4).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((5).toString());
          //             },
          //             child: Text(
          //               (5).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((6).toString());
          //             },
          //             child: Text(
          //               (6).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 16.h),
          // Center(
          //   child: SizedBox(
          //     width: 221.w,
          //     height: 64.h,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((7).toString());
          //             },
          //             child: Text(
          //               (7).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((8).toString());
          //             },
          //             child: Text(
          //               (8).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((9).toString());
          //             },
          //             child: Text(
          //               (9).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 16.h),
          // Center(
          //   child: SizedBox(
          //     width: 221.w,
          //     height: 64.h,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         GestureDetector(
          //             onTap: () {},
          //             child: Text(
          //               '  ',
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //             onTap: () {
          //               controller.addDigit((0).toString());
          //             },
          //             child: Text(
          //               (0).toString(),
          //               style: AppStyles.labelTextStyle()
          //                   .copyWith(fontSize: 36.sp),
          //             )),
          //         GestureDetector(
          //           onTap: () {
          //             controller.removeLastDigit();
          //           },
          //           child: const Icon(
          //             Icons.backspace_outlined,
          //             color: kWhiteColor,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Center(
      child: SizedBox(
        width: 260.w,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: (221.w / 3) / 64.h,
          ),
          itemCount: 12,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == 9) {
              return const SizedBox.shrink();
            } else if (index == 11) {
              return GestureDetector(
                onTap: () {
                  controller.removeLastDigit();
                },
                child: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.white, // replace with your color
                ),
              );
            } else {
              int digit = index == 10 ? 0 : index + 1;
              return GestureDetector(
                onTap: () {
                  controller.addDigit(digit.toString());
                },
                child: Text(
                  digit.toString(),
                  style: AppStyles.labelTextStyle().copyWith(fontSize: 36.sp),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ),
    ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
              height: 56.h,
              width: Get.width,
              onPressed: () {
                Get.back();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => _enterPasswordModal(context),
                );
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: 'Continue'),
          SizedBox(
            height: 16.h,
          ),
          Center(
              child: GestureDetector(
            onTap: () {},
            child: Text(
              'I forgot my passcode',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ))
        ],
      ),
    );
  }

  Widget _enterPasswordModal(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            child: const Divider(
              color: kGray500,
            ),
          ),
          SizedBox(
            height: 15.h,
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
                'Preview Transaction',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
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
                      color: kWhiteColor.withOpacity(0.12),
                      border: Border.all(
                        color: kWhiteColor.withOpacity(0.32),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Center(
                        child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Text('Enter your password',
              style: AppStyles.labelTextStyle().copyWith(
                  color: kWhiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'This passcode serves as a protective shield, safeguarding your account from unauthorized access. ',
            textAlign: TextAlign.center,
            style: AppStyles.labelTextStyle().copyWith(color: kGray200),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
              hint: 'Password:', controller: TextEditingController()),
          SizedBox(
            height: 300.h,
          ),
          CustomButton(
              height: 56.h,
              width: Get.width,
              onPressed: () {
                Get.back();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => LoadingModal(
                    isRequest: false,
                  ),
                );
              },
              bgColor: kRedColor,
              fontColor: kWhiteColor,
              title: 'Continue'),
          SizedBox(
            height: 16.h,
          ),
          Center(
              child: GestureDetector(
            onTap: () {},
            child: Text(
              'I forgot my password',
              style: AppStyles.labelTextStyle()
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ))
        ],
      ),
    );
  }
}
