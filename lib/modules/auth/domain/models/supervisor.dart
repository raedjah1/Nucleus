import 'package:equatable/equatable.dart';

class Supervisor extends Equatable {
  final String id;
  final String staffId;
  final String name;

  const Supervisor({
    required this.id,
    required this.staffId,
    required this.name,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      id: json['id'],
      staffId: json['staffId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staffId': staffId,
      'name': name,
    };
  }

  @override
  List<Object> get props => [id, staffId, name];
}
