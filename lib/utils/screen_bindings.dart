import 'package:get/get.dart';
import 'package:parler_pay_wallet/views/screens/auth/controller/auth_controller.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/controller/create_wallet_controller.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';
import 'package:parler_pay_wallet/views/screens/profile/controller/profile_controller.dart';

import '../views/screens/contacts/controller/contacts_controller.dart';
import '../views/screens/notifications/controller/notifications_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => CreateWalletController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ContactController());
    Get.lazyPut(() => NodeController());
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => ProfileController());
  }
}
