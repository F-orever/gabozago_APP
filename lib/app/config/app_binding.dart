import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:gabozago/data/data_sources/remote/auth_api.dart';
import 'package:gabozago/data/repositories_impl/auth_repository_impl.dart';
import 'package:gabozago/domain/repositories/auth_repository.dart';
import 'package:gabozago/domain/usecases/auth_usecases.dart';

import '../network/builder/dio_builder.dart';
import '../service/auth_service.dart';
import 'app_const.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectNetworkProvider();
    injectRepositories();
    injectServices();
    injectUseCases();
  }

  void injectNetworkProvider() {
    // Dio
    Get.lazyPut(
      () => (DioBuilder(options: BaseOptions(baseUrl: AppConst.baseUrl))),
      fenix: true,
    );

    // API Endpoint
    Get.lazyPut(() => AuthAPI(Get.find<DioBuilder>()), fenix: true);
  }

  void injectRepositories() {
    Get.put<AuthRepository>(AuthRepositoryImpl());
  }

  void injectServices() {
    Get.put(AuthService());
  }

  void injectUseCases() {
    Get.put(AuthUseCases());
  }
}
