// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationModel.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $AuthenticationModelLocalAdapter on LocalAdapter<AuthenticationModel> {
  static final Map<String, RelationshipMeta>
      _kAuthenticationModelRelationshipMetas = {
    'todoModels': RelationshipMeta<TodoModel>(
      name: 'todoModels',
      inverseName: 'user',
      type: 'todoModels',
      kind: 'HasMany',
      instance: (_) => (_ as AuthenticationModel).todoModels,
    )
  };

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
    on RelationshipGraphNode<AuthenticationModel> {
  RelationshipGraphNode<TodoModel> get todoModels {
    final meta = $AuthenticationModelLocalAdapter
            ._kAuthenticationModelRelationshipMetas['todoModels']
        as RelationshipMeta<TodoModel>;
    return meta.clone(
        parent: this is RelationshipMeta ? this as RelationshipMeta : null);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      accessToken: json['accessToken'] as String,
      encryptedAccessToken: json['encryptedAccessToken'] as String,
      expireInSeconds: json['expireInSeconds'] as int,
      shouldResetPassword: json['shouldResetPassword'] as bool,
      userId: json['userId'] as int,
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpireInSeconds: json['refreshTokenExpireInSeconds'] as int,
      todoModels: json['todoModels'] == null
          ? null
          : HasMany<TodoModel>.fromJson(
              json['todoModels'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        AuthenticationModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'encryptedAccessToken': instance.encryptedAccessToken,
      'expireInSeconds': instance.expireInSeconds,
      'shouldResetPassword': instance.shouldResetPassword,
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpireInSeconds': instance.refreshTokenExpireInSeconds,
      'todoModels': instance.todoModels,
    };
