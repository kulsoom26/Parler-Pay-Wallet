import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/views/custom_widgets/custom_filter_modal.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_asset_banner.dart';

class OptioAssetScreen extends GetView<HomeController> {
  const OptioAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kBlueGradientColor1, kBlueGradientColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        key: controller.scaffoldKeyOptioAsset,
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
                kToken,
                width: 32.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'OPTIO',
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
              const CustomAssetBanner(subtitle: '2,224.12 OPTIO', isTapNPay: true),
              SizedBox(height: 5.h),
              Divider(color: kWhiteColor.withOpacity(0.32), height: 0),
              Container(
                width: Get.width,
                color: kBlackColor.withOpacity(0.4),
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
                                          const CustomFilterModal(color1: kBlueGradientColor1, color2: kBlueGradientColor2),
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
                        itemCount: controller.optioAssetList.length,
                        itemBuilder: (context, index) {
                          final item = controller.optioAssetList[index];
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
                                    child: index == 0
                                        ? Image.asset(
                                            item['image'],
                                            width: 50.w,
                                          )
                                        : Center(
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
                            onTap: index == 0
                                ? () => showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          _buildTransactionModal(),
                                    )
                                : item['onTap'],
                          );
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                        leading: Stack(
                          children: [
                            Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200.r),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF0E2B7C),
                                      Color(0xFF285FF6)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: kWhiteColor,
                                  size: 25.w,
                                ))),
                            Positioned(
                                bottom: 0.h,
                                right: 0.w,
                                child: Image.asset(
                                  kToken,
                                  width: 20.w,
                                ))
                          ],
                        ),
                        title: Text(
                          '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
                          style: AppStyles.labelTextStyle()
                              .copyWith(color: kWhiteColor, fontSize: 16.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          'Sent 2:42 PM',
                          style: AppStyles.labelTextStyle()
                              .copyWith(color: kGray400, fontSize: 12.sp),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '-',
                                  style: AppStyles.labelTextStyle().copyWith(
                                    color: kCheckBoxFilledColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  '\$17.22',
                                  style: AppStyles.labelTextStyle().copyWith(
                                    color: kWhiteColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '0.000303 OPTIO',
                              style: AppStyles.labelTextStyle()
                                  .copyWith(color: kGray400, fontSize: 12.sp),
                            ),
                          ],
                        ),
                        onTap: () {},
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

  Widget _buildTransactionModal() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kBlueGradientColor1, kBlueGradientColor2],
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
                'Transaction Details',
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
                    child:
                        const Center(child: Icon(Icons.close, color: kWhiteColor))),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Stack(
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: kWhiteColor.withOpacity(0.12),
                  border: Border.all(width: 1, color: kWhiteColor),
                  borderRadius: BorderRadius.circular(200.r),
                ),
                child: Image.asset(
                  kUser2,
                  width: 50.w,
                ),
              ),
              Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [kBlueGradientColor1, kBlueGradientColor2],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(color: kGreenColor, width: 1),
                        borderRadius: BorderRadius.circular(200.r)),
                    child: Center(
                      child: Image.asset(
                        kSendMoneyIcon,
                        width: 10.w,
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(height: 20.h),
          RichText(
            text: TextSpan(
                text: '4,224.21',
                style: AppStyles.labelTextStyle().copyWith(
                    color: kWhiteColor,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                      text: ' OPTIO',
                      style: AppStyles.labelTextStyle().copyWith(
                        color: kWhiteColor,
                        fontSize: 18.sp,
                      ))
                ]),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            '\$221.21',
            style: AppStyles.labelTextStyle().copyWith(
              color: kWhiteColor,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 20.h),
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'From: 0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
              style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Text(
                'To:',
                style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              Text(
                'You',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kBlueColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Text(
                'Network:',
                style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              Text(
                'Ethereum',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor),
              ),
              SizedBox(width: 8.w,),
              Image.asset(kToken2,width: 20.w,)
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            children: [
              Text(
                'Submitted:',
                style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              Text(
                '3:14 PM - May 12, 2024',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Text(
                'Completed On:',
                style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              Text(
                '3:15 PM - May 12, 2024',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Text(
                'Amount',
                style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              Text(
                '4,224.21 OPTIO (\$221.21)',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor),
              ),
              SizedBox(width: 8.w,),
              Image.asset(kToken,width: 20.w,)
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            children: [
              Text(
                'Network Fee:',
                style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              Text(
                '0.000593 ETH (\$1.83)',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kWhiteColor),
              ),
              SizedBox(width: 8.w,),
              Image.asset(kToken2,width: 20.w,)
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            children: [
              Text(
                'Status:',
                style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              Text(
                'Completed',
                style: AppStyles.labelTextStyle()
                    .copyWith(color: kGreenColor),
              ),
              
            ],
          ),
          SizedBox(height: 52.h,),
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              width: Get.width,
              height: 56.h,
              decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.12),
                border: Border.all(
                  color: kWhiteColor.withOpacity(0.32),
                  width: 1.5
                ),
                borderRadius: BorderRadius.circular(9999.r)
              ),
              child: Center(
                child: Text('View on Etherscan', style: AppStyles.labelTextStyle().copyWith(color: kWhiteColor, fontSize: 16.sp, fontWeight: FontWeight.w600),),
              ),
              ),
          )
        ],
      ),
    );
  }
}
