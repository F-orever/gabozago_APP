import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterCheckBox extends StatelessWidget {
  const RegisterCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    required this.subText,
    this.isBold = false,
    this.isRequired = true,
    this.hasUnderline = false,
    this.onTap,
  });

  final bool value;
  final void Function(bool?) onChanged;

  final String text;
  final String subText;
  final bool isBold;
  final bool isRequired;
  final bool hasUnderline;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
          height: 20.w,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            side: const BorderSide(color: Color(0xFFDCDCDC)),
            activeColor: const Color(0xFF5276FA),
          ),
        ),
        SizedBox(width: 14.w),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              height: 1.57,
              decoration: hasUnderline ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          subText,
          style: TextStyle(
            fontSize: 12.sp,
            color: isRequired ? const Color(0xFF4061DB) : const Color(0xFFADADAD),
            fontWeight: FontWeight.w400,
            height: 1.83,
          ),
        ),
      ],
    );
  }
}
