import 'package:gabozago/presentation/home/view_model/home_binding.dart';
import 'package:get/get.dart';

import 'main_view_model.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewModel(), fenix: true);
    HomeBinding().dependencies();
  }
}
