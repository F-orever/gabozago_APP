import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gabozago/app/config/app_binding.dart';
import 'package:gabozago/app/config/app_theme.dart';
import 'package:gabozago/app/config/routes/route_path.dart';
import 'package:gabozago/app/config/routes/routes.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: AppTheme().appTheme,
          builder: (context, child) {
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: child!);
          },
          initialBinding: AppBinding(),
          initialRoute: RoutePath.login,
          getPages: Routes.getPages,
        );
      },
    );
  }
}
