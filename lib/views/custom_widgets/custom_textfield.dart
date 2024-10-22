import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/auth/controller/auth_controller.dart';
import 'package:parler_pay_wallet/views/screens/create_wallet/controller/create_wallet_controller.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLines;
  final double? height;
  final double? width;
  final Color? hintColor;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.maxLines,
    this.height,
    this.width,
    this.hintColor
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  CreateWalletController cont = Get.put(CreateWalletController());
  AuthController cont1 = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ??361.w,
      height: widget.height ??56.h,
      margin: EdgeInsets.only(top: 10.h),
      child: TextField(
        controller: widget.controller,
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15.h, left: 15.w),
          hintText: widget.hint,
          hintStyle: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp, color: widget.hintColor?? kWhiteColor.withOpacity(0.5)),
          filled: true,
          fillColor: kWhiteColor.withOpacity(0.12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9999),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9999),
            borderSide: BorderSide(color: kWhiteColor),
          ),
        
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9999),
            borderSide: BorderSide(color: kWhiteColor.withOpacity(0.3)),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                    color: kWhiteColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        onChanged: (value){
          if(cont.confirmPassword.text != '' ){
            cont.isDisabled2.value = false;
          }
          if(cont.password.text != '' && cont.isCheck.isTrue){
            cont.isDisabled.value = false;
          }
          if(cont.profileEmail.text != ''){
            cont.isDisabledCreateProfile.value = false;
          }
          if(cont1.forgotPasscode.text != ''){
             cont1.isDisabled.value = false;
          } 
          if(cont1.forgotPasscode.text == ''){
             cont1.isDisabled.value = true;
          }
          if(cont1.forgotPassword.text != ''){
             cont1.isDisabled1.value = false;
          } 
          if(cont1.forgotPassword.text == ''){
             cont1.isDisabled1.value = true;
          }
          if(cont1.forgotCreatePassword.text == ''){
             cont1.isDisabled2.value = true;
          }
          if(cont1.resetConfirmPassword.text != ''){
             cont1.isDisabled3.value = false;
          } 
          if(cont1.resetConfirmPassword.text == ''){
             cont1.isDisabled3.value = true;
          }
        },
        onSubmitted: (val){
          if(cont.confirmPassword.text != '' ){
            cont.isDisabled2.value = false;
          }
        },
        style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp, color: kWhiteColor),
      ),
    );
  }
}
