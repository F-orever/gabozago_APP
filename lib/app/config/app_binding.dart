import 'package:gabozago/app/service/auth_service.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectNetworkProvider();
    injectRepositories();
    injectServices();
    injectUseCases();
  }

  void injectNetworkProvider() {}

  void injectRepositories() {}

  void injectServices() {
    Get.put(AuthService());
  }

  void injectUseCases() {}
}
