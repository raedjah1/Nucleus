import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String staffId;
  final String token;
  final bool biometricEnabled;
  final String verificationCode;

  const User({
    required this.staffId,
    required this.token,
    required this.biometricEnabled,
    required this.verificationCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      staffId: json['staffId'],
      token: json['token'],
      biometricEnabled: json['biometricEnabled'],
      verificationCode: json['verificationCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'staffId': staffId,
      'token': token,
      'biometricEnabled': biometricEnabled,
      'verificationCode': verificationCode,
    };
  }

  @override
  List<Object> get props =>
      [staffId, token, biometricEnabled, verificationCode];
}
