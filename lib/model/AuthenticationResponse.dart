import 'package:equatable/equatable.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../adapters/Authentication_adapter.dart';
import 'AuthenticationModel.dart';
part 'AuthenticationResponse.g.dart';

@JsonSerializable()
@DataRepository([AuthenticationAdapter])
class AuthenticationResponse extends DataModel<AuthenticationResponse> with EquatableMixin{
  final BelongsTo<AuthenticationModel> result;
  @JsonKey(name: "__abp")
  final bool abp;
  AuthenticationResponse({
    required this.result,
    required this.abp,
});

  @override
  Object? get id => result.id;


  @override
  List<Object> get props{
    return [
      result,abp,
    ];
  }
}

