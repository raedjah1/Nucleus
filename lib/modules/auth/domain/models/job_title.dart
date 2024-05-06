import 'package:equatable/equatable.dart';

class JobTitle extends Equatable {
  final String id;
  final String name;

  const JobTitle({
    required this.id,
    required this.name,
  });

  factory JobTitle.fromJson(Map<String, dynamic> json) {
    return JobTitle(
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
