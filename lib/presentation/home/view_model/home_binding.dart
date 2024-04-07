import 'package:get/get.dart';

import 'home_view_model.dart';
import 'recommend_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => RecommendViewModel(), fenix: true);
  }
}
