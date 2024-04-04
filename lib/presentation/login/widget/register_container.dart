import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDCDCDC)),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: child,
    );
  }
}
