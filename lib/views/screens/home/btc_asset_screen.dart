import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_asset_banner.dart';
import '../../custom_widgets/custom_filter_modal.dart';

class BTCAssetScreen extends GetView<HomeController> {
  const BTCAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kOrangeGradientColor1, kOrangeGradientColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        key: controller.scaffoldKeyBtcAsset,
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
                kToken1,
                width: 32.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'BTC',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45.h),
              const CustomAssetBanner(subtitle: '2,224.12 BTC', isTapNPay: false),
              SizedBox(height: 5.h,),
              Divider(color: kWhiteColor.withOpacity(0.32), height: 0,),
              Container(
                width: Get.width,
                color: kBlackColor.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'History',
                            style: AppStyles.labelTextStyle().copyWith(
                                color: kWhiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          const CustomFilterModal(color1: kOrangeGradientColor1, color2: kOrangeGradientColor2),
                                    );
                            },
                            child: Text(
                              'Filter',
                              style: AppStyles.labelTextStyle().copyWith(
                                  color: kBlueColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.btcAssetList.length,
                        itemBuilder: (context, index) {
                          final item = controller.btcAssetList[index];
                          return ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.h),
                            leading: Stack(
                              children: [
                                Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: kWhiteColor.withOpacity(0.12),
                                      border: Border.all(
                                          width: 1, color: item['color']),
                                      borderRadius:
                                          BorderRadius.circular(200.r),
                                    ),
                                    child: Center(
                                            child: Image.asset(
                                              item['image'],
                                              width: 17.w,
                                            ),
                                          )),
                                Positioned(
                                    bottom: 0.h,
                                    right: 0.w,
                                    child: Image.asset(
                                      item['logo'],
                                      width: 20.w,
                                    ))
                              ],
                            ),
                            title: Text(
                              item['title'],
                              style: AppStyles.labelTextStyle().copyWith(
                                  color: kWhiteColor, fontSize: 16.sp),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              item['sendDate'],
                              style: AppStyles.labelTextStyle()
                                  .copyWith(color: kGray400, fontSize: 12.sp),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    item['isMinus']
                                        ? Text(
                                            '-',
                                            style: AppStyles.labelTextStyle()
                                                .copyWith(
                                              color: kCheckBoxFilledColor,
                                              fontSize: 16.sp,
                                            ),
                                          )
                                        : Text(
                                            '+',
                                            style: AppStyles.labelTextStyle()
                                                .copyWith(
                                              color: kGreenColor,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                    Text(
                                      item['price'],
                                      style:
                                          AppStyles.labelTextStyle().copyWith(
                                        color: kWhiteColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  item['subtitle'],
                                  style: AppStyles.labelTextStyle().copyWith(
                                      color: kGray400, fontSize: 12.sp),
                                ),
                              ],
                            ),
                            onTap: item['onTap'],
                          );
                        },
                      ),
                      
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
}

