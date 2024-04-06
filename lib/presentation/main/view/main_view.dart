import 'package:flutter/material.dart';

import 'package:gabozago/app/base/base_view.dart';
import 'package:get/get.dart';

import '../view_model/main_view_model.dart';
import '../widget/main_bottom_navbar.dart';

class MainView extends BaseView<MainViewModel> {
  const MainView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Obx(() => vm.pages[vm.currentIdx]),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
