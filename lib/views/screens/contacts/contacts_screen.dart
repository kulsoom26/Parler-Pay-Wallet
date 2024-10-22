import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/utils/app_images.dart';
import 'package:parler_pay_wallet/utils/app_styles.dart';
import 'package:parler_pay_wallet/views/screens/contacts/controller/contacts_controller.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: kRedColor,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: kWhiteColor,
            size: 30,
          ),
        ),
        key: controller.scaffoldKeyContact,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: kWhiteColor),
          title: Text(
            'Friends',
            style: AppStyles.labelTextStyle().copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp),
          ),
          actions: const [
            Center(
              child: Icon(Icons.search, color: kWhiteColor, size: 32),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Text(
                  'Most Recent',
                  style: AppStyles.labelTextStyle().copyWith(
                      color: kWhiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: ContactGrid(controller: controller),
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                color: kWhiteColor.withOpacity(0.2),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Text(
                  'My Contacts',
                  style: AppStyles.labelTextStyle().copyWith(
                      color: kWhiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SizedBox(
                  height: Get.height,
                  child: ContactListView(),
                ),
              ),
            ],
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

  final ContactController controller;

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
          childAspectRatio: 1.2,
        ),
        itemCount: widget.controller.userList.length,
        itemBuilder: (context, index) {
          var item = widget.controller.userList[index];

          return GestureDetector(
            onTap: () {
              if (item['name'] ==
                  '0xF1b5dF47E3d9a6e06A6dF5D7D21E5a7fC6d7f7Df') {}
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 34.r,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
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

class ContactListView extends StatelessWidget {
  final ContactController controller = Get.find<ContactController>();

  ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.contactList.length,
          itemBuilder: (context, index) {
            var item = controller.contactList[index];
            return ListTile(
              leading: item['name'] == 'Cody Fisher'
                  ? Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(item['image']))),
                    )
                  : Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          color: kWhiteColor.withOpacity(0.12),
                          border: Border.all(
                              width: 1, color: kWhiteColor.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(999.r)),
                      child: Center(
                          child: Image.asset(
                        kContactUserIcon,
                        width: 19.w,
                      )),
                    ),
              title: Text(
                item['name'],
                overflow: TextOverflow.ellipsis,
                style: AppStyles.labelTextStyle().copyWith(fontSize: 16.sp),
              ),
              subtitle: Text(
                item['account'],
                style: AppStyles.labelTextStyle()
                    .copyWith(fontSize: 14.sp, color: kGray400),
              ),
              trailing: item['isShowFav']
                  ? GestureDetector(
                      onTap: () {
                        item['isSelected'].value = !item['isSelected'].value;
                      },
                      child: Obx(() => Icon(
                            Icons.star,
                            color: item['isSelected'].value
                                ? Colors.amber
                                : Colors.grey,
                          )),
                    )
                  : null,
              onTap: item['onTap'],
            );
          },
        ));
  }
}
