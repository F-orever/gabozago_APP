import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gabozago/app/base/base_view.dart';
import 'package:get/get.dart';

import '../view_model/recommend_view_model.dart';

// TODO: Lazy Loading 처리

class RecommendView extends BaseView<RecommendViewModel> {
  const RecommendView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          const _BuildWeeklyArticle(),
          SizedBox(height: 40.h),
          const _BuildHotArticle(),
          SizedBox(height: 25.h),
          const _Divider(),
          SizedBox(height: 25.h),
          const _BuildLatestContent(),
          SizedBox(height: 40.h),
          const _BuildLatestThemeContent(),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}

class _BuildWeeklyArticle extends StatelessWidget {
  const _BuildWeeklyArticle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header("이번 주 많이 본 아티클"),
        _Body(
          title: "2년만에 15개 점포로 확장한, 제과점 대표의 '디저트'와 함께하는",
          width: 217.w,
          height: 186.w,
        ),
      ],
    );
  }
}

class _BuildHotArticle extends StatelessWidget {
  const _BuildHotArticle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header("인기 Top 6-10 아티클"),
        _Body(title: "2년만에 15개 점포로 확장한, 제과점 대표의 '디저트'와 함께하는", width: 140.w, height: 140.w),
      ],
    );
  }
}

class _BuildLatestContent extends StatelessWidget {
  const _BuildLatestContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header("최신 콘텐츠"),
        _Body(
          title: "2년만에 15개 점포로 확장한, 제과점 대표의 '디저트'와 함께하는",
          width: 200.w,
          height: 264.w,
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/clap_blue.svg', width: 18.63.w),
              SizedBox(width: 5.91.w),
              Text("21", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, height: 2)),
            ],
          ),
        ),
      ],
    );
  }
}

class _BuildLatestThemeContent extends StatelessWidget {
  const _BuildLatestThemeContent();

  @override
  Widget build(BuildContext context) {
    final double width = (Get.width - 46.73.w) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header("인기 테마 콘텐츠"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Wrap(
            spacing: 6.73.w,
            runSpacing: 19.h,
            children: [
              for (int i = 0; i < 4; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: width,
                          height: width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7.r),
                            child: CachedNetworkImage(imageUrl: "https://picsum.photos/200/300", fit: BoxFit.cover),
                          ),
                        ),
                        Positioned.fill(
                          right: 4.w,
                          bottom: 6.h,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: SvgPicture.asset('assets/icons/scrap.svg', width: 35.w, height: 35.w),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: width,
                      child: Text(
                        "2년 만에 15개 점포로 확장한, 제과점 대표의 '디저트'와 함께하는",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, height: 1.42, letterSpacing: 0.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "조회수 250회 • 좋아요 250회",
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFFADADAD)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/person_circle.svg',
                          width: 18.w,
                          height: 18.w,
                          colorFilter: const ColorFilter.mode(Color(0xFFADADAD), BlendMode.srcIn),
                        ),
                        SizedBox(width: 3.27.w),
                        Text("USERNAME", style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, color: const Color(0xFFADADAD))),
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(title, style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600, height: 1.29)),
        ),
        SizedBox(height: 19.h),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.title,
    required this.width,
    required this.height,
    this.child,
  });

  final String title;
  final double width;
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            Padding(
              padding: EdgeInsets.only(left: i == 0 ? 20.w : 7.w, right: i == 4 ? 20.w : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: width,
                        height: height,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.r),
                          child: CachedNetworkImage(imageUrl: "https://picsum.photos/200/300", fit: BoxFit.cover),
                        ),
                      ),
                      Positioned.fill(
                        right: 4.w,
                        bottom: 6.h,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SvgPicture.asset('assets/icons/scrap.svg', width: 35.w, height: 35.w),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: width,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, height: 1.42, letterSpacing: 0.2),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  child ?? const SizedBox(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 14.h,
      height: 14.h,
      color: const Color(0xFFF6F6F6),
    );
  }
}
