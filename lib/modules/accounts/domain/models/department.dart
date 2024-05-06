import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String id;
  final String name;

  const Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object> get props => [id, name];
}
