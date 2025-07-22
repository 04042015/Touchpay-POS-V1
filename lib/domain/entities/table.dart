import 'package:equatable/equatable.dart';

class RestaurantTable extends Equatable {
  final String id;
  final int number;
  final int capacity;
  final String status; // available, occupied, reserved
  final String location;
  final String? description;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RestaurantTable({
    required this.id,
    required this.number,
    required this.capacity,
    required this.status,
    required this.location,
    this.description,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        capacity,
        status,
        location,
        description,
        isActive,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'RestaurantTable(id: $id, number: $number, status: $status)';
  }
}