import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  final ThemeData appTheme = ThemeData(
    fontFamily: 'Pretendard',
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0, scrolledUnderElevation: 0),
    colorSchemeSeed: AppColor.main,
    scaffoldBackgroundColor: Colors.white,
  );
}
