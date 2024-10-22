import 'package:get/get.dart';
import 'package:parler_pay_wallet/views/screens/auth/confirm_reset_password_screen.dart';
import 'package:parler_pay_wallet/views/screens/auth/forgot_create_password_screen.dart';
import 'package:parler_pay_wallet/views/screens/auth/forgot_passcode_screen.dart';
import 'package:parler_pay_wallet/views/screens/auth/forgot_password_screen.dart';
import 'package:parler_pay_wallet/views/screens/auth/login_screen.dart';
import 'package:parler_pay_wallet/views/screens/bottom_navbar/bottom_navbar.dart';
import 'package:parler_pay_wallet/views/screens/contacts/contact_private_profile_screen.dart';
import 'package:parler_pay_wallet/views/screens/contacts/private_account_screen.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/backup_screen.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/confirm_passcode_screen.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/create_passcode_screen.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/create_password_screen.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/profile_image_screen.dart';
import 'package:parler_pay_wallet/views/screens/home/btc_asset_screen.dart';
import 'package:parler_pay_wallet/views/screens/home/eth_asset_screen.dart';
import 'package:parler_pay_wallet/views/screens/home/home_screen.dart';
import 'package:parler_pay_wallet/views/screens/home/optio_asset_screen.dart';
import 'package:parler_pay_wallet/views/screens/home/parler_pay.dart';
import 'package:parler_pay_wallet/views/screens/home/send_money_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/account_activity_settings_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/account_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/add_card_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/edit_bank_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/edit_card_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/edit_profile_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/friends_social_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/help_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/link_bank_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/node_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/notification_settings_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/payment_method_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/privacy_security_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/product_announcement_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/security_alerts_screen.dart';
import 'package:parler_pay_wallet/views/screens/node/wallet_setting_screen.dart';
import 'package:parler_pay_wallet/views/screens/notifications/payment_accept_screen.dart';
import '../splash_screen.dart';
import '../views/screens/contacts/contact_profile_detail_screen.dart';
import '../views/screens/contacts/contacts_screen.dart';
import '../views/screens/create_wallet/confirm_password_screen.dart';
import '../views/screens/create_wallet/create_profile_screen.dart';
import '../views/screens/create_wallet/verification_screen.dart';
import '../views/screens/home/enable_contacts_screen.dart';
import '../views/screens/home/request_money_screen.dart';
import '../views/screens/home/select_contact_screen.dart';
import '../views/screens/notifications/notifications_screen.dart';
import '../views/screens/profile/profile_screen.dart';
import '../views/screens/welcome_screen.dart';
import 'app_strings.dart';
import 'screen_bindings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kSplashRoute, page: () => const SplashScreen(), binding: ScreenBindings()),
      GetPage(name: kWelcomeRoute, page: () => const WelcomeScreen(), binding: ScreenBindings()),
      GetPage(name: kCreatePasswordRoute, page: () => const CreatePasswordScreen(), binding: ScreenBindings()),
      GetPage(name: kConfirmPasswordRoute, page: () => const ConfirmPasswordScreen(), binding: ScreenBindings()),
      GetPage(name: kBackupRoute, page: () => const BackupScreen(), binding: ScreenBindings()),
      GetPage(name: kCreatePasscodeRoute, page: () => const CreatePasscodeScreen(), binding: ScreenBindings()),
      GetPage(name: kConfirmPasscodeRoute, page: () => const ConfirmPasscodeScreen(), binding: ScreenBindings()),
      GetPage(name: kCreateProfileRoute, page: () => const CreateProfileScreen(), binding: ScreenBindings()),
      GetPage(name: kVerificationRoute, page: () => const VerificationScreen(), binding: ScreenBindings()),
      GetPage(name: kProfileImageRoute, page: () => const ProfileImageScreen(), binding: ScreenBindings()),
      GetPage(name: kBottomNavbarRoute, page: () => const CustomNavBar(), binding: ScreenBindings()),

      //Auth route
      GetPage(name: kLoginRoute, page: () => const LoginScreen(), binding: ScreenBindings()),
      GetPage(name: kForgotPasscodeRoute, page: () => const ForgotPasscodeScreen(), binding: ScreenBindings()),
      GetPage(name: kForgotPasswordRoute, page: () => const ForgotPasswordScreen(), binding: ScreenBindings()),
      GetPage(name: kForgotCreatePasswordRoute, page: () => const ForgotCreatePasswordScreen(), binding: ScreenBindings()),
      GetPage(name: kResetConfirmPasswordRoute, page: () => const ConfirmResetPasswordScreen(), binding: ScreenBindings()),

      //Home Route
      GetPage(name: kHomeRoute, page: () => const HomeScreen(), binding: ScreenBindings()),
      GetPage(name: kOptioAssetRoute, page: () => const OptioAssetScreen(), binding: ScreenBindings()),
      GetPage(name: kEthAssetRoute, page: () => const ETHAssetScreen(), binding: ScreenBindings()),
      GetPage(name: kBtcAssetRoute, page: () => const BTCAssetScreen(), binding: ScreenBindings()),
      GetPage(name: kEnableContactRoute, page: () => const EnableContactScreen(), binding: ScreenBindings()),
      GetPage(name: kFindContactRoute, page: () => const FindContactScreen(), binding: ScreenBindings()),
      GetPage(name: kSendMoneyRoute, page: () => const SendMoneyScreen(), binding: ScreenBindings()),
      GetPage(name: kRequestMoneyRoute, page: () => const RequestMoneyScreen(), binding: ScreenBindings()),
      GetPage(name: kParlerPayRoute, page: () => const ParlerPayScreen(), binding: ScreenBindings()),

      //Contact Route
      GetPage(name: kContactRoute, page: () => const ContactScreen(), binding: ScreenBindings()),
      GetPage(name: kContactProfileDetailRoute, page: () => const ContactProfileDetailScreen(), binding: ScreenBindings()),
      GetPage(name: kContactPrivateProfileDetailRoute, page: () => const ContactPrivateProfileDetailScreen(), binding: ScreenBindings()),
      GetPage(name: kPrivateAccountDetailRoute, page: () => const PrivateAccountDetailScreen(), binding: ScreenBindings()),

      //Node Route
      GetPage(name: kNodeRoute, page: () => const NodeScreen(), binding: ScreenBindings()),
      GetPage(name: ksettingsAccountRoute, page: () => const SettingsAccountScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsEditProfiletRoute, page: () => const SettingsEditProfileScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsWalletRoute, page: () => const WalletSettingsScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsPaymentMethodRoute, page: () => const PaymentMethodScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsEditCardRoute, page: () => const EditCardScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsEditBankRoute, page: () => const EditBankScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsAddCardRoute, page: () => const AddCardScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsLinkBankRoute, page: () => const LinkBankScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsNotifications, page: () => const NotificationSettingsScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsAccountActivityRoute, page: () => const AccountActivitySettingsScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsProductAnnouncementRoute, page: () => const ProductAnnouncementScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsSecurityAlertsRoute, page: () => const SecurityAlertsScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsPrivacySecurityRoute, page: () => const PrivacySecurityScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsFriendsSecurityRoute, page: () => const FriendsSocialScreen(), binding: ScreenBindings()),
      GetPage(name: kSettingsHelpRoute, page: () => const HelpScreen(), binding: ScreenBindings()),

      //Notification Route
      GetPage(name: kNotificationRoute, page: () => const NotificationScreen(), binding: ScreenBindings()),
      GetPage(name: kNotificationPaymentAcceptRoute, page: () => const PaymentAcceptScreen(), binding: ScreenBindings()),

      //Profile Route
      GetPage(name: kProfileRoute, page: () => const ProfileScreen(), binding: ScreenBindings()),
    ];
  }
}
