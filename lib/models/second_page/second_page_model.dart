import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class SecondPageModel {
  final int balance;
  final int blockedBalance;
  SecondPageModel({
    required this.balance,
    required this.blockedBalance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'balance': balance,
      'blockedBalance': blockedBalance,
    };
  }

  factory SecondPageModel.fromMap(Map<String, dynamic> map) {
    return SecondPageModel(
      balance: map['balance'] as int,
      blockedBalance: map['blockedBalance'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SecondPageModel.fromJson(String source) =>
      SecondPageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
