// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationResponse.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $AuthenticationResponseLocalAdapter
    on LocalAdapter<AuthenticationResponse> {
  static final Map<String, RelationshipMeta>
      _kAuthenticationResponseRelationshipMetas = {
    'result': RelationshipMeta<AuthenticationModel>(
      name: 'result',
      type: 'authenticationModels',
      kind: 'BelongsTo',
      instance: (_) => (_ as AuthenticationResponse).result,
    )
  };

  @override
  Map<String, RelationshipMeta> get relationshipMetas =>
      _kAuthenticationResponseRelationshipMetas;

  @override
  AuthenticationResponse deserialize(map) {
    map = transformDeserialize(map);
    return _$AuthenticationResponseFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model, {bool withRelationships = true}) {
    final map = _$AuthenticationResponseToJson(model);
    return transformSerialize(map, withRelationships: withRelationships);
  }
}

final _authenticationResponsesFinders = <String, dynamic>{};

// ignore: must_be_immutable
class $AuthenticationResponseHiveLocalAdapter = HiveLocalAdapter<
    AuthenticationResponse> with $AuthenticationResponseLocalAdapter;

class $AuthenticationResponseRemoteAdapter = RemoteAdapter<
    AuthenticationResponse> with AuthenticationAdapter<AuthenticationResponse>;

final internalAuthenticationResponsesRemoteAdapterProvider =
    Provider<RemoteAdapter<AuthenticationResponse>>((ref) =>
        $AuthenticationResponseRemoteAdapter(
            $AuthenticationResponseHiveLocalAdapter(ref),
            InternalHolder(_authenticationResponsesFinders)));

final authenticationResponsesRepositoryProvider =
    Provider<Repository<AuthenticationResponse>>(
        (ref) => Repository<AuthenticationResponse>(ref));

extension AuthenticationResponseDataRepositoryX
    on Repository<AuthenticationResponse> {
  AuthenticationAdapter<AuthenticationResponse> get authenticationAdapter =>
      remoteAdapter as AuthenticationAdapter<AuthenticationResponse>;
}

extension AuthenticationResponseRelationshipGraphNodeX
    on RelationshipGraphNode<AuthenticationResponse> {
  RelationshipGraphNode<AuthenticationModel> get result {
    final meta = $AuthenticationResponseLocalAdapter
            ._kAuthenticationResponseRelationshipMetas['result']
        as RelationshipMeta<AuthenticationModel>;
    return meta.clone(
        parent: this is RelationshipMeta ? this as RelationshipMeta : null);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      result: BelongsTo<AuthenticationModel>.fromJson(
          json['result'] as Map<String, dynamic>),
      abp: json['__abp'] as bool,
    );

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      '__abp': instance.abp,
    };
