import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKeyNotification = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyNotificationPaymentAccept = GlobalKey<ScaffoldState>();
  RxBool isAll = true.obs;
  RxBool isFriendRequests = false.obs;
  RxBool isTransactions = false.obs;
  RxBool isPaymentRequests = false.obs;
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