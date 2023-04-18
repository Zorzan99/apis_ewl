import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginSuccesModel {
  final String token;
  LoginSuccesModel({
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory LoginSuccesModel.fromMap(Map<String, dynamic> map) {
    return LoginSuccesModel(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginSuccesModel.fromJson(String source) =>
      LoginSuccesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
