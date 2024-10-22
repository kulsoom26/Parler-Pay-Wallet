import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKeyLogin = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldForgotPasscode = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyForgotPassword = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyForgotCreatePassword= GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyConfirmResetPassword= GlobalKey<ScaffoldState>();
  TextEditingController passcodeController = TextEditingController();
  TextEditingController forgotPasscode = TextEditingController();
  TextEditingController forgotPassword = TextEditingController();
  TextEditingController forgotCreatePassword = TextEditingController();
  TextEditingController resetConfirmPassword = TextEditingController();
  RxList<String> passcode = List.filled(6, "").obs;
  RxBool isPasscodeComplete = false.obs;
  RxBool isDisabled = true.obs;
  RxBool isDisabled1 = true.obs;
  RxBool isDisabled2 = true.obs;
  RxBool isDisabled3 = true.obs;
  RxBool isCheck = false.obs;
  
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