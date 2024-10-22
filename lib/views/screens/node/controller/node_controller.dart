import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';

class NodeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKeyNode = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyAccountScreen = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyEditProfile = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyWalletSetting = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyEditBank = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyEditCard = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyAddCard = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyLinkBank = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyNotificationSettings = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyAccountActivity = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeySecurityAlerts = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyProductAnnouncements = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyPrivacySecurity = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyFriendsSocial = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyPaymentMethod = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyHelp = GlobalKey<ScaffoldState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController card = TextEditingController(text: '4343 4343 4343 4343');
  TextEditingController exp = TextEditingController(text: '05/25');
  TextEditingController cvc = TextEditingController(text: '123');
  TextEditingController number = TextEditingController(text: '80001');

  TextEditingController addCard = TextEditingController();
  TextEditingController addExp = TextEditingController();
  TextEditingController addCVC = TextEditingController();
  TextEditingController addBilling = TextEditingController();

  TextEditingController addRouting = TextEditingController();
  TextEditingController addAccount = TextEditingController();
  TextEditingController addConfirmAccount = TextEditingController();

  TextEditingController bankName = TextEditingController();
  TextEditingController accountNumber = TextEditingController(text: 'hello how are you');
  TextEditingController iban = TextEditingController(text: 'hey hello how are you');
  TextEditingController num= TextEditingController(text: 'hey hello how are you');
  RxList<Map<String,dynamic>> settingsList = <Map<String,dynamic>>[
    {
      'onTap': (){
        Get.toNamed(ksettingsAccountRoute);
      },
      'title': 'Account',
      'leading': kNav5Icon,
      'subtitle': 'Manage your account and profile.',
    },
     {
      'onTap': (){
        Get.toNamed(kSettingsWalletRoute);
      },
      'title': 'Wallet',
      'leading': kWalletIcon,
      'subtitle': 'Recovery phrase, wallet password, and more.',
    },
     {
      'onTap': (){
        Get.toNamed(kSettingsPaymentMethodRoute);
      },
      'title': 'Payment Methods',
      'leading': kPaymentIcon,
      'subtitle': 'Add or remove payment methods.',
    },
     {
      'onTap': (){
        Get.toNamed(kSettingsNotifications);
      },
      'title': 'Notifications',
      'leading': kNav3Icon,
      'subtitle': 'Preferences, notification types',
    },
    {
      'onTap': (){
        Get.toNamed(kSettingsPrivacySecurityRoute);
      },
      'title': 'Privacy & Security',
      'leading': kPrivateIcon,
      'subtitle': 'Passcode, Face ID and more.',
    },
    {
      'onTap': (){
        Get.toNamed(kSettingsFriendsSecurityRoute);
      },
      'title': 'Friends & Social',
      'leading': kFriendsSocialIcon,
      'subtitle': 'Parler Social account and more. ',
    },
    {
      'onTap': (){
        Get.toNamed(kSettingsHelpRoute);
      },
      'title': 'Help',
      'leading': kHelpIcon,
      'subtitle': 'Help center and support.',
    },
  ].obs;

  RxBool isSelectedPublic = false.obs;
  RxBool isSelectedFriends = false.obs;
  RxBool isSelectedPrivate = false.obs;
  RxBool isCheck = true.obs;
  RxBool isCheck1 = false.obs;
  RxBool isCheck2 = false.obs;
  RxBool isPushNot = true.obs;

  RxBool isTextAccountActivity = false.obs;
  RxBool isEmailAccountActivity = true.obs;
  RxBool isInAppAccountActivity = true.obs;
  RxBool isPushNot1 = true.obs;

  RxBool isTextSecurityAlert = false.obs;
  RxBool isEmailSecurityAlert = true.obs;
  RxBool isInAppSecurityAlert = true.obs;
  RxBool isPushNot2 = true.obs;

  RxBool isTextProdAnnoun = false.obs;
  RxBool isEmailProdAnnoun = true.obs;
  RxBool isInAppProductAnnoun = true.obs;
  RxBool isPushNot3 = true.obs;
}