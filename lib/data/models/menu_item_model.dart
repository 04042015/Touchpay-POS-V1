import '../../domain/entities/menu_item.dart';

class MenuItemModel extends MenuItem {
  const MenuItemModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required String categoryId,
    String? image,
    bool isAvailable = true,
    int stockQuantity = 0,
    String? sku,
    List<String> tags = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          categoryId: categoryId,
          image: image,
          isAvailable: isAvailable,
          stockQuantity: stockQuantity,
          sku: sku,
          tags: tags,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      categoryId: json['category_id'] as String,
      image: json['image'] as String?,
      isAvailable: json['is_available'] as bool? ?? true,
      stockQuantity: json['stock_quantity'] as int? ?? 0,
      sku: json['sku'] as String?,
      tags: List<String>.from(json['tags'] ?? []),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category_id': categoryId,
      'image': image,
      'is_available': isAvailable,
      'stock_quantity': stockQuantity,
      'sku': sku,
      'tags': tags,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
