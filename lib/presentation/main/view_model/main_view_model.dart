import 'package:flutter/material.dart';
import 'package:gabozago/presentation/home/view/home_view.dart';
import 'package:get/get.dart';

import 'package:gabozago/app/base/base_view_model.dart';

class MainViewModel extends BaseViewModel {
  final List<Widget> pages = [
    const HomeView(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  final RxInt _currentIdx = 0.obs;
  int get currentIdx => _currentIdx.value;

  void setPage(int index) {
    _currentIdx(index);
  }
}
