import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';

import '../../../../utils/app_images.dart';

class ContactController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKeyContact = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyContactProfileDetail =
      GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyContactPrivateProfileDetail =
      GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyPrivateAccountDetail =
      GlobalKey<ScaffoldState>();
  var selectedUsers = <int>[].obs;
  RxBool isDisabled = true.obs;

  RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[
    {'name': 'Savannah Nguyen', 'image': kUser1},
    {'name': 'Ralph Edwards', 'image': kUser2},
    {'name': 'Esther Howard', 'image': kUser3},
    {'name': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df', 'image': kUser4},
    {'name': 'Floyd Miles', 'image': kUser5},
    {'name': 'Jake Walsinger', 'image': kUser4},
  ].obs;

  RxList<Map<String, dynamic>> contactList = <Map<String, dynamic>>[
    {
      'account': '@cody_fisher2312',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2,
      'isShowFav': true,
      'onTap': () {
        Get.toNamed(kContactProfileDetailRoute);
      }
    },
    {
      'account': '@cody_fisher2312',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2,
      'isShowFav': true,
      'onTap': () {
        Get.toNamed(kContactPrivateProfileDetailRoute);
      }
    },
    {
      'account': '@cody_fisher2312',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2,
      'isShowFav': true,
      'onTap': () {}
    },
    {
      'name': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'account': 'Private Account',
      'isSelected': false.obs,
      'image': kUser4,
      'isShowFav': true,
      'onTap': () {
        Get.toNamed(kPrivateAccountDetailRoute);
      }
    },
    {
      'name': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df.',
      'account': 'Private Account',
      'isSelected': false.obs,
      'image': kUser4,
      'isShowFav': false,
      'onTap': () {}
    },
    {
      'name': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'account': 'Private Account',
      'isSelected': false.obs,
      'image': kUser4,
      'isShowFav': false,
      'onTap': () {}
    },
    {
      'name': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'account': 'Private Account',
      'isSelected': false.obs,
      'image': kUser4,
      'isShowFav': false,
      'onTap': () {}
    },
    {
      'name': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'account': 'Private Account',
      'isSelected': false.obs,
      'image': kUser4,
      'isShowFav': false,
      'onTap': () {}
    },
  ].obs;

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
