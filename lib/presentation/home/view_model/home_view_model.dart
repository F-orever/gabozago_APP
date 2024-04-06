import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gabozago/app/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final List<Tab> tabs = [const Tab(text: '추천'), const Tab(text: '큐레이팅'), const Tab(text: '후기')];
  final List<Widget> tabBarViews = [const Placeholder(), Container(), const Placeholder()];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
