import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gabozago/app/config/routes/route_path.dart';
import 'package:gabozago/app/enums/term_type.dart';

import 'package:gabozago/presentation/common_widget/gabozago_appbar.dart';
import 'package:gabozago/presentation/common_widget/gabozago_button.dart';
import 'package:gabozago/presentation/common_widget/gabozago_text_field.dart';
import 'package:get/get.dart';

import '../widget/register_checkbox.dart';
import '../widget/register_container.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GabozagoAppBar("회원가입", hasBack: true),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                _buildConnectedAccount(),
                SizedBox(height: 18.h),
                _buildNickField(),
                SizedBox(height: 17.h),
                _buildCheckList(),
                SizedBox(height: 22.h),
                _buildReferral(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
          child: const GabozagoCTAButton("회원가입 완료"),
        ),
      ),
    );
  }

  Widget _buildConnectedAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("연결된 계정", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, height: 1.375)),
        SizedBox(height: 9.h),
        const GabozagoTextField(isDiabled: true),
        SizedBox(height: 9.h),
        Row(
          children: [
            Image.asset('assets/logo/kakaotalk_small.png', width: 16.w, height: 16.w),
            SizedBox(width: 5.w),
            Text(
              "카카오로 가입한 계정이에요.",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFFADADAD), height: 1.83),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNickField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("닉네임", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, height: 1.375)),
        SizedBox(height: 9.h),
        const GabozagoTextField(hintText: "닉네임을 입력하세요. (중복 불가)"),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "사용가능한 닉네임입니다 :)",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF4061DB), height: 1.83),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckList() {
    return Column(
      children: [
        RegisterContainer(
          child: RegisterCheckBox(
            value: true,
            onChanged: (value) {},
            text: "약관 전체 동의합니다.",
            subText: "선택항목 포함",
            isBold: true,
            isRequired: false,
          ),
        ),
        SizedBox(height: 10.h),
        RegisterContainer(
          child: Column(
            children: [
              RegisterCheckBox(
                value: true,
                onChanged: (value) {},
                text: "만 14세 이상입니다.",
                subText: "(필수)",
              ),
              SizedBox(height: 16.h),
              RegisterCheckBox(
                value: true,
                onChanged: (value) {},
                onTap: () => Get.toNamed(RoutePath.term, arguments: TermType.termOfUse),
                text: "서비스 이용약관 동의",
                subText: "(필수)",
                hasUnderline: true,
              ),
              SizedBox(height: 16.h),
              RegisterCheckBox(
                value: true,
                onChanged: (value) {},
                onTap: () => Get.toNamed(RoutePath.term, arguments: TermType.privacyPolicy),
                text: "개인정보 수집 및 이용 동의",
                subText: "(필수)",
                hasUnderline: true,
              ),
              SizedBox(height: 16.h),
              RegisterCheckBox(
                value: true,
                onChanged: (value) {},
                onTap: () => Get.toNamed(RoutePath.term, arguments: TermType.locationService),
                text: "위치서비스 이용 동의",
                subText: "(선택)",
                isRequired: false,
                hasUnderline: true,
              ),
              SizedBox(height: 16.h),
              RegisterCheckBox(
                value: true,
                onChanged: (value) {},
                text: "이벤트 및 할인 혜택 안내 동의",
                subText: "(선택)",
                isRequired: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReferral() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("추천받고 오셨다면 알려주세요!", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, height: 1.375)),
        SizedBox(height: 9.h),
        GabozagoTextField(
          hintText: "추천인 닉네임 입력",
          suffix: Padding(
            padding: EdgeInsets.only(right: 11.w),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.w),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF5276FA), width: 1.w),
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xFFECF0FF),
                ),
                child: Text(
                  "확인",
                  style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5276FA), height: 2),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "유효하지 않은 유저입니다.",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF4061DB), height: 1.83),
          ),
        ),
      ],
    );
  }
}
