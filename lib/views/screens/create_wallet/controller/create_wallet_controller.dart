import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';

class CreateWalletController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKeyCreatePassword = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyConfirmPassword = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyCreatePasscode = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyConfirmPasscode = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyBackUp = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyVerification = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyCreateProfile = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyProfileImage = GlobalKey<ScaffoldState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController backup = TextEditingController();
  TextEditingController profileEmail = TextEditingController();
  RxString backUpCode = 'word word word word word word word word word word word word'.obs;
  RxString backUpCodeHide = '**** **** **** **** **** **** **** **** **** **** **** ****'.obs;
  RxBool isShowCode = false.obs;
  RxBool isCheck = false.obs;
  RxBool isDisabled = true.obs;
  RxBool isDisabled2 = true.obs;
  RxBool isDisabledCreateProfile = true.obs;
  RxBool isDisabledVerification= true.obs;
  
  RxBool showConfirmPasswordError = false.obs;
  RxBool showVerificationError = false.obs;
  RxBool showCopiedMessage = false.obs;
  var code ;

  TextEditingController passcodeController = TextEditingController();
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

  TextEditingController passcodeController1 = TextEditingController();
  RxList<String> passcode1 = List.filled(6, "").obs;
  RxBool isPasscodeComplete1 = false.obs;
  RxBool isWrongPasscode = false.obs;
  
  void addDigit1(String digit) {
    for (int i = 0; i < passcode1.length; i++) {
      if (passcode1[i] == "") {
        passcode1[i] = digit;
        break;
      }
    }
    checkPasscodeComplete1();
  }

  void removeLastDigit1() {
    for (int i = passcode1.length - 1; i >= 0; i--) {
      if (passcode1[i] != "") {
        passcode1[i] = "";
        break;
      }
    }
    checkPasscodeComplete1();
  }

  void checkPasscodeComplete1() {
    isPasscodeComplete1.value = passcode1.every((digit) => digit.isNotEmpty);
  }
  void comparePasscodes() {
    if (!listEquals(passcode, passcode1)) {
      print(passcode);
      print(passcode1);
      print(passcode != passcode1);
      isWrongPasscode.value = true;
    } else {
      print(passcode);
      print(passcode != passcode1);
      print(passcode1);
      isWrongPasscode.value = false;
      Get.toNamed(kCreateProfileRoute);
    }
  }

  RxString imagePath = ''.obs;
  RxBool isUploading = false.obs;

  Future<void> getImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
    }
  }

  Future<void> getImageCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path;
    }
  }

}

