import 'package:nucleus/modules/accounts/domain/models/company.dart';
import 'package:nucleus/modules/accounts/domain/models/department.dart';
import 'package:nucleus/modules/accounts/domain/models/job_title.dart';
import 'package:nucleus/modules/accounts/domain/models/supervisor.dart';

class Account {
  final String id;
  final String staffId;
  final String name;
  final String email;
  final String photoUrl;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String gender;
  final String address;
  final Department department;
  final JobTitle jobTitle;
  final Company company;
  final Supervisor supervisor;

  Account({
    required this.id,
    required this.staffId,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.department,
    required this.jobTitle,
    required this.company,
    required this.supervisor,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      staffId: json['staffId'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      gender: json['gender'],
      address: json['address'],
      department: Department.fromJson(json['department']),
      jobTitle: JobTitle.fromJson(json['jobTitle']),
      company: Company.fromJson(json['company']),
      supervisor: Supervisor.fromJson(json['supervisor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staffId': staffId,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'address': address,
      'department': department.toJson(),
      'jobTitle': jobTitle.toJson(),
      'company': company.toJson(),
      'supervisor': supervisor.toJson(),
    };
  }
}
