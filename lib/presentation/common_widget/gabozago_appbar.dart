import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class GabozagoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GabozagoAppBar(this.title, {super.key, this.hasBack = false});

  final String title;
  final bool hasBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 35.h,
      title: Text(title),
      titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: const Color(0xFF333333), height: 1.375),
      centerTitle: true,
      leadingWidth: 44.w,
      leading: hasBack
          ? Center(
              child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset('assets/icons/chevron_left.svg', width: 24.w, height: 24.w),
              ),
            ))
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(35.h);
}
