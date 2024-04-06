import 'package:gabozago/app/base/base_ui_event.dart';
import 'package:gabozago/app/base/base_view_model.dart';
import 'package:gabozago/app/enums/oauth_type.dart';
import 'package:gabozago/app/service/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  Future<void> login(OAuthProvider oAuthType) async {
    addUiEvent(const ShowProgressIndicator());

    try {
      await AuthService.to.loginWithOAuth(oAuthType);
      await AuthService.to.login();
    } catch (e) {
      addUiEvent(const ShowToast('로그인에 실패했습니다. 다시 시도해주세요.'));
    } finally {
      addUiEvent(const CloseDialog());
    }
  }
}
