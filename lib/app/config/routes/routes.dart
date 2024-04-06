import 'package:gabozago/app/config/routes/route_path.dart';
import 'package:gabozago/presentation/login/view/login_view.dart';
import 'package:gabozago/presentation/login/view/register_view.dart';
import 'package:gabozago/presentation/login/view/term_view.dart';
import 'package:gabozago/presentation/login/view_model/login_binding.dart';
import 'package:gabozago/presentation/main/view/main_view.dart';
import 'package:gabozago/presentation/main/view_model/main_binding.dart';
import 'package:get/route_manager.dart';

class Routes {
  static List<GetPage> getPages = [
    // Authentication
    GetPage(
      name: RoutePath.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutePath.register,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: RoutePath.term,
      page: () => const TermPage(),
    ),

    // Main
    GetPage(
      name: RoutePath.main,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
  ];
}
