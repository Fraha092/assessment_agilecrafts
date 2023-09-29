import 'package:equatable/equatable.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../adapters/Todo_adapter.dart';
part 'TodoModel.g.dart';

@JsonSerializable()
@DataRepository([TodoAdapter])
class TodoModel extends DataModel<TodoModel>with EquatableMixin{
  @override
  final int? id;
  final int? tenantId;
  final String name;
  final String description;
  final bool isAvailable;

  TodoModel({
    this.id,
    this.tenantId,
    required this.name,
    required this.description,
    this.isAvailable=false,
});

  @override
  List<Object> get props{
    return [
      id ?? 0,tenantId ?? 0,name,description,isAvailable,
    ];
  }
  @override
  String toString() {
    return 'TodoModel(id: $id, tenantId: $tenantId, name: $name, description: $description, isAvailable: $isAvailable)';
  }
}