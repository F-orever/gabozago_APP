import 'package:gabozago/app/base/base_view_model.dart';
import 'package:gabozago/app/enums/oauth_type.dart';
import 'package:gabozago/app/service/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  Future<void> login(OAuthType oAuthType) async {
    await AuthService.to.login(oAuthType);
  }
}
