import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gabozago/app/enums/term_type.dart';
import 'package:gabozago/presentation/common_widget/gabozago_appbar.dart';
import 'package:get/get.dart';

class TermPage extends StatelessWidget {
  const TermPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TermType termType = Get.arguments;

    return Scaffold(
      appBar: GabozagoAppBar(termType.termName, hasBack: true),
      body: FutureBuilder(
        future: rootBundle.loadString("assets/term/${termType.fileName}.md"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data,
              padding: EdgeInsets.all(24.w),
              physics: const ClampingScrollPhysics(),
              styleSheet: MarkdownStyleSheet(
                strong: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.black),
                p: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: const Color(0xFF727272), height: 1.69),
                listBullet: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: const Color(0xFF727272), height: 1.69),
                listBulletPadding: EdgeInsets.zero,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
