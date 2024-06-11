import 'package:nucleus/modules/accounts/domain/models/company.dart';
import 'package:nucleus/modules/accounts/domain/models/department.dart';
import 'package:nucleus/modules/accounts/domain/models/job_title.dart';


class Account {
  final String id;
  final String staffId;
  final String name;
  final String email;
  final String photoUrl;
  final String gender;
  final String department;
  final String jobTitle;
  final String company;

  Account({
    required this.id,
    required this.staffId,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.gender,
    required this.department,
    required this.jobTitle,
    required this.company,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      staffId: json['staffId'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      gender: json['gender'],
      department: json['department'],
      jobTitle: json['jobTitle'],
      company:json['company'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staffId': staffId,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'gender': gender,
      'department': department,
      'jobTitle': jobTitle,
      'company': company,
    };
  }
}
