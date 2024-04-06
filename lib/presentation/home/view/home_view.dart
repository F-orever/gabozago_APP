import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gabozago/app/base/base_view.dart';

import '../view_model/home_view_model.dart';
import '../widget/home_appbar.dart';

class HomeView extends BaseView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: _BuildTabBarView(),
    );
  }
}

class _BuildTabBarView extends StatefulWidget {
  const _BuildTabBarView();

  @override
  State<_BuildTabBarView> createState() => __BuildTabBarViewState();
}

class __BuildTabBarViewState extends State<_BuildTabBarView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final HomeViewModel vm = Get.find<HomeViewModel>();

    return TabBarView(controller: vm.tabController, children: vm.tabBarViews);
  }

  @override
  bool get wantKeepAlive => true;
}
