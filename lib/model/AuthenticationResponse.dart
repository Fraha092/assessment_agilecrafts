import 'package:equatable/equatable.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../adapters/Authentication_adapter.dart';
import '../adapters/Todo_adapter.dart';
import 'AuthenticationModel.dart';
part 'AuthenticationResponse.g.dart';

@JsonSerializable()
@DataRepository([AuthenticationAdapter])
class AuthenticationResponse extends DataModel<AuthenticationResponse> with EquatableMixin{
  final BelongsTo<AuthenticationModel> result;
  // final String? targetUrl;
  // @JsonKey(name: "success")
  // final bool success;
  // final String? error;
  // @JsonKey(name: "unAuthorizedRequest")
  // final bool unAuthorizedRequest;
  @JsonKey(name: "__abp")
  final bool abp;
  AuthenticationResponse({
    required this.result,
    // required this.targetUrl,
    // required this.success,
    // required this.error,
    // required this.unAuthorizedRequest,
    required this.abp,
});

  @override
  Object? get id => result.id;


  @override
  List<Object?> get props{
    return [
      result,
      // targetUrl,
      // success,
      // error,
      // unAuthorizedRequest,
      abp,
    ];
  }
}

