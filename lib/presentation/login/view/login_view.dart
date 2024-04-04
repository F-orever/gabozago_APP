import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gabozago/app/config/routes/route_path.dart';
import 'package:get/get.dart';

import '../widget/sso_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLoginHeader(),
              SizedBox(height: 40.h),
              _buildLoginBody(),
              SizedBox(height: 104.h),
              _buildLoginFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginHeader() {
    return Column(
      children: [
        SvgPicture.asset('assets/logo/logo_compass.svg', width: 60.w, height: 60.w),
        SizedBox(height: 7.17.h),
        SvgPicture.asset('assets/logo/logo.svg', width: 152.27.w, height: 30.w),
        SizedBox(height: 9.h),
        Text(
          "타인의 여행후기를\n나만의 여행으로 만드는 새로운 방법",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, height: 1.3, color: const Color(0xFF4061DB)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLoginBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.5.w),
      child: Column(
        children: [
          Image.asset('assets/noti/quick_start_noti.png', width: 183.w, height: 59.w, fit: BoxFit.cover),
          SSOLoginButton(
            "카카오톡으로 시작하기",
            onTap: () => Get.toNamed(RoutePath.register),
            iconPath: "assets/logo/kakaotalk.png",
            backgroundColor: const Color(0xFFFFE812),
          ),
          if (Platform.isIOS) ...[
            SizedBox(height: 7.h),
            SSOLoginButton(
              "Apple로 시작하기",
              onTap: () => Get.toNamed(RoutePath.register),
              iconPath: "assets/logo/apple.png",
              iconSize: 26.w,
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ],
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 98.5.w, child: Divider(height: 0.5.w, thickness: 0.5.w, color: const Color(0xFFD4D4D4))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.5.w),
                child: Text("또는", style: TextStyle(fontSize: 13.sp, color: const Color(0xFFD4D4D4))),
              ),
              SizedBox(width: 98.5.w, child: Divider(height: 0.5.w, thickness: 0.5.w, color: const Color(0xFFD4D4D4))),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SSOLoginCircleButton(backgroundColor: const Color(0xFF00BF18), iconPath: "assets/logo/naver.png", onTap: () {}),
              SizedBox(width: 15.w),
              SSOLoginCircleButton(
                borderColor: const Color(0xFFEDEDED),
                backgroundColor: const Color(0xFFFFFFFF),
                iconPath: "assets/logo/google.png",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginFooter() {
    return Text(
      "도움이 필요하신가요?",
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: const Color(0xFFAFAFAF),
        decoration: TextDecoration.underline,
        decorationColor: const Color(0xFFAFAFAF),
      ),
    );
  }
}
