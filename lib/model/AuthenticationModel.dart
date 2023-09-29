import 'package:equatable/equatable.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AuthenticationModel.g.dart';

@JsonSerializable()
@DataRepository([])
class AuthenticationModel extends DataModel<AuthenticationModel> with EquatableMixin{

  final int userId;
  final String accessToken;
  final String encryptedAccessToken;
  final int expireInSeconds;
  final bool shouldResetPassword;
  final String refreshToken;
  final int refreshTokenExpireInSeconds;

  AuthenticationModel({
    required this.userId,
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.shouldResetPassword,
    required this.refreshToken,
    required this.refreshTokenExpireInSeconds,

});

  @override
  Object? get id => userId;

  @override
  List<Object> get props {
    return [
      userId,
      accessToken,
      encryptedAccessToken,
      expireInSeconds,
      shouldResetPassword,
      refreshToken,
      refreshTokenExpireInSeconds,
    ];
  }

}