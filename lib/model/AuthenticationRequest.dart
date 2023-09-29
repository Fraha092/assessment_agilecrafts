import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationRequest extends Equatable{
  final String userNameOrEmailAddress;
  final String password;

  AuthenticationRequest({
    required this.userNameOrEmailAddress,
    required this.password,
});
  AuthenticationRequest copyWith({
    String? userNameOrEmailAddress,
    String? password,
}){
    return AuthenticationRequest(
      userNameOrEmailAddress: userNameOrEmailAddress ?? this.userNameOrEmailAddress,
      password: password ?? this.password,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userNameOrEmailAddress': userNameOrEmailAddress,
      'password': password,
    };
  }

  factory AuthenticationRequest.fromMap(Map<String, dynamic> map) {
    return AuthenticationRequest(
      userNameOrEmailAddress: map['userNameOrEmailAddress'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationRequest.fromJson(String source) =>
      AuthenticationRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthBody(userNameOrEmailAddress: $userNameOrEmailAddress, password: $password)';

  @override
  List<Object> get props => [userNameOrEmailAddress, password];


}