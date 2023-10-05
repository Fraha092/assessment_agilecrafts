// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoModel.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $TodoModelLocalAdapter on LocalAdapter<TodoModel> {
  static final Map<String, RelationshipMeta> _kTodoModelRelationshipMetas = {
    'user': RelationshipMeta<AuthenticationModel>(
      name: 'user',
      inverseName: 'todoModels',
      type: 'authenticationModels',
      kind: 'BelongsTo',
      instance: (_) => (_ as TodoModel).user,
    )
  };

  @override
  Map<String, RelationshipMeta> get relationshipMetas =>
      _kTodoModelRelationshipMetas;

  @override
  TodoModel deserialize(map) {
    map = transformDeserialize(map);
    return _$TodoModelFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model, {bool withRelationships = true}) {
    final map = _$TodoModelToJson(model);
    return transformSerialize(map, withRelationships: withRelationships);
  }
}

final _todoModelsFinders = <String, dynamic>{};

// ignore: must_be_immutable
class $TodoModelHiveLocalAdapter = HiveLocalAdapter<TodoModel>
    with $TodoModelLocalAdapter;

class $TodoModelRemoteAdapter = RemoteAdapter<TodoModel>
    with TodoAdapter<TodoModel>;

final internalTodoModelsRemoteAdapterProvider =
    Provider<RemoteAdapter<TodoModel>>((ref) => $TodoModelRemoteAdapter(
        $TodoModelHiveLocalAdapter(ref), InternalHolder(_todoModelsFinders)));

final todoModelsRepositoryProvider =
    Provider<Repository<TodoModel>>((ref) => Repository<TodoModel>(ref));

extension TodoModelDataRepositoryX on Repository<TodoModel> {
  TodoAdapter<TodoModel> get todoAdapter =>
      remoteAdapter as TodoAdapter<TodoModel>;
}

extension TodoModelRelationshipGraphNodeX on RelationshipGraphNode<TodoModel> {
  RelationshipGraphNode<AuthenticationModel> get user {
    final meta = $TodoModelLocalAdapter._kTodoModelRelationshipMetas['user']
        as RelationshipMeta<AuthenticationModel>;
    return meta.clone(
        parent: this is RelationshipMeta ? this as RelationshipMeta : null);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as int?,
      tenantId: json['tenantId'] as int?,
      name: json['name'] as String,
      description: json['description'] as String,
      isAvailable: json['isAvailable'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : BelongsTo<AuthenticationModel>.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'description': instance.description,
      'isAvailable': instance.isAvailable,
      'user': instance.user,
    };
