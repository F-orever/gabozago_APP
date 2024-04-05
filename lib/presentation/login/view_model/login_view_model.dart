import 'package:gabozago/app/enums/oauth_type.dart';
import 'package:gabozago/app/service/auth_service.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  Future<void> login(OAuthType oAuthType) async {
    await AuthService.to.login(oAuthType);
  }
}
