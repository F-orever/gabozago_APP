import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypeface {
  // 본문
  final TextStyle heading = TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w700, height: 1.3);
  final TextStyle subitle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, height: 1.08);
  final TextStyle body = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, height: 1.9);
  final TextStyle bodyHighlight = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, height: 1.9);

  // 스테이션 목록
  final TextStyle stationList1 = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, height: 1.3);
  final TextStyle stationList2 = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, height: 2.3);

  // 체크포인트
  final TextStyle checkPointHeading = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700);
  final TextStyle checkPointSubitle = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500);
  final TextStyle checkPointBody = TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400);

  // 인터뷰
  final TextStyle interviewName = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, height: 1.63);
  final TextStyle interviewJob = TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, height: 2.2);
  final TextStyle interviewDesc = TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, height: 2.2);

  // 장소
  final TextStyle placeName = TextStyle(fontSize: 17.55.sp, fontWeight: FontWeight.w700, height: 1.08);
  final TextStyle placeAddress = TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, height: 1.7);
  final TextStyle placeScrap = TextStyle(fontSize: 8.56.sp, fontWeight: FontWeight.w500);
  final TextStyle pictureDesc = TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, height: 2.8);

  // Misc
  final TextStyle closeList = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, height: 2.3);
}
