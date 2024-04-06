import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'package:gabozago/domain/entities/token_response.dart';

import '../../models/token_response_model.dart';
import 'auth_mappr.auto_mappr.dart';

@AutoMappr([
  MapType<TokenResponseModel, TokenResponse>(),
])
class AuthMappr extends $AuthMappr {}
