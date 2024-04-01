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

  void injectServices() {}

  void injectUseCases() {}
}
