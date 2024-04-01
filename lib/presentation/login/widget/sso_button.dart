import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SSOLoginButton extends StatelessWidget {
  const SSOLoginButton(
    this.text, {
    super.key,
    required this.iconPath,
    required this.backgroundColor,
    this.textColor = Colors.black,
    this.onTap,
  });

  final String text;
  final String iconPath;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(iconPath, width: 26.w, height: 26.w)),
            SizedBox(width: 4.w),
            Text(text, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: textColor, height: 1.3)),
          ],
        ),
      ),
    );
  }
}

class SSOLoginCircleButton extends StatelessWidget {
  const SSOLoginCircleButton({
    super.key,
    required this.backgroundColor,
    required this.iconPath,
    this.onTap,
    this.borderColor,
  });

  final Color backgroundColor;
  final Color? borderColor;
  final String iconPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          border: borderColor != null ? Border.all(color: borderColor!, width: 1.w) : null,
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(child: Image.asset(iconPath, width: 28.w, height: 28.w)),
      ),
    );
  }
}
