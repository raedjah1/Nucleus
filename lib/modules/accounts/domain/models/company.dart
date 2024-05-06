import 'package:equatable/equatable.dart';

class Company extends Equatable {
  const Company({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
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
