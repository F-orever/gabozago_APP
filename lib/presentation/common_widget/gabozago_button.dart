import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GabozagoCTAButton extends StatelessWidget {
  const GabozagoCTAButton(this.text, {super.key, this.isDisabled = false});

  final String text;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.w),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: isDisabled ? const Color(0xFFD3D3D3) : const Color(0xFF5276FA),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white, height: 1.375),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
