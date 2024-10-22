import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';

class ProfileController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKeyProfile = GlobalKey<ScaffoldState>();
  RxList<Map<String, dynamic>> profileDetailList = <Map<String, dynamic>>[
    {
      'amount': '0.000303 OPTIO',
      'isPlus': true,
      'name': 'Floyd Miles',
      'isLike': false.obs,
      'image': kUser5,
      'isDislike': false.obs,
      'date': 'June 21 - 1:23pm',
      'color': Colors.transparent,
      'status': 'Received',
      'width': 48.w,
    },
    {
      'amount': '0.000303 OPTIO',
      'isPlus': true,
      'name': '0xF1b5dF47E3d9a...',
      'isLike': false.obs,
      'image': kSendMoneyIcon,
      'isDislike': false.obs,
      'date': 'June 21 - 1:23pm',
      'color': kGreenColor,
      'status': 'Received',
      'width': 10.w,
    },
    {
      'amount': '0.000303 OPTIO',
      'isPlus': false,
      'name': '0xF1b5dF47E3d9a...',
      'isLike': false.obs,
      'image': kIncomingIcon,
      'isDislike': false.obs,
      'date': 'To: 0xF1b5dF47E3d9a...',
      'color': kRedColor,
      'status': 'Received',
      'width': 10.w,
    },
    {
      'amount': '0.000303 OPTIO',
      'isPlus': true,
      'name': '0xF1b5dF47E3d9a...',
      'isLike': false.obs,
      'image': kPlusIcon,
      'isDislike': false.obs,
      'date': 'Earned OPTIO',
      'color': kBlueColor,
      'status': 'Received',
      'width': 14.w,
    },
    {
      'amount': '0.000303 OPTIO',
      'isPlus': true,
      'name': '0xF1b5dF47E3d9a...',
      'isLike': false.obs,
      'image': kConvertIcon,
      'isDislike': false.obs,
      'date': 'June 21 - 1:23pm',
      'color': kPurpleColor,
      'status': 'Received',
      'width': 16.w,
    },
    {
      'amount': '0.000303 OPTIO',
      'isPlus': true,
      'name': '0xF1b5dF47E3d9a...',
      'isLike': false.obs,
      'image': kReceiveIcon,
      'isDislike': false.obs,
      'date': 'June 21 - 1:23pm',
      'color': kBlueColor2,
      'status': 'Received',
      'width': 20.w,
    },
  ].obs;

  RxBool isProfileFav1 = false.obs;
  RxBool isActivity = true.obs;
  RxBool isBetweenUs = false.obs;
  RxBool isNFT = false.obs;
}
