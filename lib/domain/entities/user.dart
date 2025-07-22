import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? phone;
  final String? avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isActive;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phone,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        role,
        phone,
        avatar,
        createdAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, role: $role)';
  }
}