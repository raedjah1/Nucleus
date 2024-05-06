import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  final bool biometricEnabled;
  final String verificationCode;

  const User({
    required this.token,
    required this.biometricEnabled,
    required this.verificationCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      biometricEnabled: json['biometricEnabled'],
      verificationCode: json['verificationCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'biometricEnabled': biometricEnabled,
      'verificationCode': verificationCode,
    };
  }

  @override
  List<Object> get props => [token, biometricEnabled, verificationCode];
}
