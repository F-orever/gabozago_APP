import 'package:gabozago/presentation/login/view/login_view.dart';
import 'package:gabozago/presentation/login/view_model/login_binding.dart';
import 'package:get/route_manager.dart';

class Routes {
  static List<GetPage> getPages = [
    GetPage(
      name: '/login',
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
