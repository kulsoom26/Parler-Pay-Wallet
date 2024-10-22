import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKeyHome = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyOptioAsset = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyEthAsset = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyBtcAsset = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyEnableContact = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyFindContact = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeySendMoney = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyRequestMoney = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyParlerPay = GlobalKey<ScaffoldState>();
  RxString balance = '\$0.00'.obs;
  RxList<Map<String,dynamic>> assetList = <Map<String,dynamic>>[
    {
      'onTap': (){
        Get.toNamed(kOptioAssetRoute);
      },
      'title': 'Optio',
      'price': '\$435.99',
      'subtitle': 'OPTIO',
      'subPrice': '\$435.99',
      'image': kToken
    },
    {
      'onTap': (){
        Get.toNamed(kBtcAssetRoute);
      },
      'title': 'Bitcoin',
      'price': '\$17.22',
      'subtitle': 'BTC',
      'subPrice': '0.000303 BTC',
      'image': kToken1
    },
    {
      'onTap': (){
        Get.toNamed(kEthAssetRoute);
      },
      'title': 'Ethereum',
      'price': '\$0.00',
      'subtitle': 'ETH',
      'subPrice': '0.000 ETH',
      'image': kToken2
    },
    {
      'onTap': (){},
      'title': 'USDC',
      'price': '\$0.00',
      'subtitle': 'USDC',
      'subPrice': '0.00 USDC',
      'image': kToken3
    }
  ].obs;

  RxList<Map<String,dynamic>> userList = <Map<String,dynamic>>[
    {
      'name': 'Savannah Nguyen',
      'image': kUser1
    },
    {
      'name': 'Ralph Edwards',
      'image': kUser2
    },
    {
      'name': 'Esther Howard',
      'image': kUser3
    },
    {
      'name': 'Kathryn Murphy',
      'image': kUser4
    },
    {
      'name': 'Floyd Miles',
      'image': kUser5
    },
    {
      'name': 'Jake Walsinger',
      'image': kUser4
    },
  ].obs;

  RxList<Map<String,dynamic>> optioAssetList = <Map<String,dynamic>>[
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': true,
      'subtitle': '0.000303 OPTIO',
      'image': kUser2,
      'logo': kToken,
      'color': kGray200
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Recieved 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 OPTIO',
      'image': kSendMoneyIcon,
      'logo': kToken,
      'color': kGreenColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 OPTIO',
      'image': kReceiveIcon,
      'logo': kToken,
      'color': kBlueColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 OPTIO',
      'image': kConvertIcon,
      'logo': kToken,
      'color': kPurpleColor
    },
    
  ].obs;
  RxList<Map<String,dynamic>> ethAssetList = <Map<String,dynamic>>[
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': true,
      'subtitle': '0.000303 ETH',
      'image': kIncomingIcon,
      'logo': kToken2,
      'color': kRedColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Recieved 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 ETH',
      'image': kSendMoneyIcon,
      'logo': kToken2,
      'color': kGreenColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 ETH',
      'image': kReceiveIcon,
      'logo': kToken2,
      'color': kBlueColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 ETH',
      'image': kConvertIcon,
      'logo': kToken2,
      'color': kPurpleColor
    },
    
  ].obs;

  RxList<Map<String,dynamic>> btcAssetList = <Map<String,dynamic>>[
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': true,
      'subtitle': '0.000303 BTC',
      'image': kIncomingIcon,
      'logo': kToken1,
      'color': kRedColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Recieved 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 BTC',
      'image': kSendMoneyIcon,
      'logo': kToken1,
      'color': kGreenColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 BTC',
      'image': kReceiveIcon,
      'logo': kToken1,
      'color': kBlueColor
    },
    {
      'onTap': (){
      },
      'title': '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df',
      'sendDate': 'Sent 2:42 PM',
      'price': '\$17.22',
      'isMinus': false,
      'subtitle': '0.000303 BTC',
      'image': kConvertIcon,
      'logo': kToken1,
      'color': kPurpleColor
    },
    
  ].obs;

  var selectedUsers = <int>[].obs;

 

  RxList<Map<String,dynamic>> contactList = <Map<String,dynamic>>[
    {
      'account': 'curtis.weaver@example.com',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
    {
      'account': 'debbie.baker@example.com',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
    {
      'account': '0xF1b5dF47E3d9a6e06A6...',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
    {
      'account': '0xF1b5dF47E3d9a6e06A6...',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
    {
      'account': '0xF1b5dF47E3d9a6e06A6...',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
    {
      'account': '0xF1b5dF47E3d9a6e06A6...',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
    {
      'account': '0xF1b5dF47E3d9a6e06A6...',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
    {
      'account': '0xF1b5dF47E3d9a6e06A6...',
      'name': 'Cody Fisher',
      'isSelected': false.obs,
      'image': kUser2
    },
  ].obs;
  void updateSelectionStatus() {
    isDisabled.value = contactList.every((item) => !item['isSelected'].value);
  }

  void toggleUserSelection(int index) {
    if (selectedUsers.contains(index)) {
      selectedUsers.remove(index);
    } else {
      selectedUsers.add(index);
    }
    updateSelectionStatus();
  }
  RxBool isCrypto = true.obs;

  RxBool isDisabled = true.obs;
  RxBool isDisabled1 = true.obs;
  RxString selectedLogo = kToken.obs;
  RxString selectedTitle = '2,221.21 OPTIO'.obs;
  RxString cryptoName = 'OPTIO'.obs;
  RxString selectedAccount = '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df'.obs;
  TextEditingController price = TextEditingController();
  RxString rate = '0.00'.obs;
  RxInt index = 0.obs;
  

  RxList<Map<String,dynamic>> digitalAssetList = <Map<String,dynamic>>[
    {
      'onTap': (){
        
      },
      'title': 'Optio',
      'price': '\$435.99',
      'subtitle': 'OPTIO',
      'subPrice': '\$435.99',
      'image': kToken
    },
    {
      'onTap': (){
      },
      'title': 'Bitcoin',
      'price': '\$17.22',
      'subtitle': 'BTC',
      'subPrice': '0.000303 BTC',
      'image': kToken1
    },
    {
      'onTap': (){
      },
      'title': 'Ethereum',
      'price': '\$0.00',
      'subtitle': 'ETH',
      'subPrice': '0.000 ETH',
      'image': kToken2
    },
    {
      'onTap': (){},
      'title': 'USDC',
      'price': '\$0.00',
      'subtitle': 'USDC',
      'subPrice': '0.00 USDC',
      'image': kToken3
    }
  ].obs;
  RxInt parleyPayIndex = 1.obs;
  RxString selectedValue = 'public'.obs;
  RxBool isSelectedPublic = false.obs;
  RxBool isSelectedFriends = false.obs;
  RxBool isSelectedPrivate = false.obs;
  RxList<String> passcode = List.filled(6, "").obs;
  RxBool isPasscodeComplete = false.obs;

  void addDigit(String digit) {
    for (int i = 0; i < passcode.length; i++) {
      if (passcode[i] == "") {
        passcode[i] = digit;
        break;
      }
    }
    checkPasscodeComplete();
  }

  void removeLastDigit() {
    for (int i = passcode.length - 1; i >= 0; i--) {
      if (passcode[i] != "") {
        passcode[i] = "";
        break;
      }
    }
    checkPasscodeComplete();
  }

  void checkPasscodeComplete() {
    isPasscodeComplete.value = passcode.every((digit) => digit.isNotEmpty);
  }
}