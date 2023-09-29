// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationModel.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $AuthenticationModelLocalAdapter on LocalAdapter<AuthenticationModel> {
  static final Map<String, RelationshipMeta>
      _kAuthenticationModelRelationshipMetas = {};

  @override
  Map<String, RelationshipMeta> get relationshipMetas =>
      _kAuthenticationModelRelationshipMetas;

  @override
  AuthenticationModel deserialize(map) {
    map = transformDeserialize(map);
    return _$AuthenticationModelFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model, {bool withRelationships = true}) {
    final map = _$AuthenticationModelToJson(model);
    return transformSerialize(map, withRelationships: withRelationships);
  }
}

final _authenticationModelsFinders = <String, dynamic>{};

// ignore: must_be_immutable
class $AuthenticationModelHiveLocalAdapter = HiveLocalAdapter<
    AuthenticationModel> with $AuthenticationModelLocalAdapter;

class $AuthenticationModelRemoteAdapter = RemoteAdapter<AuthenticationModel>
    with NothingMixin;

final internalAuthenticationModelsRemoteAdapterProvider =
    Provider<RemoteAdapter<AuthenticationModel>>((ref) =>
        $AuthenticationModelRemoteAdapter(
            $AuthenticationModelHiveLocalAdapter(ref),
            InternalHolder(_authenticationModelsFinders)));

final authenticationModelsRepositoryProvider =
    Provider<Repository<AuthenticationModel>>(
        (ref) => Repository<AuthenticationModel>(ref));

extension AuthenticationModelDataRepositoryX
    on Repository<AuthenticationModel> {}

extension AuthenticationModelRelationshipGraphNodeX
    on RelationshipGraphNode<AuthenticationModel> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      userId: json['userId'] as int,
      accessToken: json['accessToken'] as String,
      encryptedAccessToken: json['encryptedAccessToken'] as String,
      expireInSeconds: json['expireInSeconds'] as int,
      shouldResetPassword: json['shouldResetPassword'] as bool,
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpireInSeconds: json['refreshTokenExpireInSeconds'] as int,
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        AuthenticationModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accessToken': instance.accessToken,
      'encryptedAccessToken': instance.encryptedAccessToken,
      'expireInSeconds': instance.expireInSeconds,
      'shouldResetPassword': instance.shouldResetPassword,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpireInSeconds': instance.refreshTokenExpireInSeconds,
    };
