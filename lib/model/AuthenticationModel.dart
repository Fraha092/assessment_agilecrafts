import 'package:equatable/equatable.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../adapters/Authentication_adapter.dart';
import 'TodoModel.dart';
part 'AuthenticationModel.g.dart';

@JsonSerializable()
@DataRepository([])
class AuthenticationModel extends DataModel<AuthenticationModel> with EquatableMixin{

  final String accessToken;
  final String encryptedAccessToken;
  final int expireInSeconds;
  final bool shouldResetPassword;
  final int userId;
  final String refreshToken;
  final int refreshTokenExpireInSeconds;
  late final HasMany<TodoModel> todoModels;

  AuthenticationModel({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.shouldResetPassword,
    required this.userId,
    required this.refreshToken,
    required this.refreshTokenExpireInSeconds,
   HasMany<TodoModel>? todoModels,

}): todoModels= todoModels ?? HasMany();

  @override
  Object? get id => userId;

  @override
  List<Object> get props {
    return [
      accessToken,
      encryptedAccessToken,
      expireInSeconds,
      shouldResetPassword,
      userId,
      refreshToken,
      refreshTokenExpireInSeconds,
    ];
  }

}

//flutter pub run build_runner watch
