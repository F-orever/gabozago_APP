import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GabozagoTextField extends StatelessWidget {
  const GabozagoTextField({super.key, this.isDiabled = false, this.hintText, this.suffix});

  final bool isDiabled;
  final String? hintText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, height: 1.57),
      enabled: !isDiabled,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
        filled: isDiabled,
        fillColor: const Color(0xFFF9F9F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: Color(0xFF5276FA)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFFADADAD), height: 1.57),
        suffixIcon: suffix,
        suffixIconConstraints: BoxConstraints(maxHeight: 26.w),
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      scrollPadding: const EdgeInsets.only(bottom: 150),
    );
  }
}
