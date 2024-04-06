import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gabozago/app/base/base_view.dart';
import 'package:gabozago/app/config/app_color.dart';
import 'package:get/get.dart';

import '../view_model/main_view_model.dart';

enum MainBottomNavigationBarItem {
  home("홈", "home"),
  myTour("나의 여행", "map"),
  scarp("스크랩", "copy"),
  myPage("마이페이지", "person_circle");

  const MainBottomNavigationBarItem(this.title, this.iconPath);

  final String title;
  final String iconPath;
}

class MainBottomNavigationBar extends BaseView<MainViewModel> {
  const MainBottomNavigationBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 88.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < MainBottomNavigationBarItem.values.length; i++) _BottomNavigationBarItem(i),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBarItem extends BaseView<MainViewModel> {
  const _BottomNavigationBarItem(this.idx);

  final int idx;

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () {
        final Color color = vm.currentIdx == idx ? AppColor.main : const Color(0xFFADADAD);

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => vm.setPage(idx),
          child: Column(
            children: [
              SizedBox(height: 14.h),
              SvgPicture.asset(
                'assets/icons/${MainBottomNavigationBarItem.values[idx].iconPath}.svg',
                width: 30.w,
                height: 30.w,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
              Text(
                MainBottomNavigationBarItem.values[idx].title,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: color),
              ),
            ],
          ),
        );
      },
    );
  }
}
