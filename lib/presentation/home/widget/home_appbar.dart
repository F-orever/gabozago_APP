import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gabozago/app/base/base_view.dart';

import '../view_model/home_view_model.dart';

class HomeAppBar extends BaseView<HomeViewModel> implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 44.h,
      titleSpacing: 0,
      title: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Divider(height: 1.4.h, color: const Color(0xFFE0E0E0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabBar(
                  // Misc
                  controller: vm.tabController,
                  tabs: vm.tabs,
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,

                  // label Decoration
                  labelColor: const Color(0xFF5276FA),
                  labelStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, height: 1.1),
                  labelPadding: EdgeInsets.symmetric(horizontal: 6.5.w),

                  // unselectedLabel Decoration
                  unselectedLabelColor: const Color(0xFF424242),
                  unselectedLabelStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, height: 1.1),

                  // divider & indicator Decoration
                  dividerColor: Colors.transparent,
                  indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 3.w, color: const Color(0xFF5276FA))),
                  indicatorColor: const Color(0xFF5276FA),

                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/search.svg', width: 24.w, height: 24.w),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44.h);
}
