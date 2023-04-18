import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginModelError {
  final int code;
  final String msg;
  LoginModelError({
    required this.code,
    required this.msg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
    };
  }

  factory LoginModelError.fromMap(Map<String, dynamic> map) {
    return LoginModelError(
      code: map['code'] as int,
      msg: map['msg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModelError.fromJson(String source) =>
      LoginModelError.fromMap(json.decode(source) as Map<String, dynamic>);
}
