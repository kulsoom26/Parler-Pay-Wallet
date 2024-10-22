import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_strings.dart';
import 'package:parler_pay_wallet/views/screens/home/controller/home_controller.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_button.dart';

class FindContactScreen extends GetView<HomeController> {
  const FindContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> arguments = Get.arguments;
    final String? service = arguments['service'];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        key: controller.scaffoldKeyFindContact,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 32.w,
              height: 32.h,
              margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(color: kWhiteColor, width: 1.5),
                color: kWhiteColor.withOpacity(0.12),
              ),
              child: const Center(
                child: Icon(Icons.keyboard_arrow_left,
                    color: kWhiteColor, size: 20),
              ),
            ),
          ),
          title: Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: kWhiteColor),
                hintText: 'Search by address, name, or...',
                hintStyle: TextStyle(color: kWhiteColor.withOpacity(0.5)),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kWhiteColor.withOpacity(0.12)),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kWhiteColor),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                filled: true,
                fillColor: kWhiteColor.withOpacity(0.05),
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              ),
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Image.asset(kQRIcon, width: 25.w),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                ContactGrid(controller: controller),
                SizedBox(
                  height: 8.h,
                ),
                for (var item in controller.contactList) ...{
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: AssetImage(item['image']),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: AppStyles.labelTextStyle()
                                .copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            item['account'],
                            style: AppStyles.labelTextStyle()
                                .copyWith(fontSize: 12.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Spacer(),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            item['isSelected'].value =
                                !item['isSelected'].value;
                            controller.updateSelectionStatus();
                          },
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: item['isSelected'].value == false
                                    ? Border.all(color: kGreyColor, width: 1)
                                    : null,
                                color: item['isSelected'].value == false
                                    ? Colors.transparent
                                    : kCheckBoxFilledColor),
                            child: item['isSelected'].value == false
                                ? null
                                : const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: kWhiteColor,
                                      size: 20,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  )
                }
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16),
          child: Obx(
            () => CustomButton(
              height: 56.h,
              width: 361.w,
              bgColor: controller.isDisabled.isTrue
                  ? kRedColor.withOpacity(0.3)
                  : kRedColor,
              fontColor: controller.isDisabled.isTrue
                  ? kWhiteColor.withOpacity(0.3)
                  : kWhiteColor,
              onPressed: () {
                if (!controller.isDisabled.value) {
                  if(service == 'send'){
                    Get.toNamed(kSendMoneyRoute);
                  }
                  else{
                    Get.toNamed(kRequestMoneyRoute);
                  }
                }
              },
              title: "Continue",
            ),
          ),
        ),
      ),
    );
  }
}

class ContactGrid extends StatefulWidget {
  const ContactGrid({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  State<ContactGrid> createState() => _ContactGridState();
}

class _ContactGridState extends State<ContactGrid> {
  final Set<int> selectedUsers = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 5.0,
          childAspectRatio: 1,
        ),
        itemCount: widget.controller.userList.length,
        itemBuilder: (context, index) {
          var item = widget.controller.userList[index];
          bool isSelected = selectedUsers.contains(index);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedUsers.remove(index);
                } else {
                  selectedUsers.add(index);
                }
              });
              widget.controller.toggleUserSelection(index);
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 34.r,
                  backgroundColor: isSelected ? kRedColor : Colors.transparent,
                  child: isSelected
                      ? Icon(Icons.check, color: kWhiteColor)
                      : CircleAvatar(
                          radius: 32.r,
                          backgroundImage: AssetImage(item['image']),
                        ),
                ),
                SizedBox(height: 10.h),
                Flexible(
                  child: Text(
                    item['name'],
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
