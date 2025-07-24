import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String categoryId;
  final String? image;
  final bool isAvailable;
  final int stockQuantity;
  final String? sku;
  final List<String> tags;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    this.image,
    this.isAvailable = true,
    this.stockQuantity = 0,
    this.sku,
    this.tags = const [],
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        categoryId,
        image,
        isAvailable,
        stockQuantity,
        sku,
        tags,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'MenuItem(id: $id, name: $name, price: $price)';
  }
}