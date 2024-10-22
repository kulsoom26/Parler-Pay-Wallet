import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parler_pay_wallet/utils/app_colors.dart';
import 'package:parler_pay_wallet/views/screens/node/controller/node_controller.dart';
import '../../../utils/app_styles.dart';


class NodeScreen extends GetView<NodeController> {
  const NodeScreen({super.key});

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
        key: controller.scaffoldKeyNode,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: kWhiteColor),
          title: Text(
            'Node',
            style: AppStyles.labelTextStyle().copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          actions: const [
            Center(
              child: Icon(Icons.search, color: kWhiteColor, size: 30),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.settingsList.length,
                  itemBuilder: (context, index) {
                    final item = controller.settingsList[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      minTileHeight: 85.h,
                      onTap: item['onTap'],
                      leading: Image.asset(item['leading'], width: 24.w,),
                      title: Text(
                        item['title'],
                        style: AppStyles.labelTextStyle().copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      subtitle: Text(
                        item['subtitle'],
                        style: AppStyles.labelTextStyle().copyWith(
                          color: kGray400,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: item['onTap'],
                        child: const Icon(Icons.keyboard_arrow_right, color: kWhiteColor,),
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
