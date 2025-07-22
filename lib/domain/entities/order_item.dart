import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String id;
  final String menuItemId;
  final String menuItemName;
  final double unitPrice;
  final int quantity;
  final double totalPrice;
  final String? notes;
  final List<String> modifiers;

  const OrderItem({
    required this.id,
    required this.menuItemId,
    required this.menuItemName,
    required this.unitPrice,
    required this.quantity,
    required this.totalPrice,
    this.notes,
    this.modifiers = const [],
  });

  @override
  List<Object?> get props => [
        id,
        menuItemId,
        menuItemName,
        unitPrice,
        quantity,
        totalPrice,
        notes,
        modifiers,
      ];

  @override
  String toString() {
    return 'OrderItem(id: $id, name: $menuItemName, qty: $quantity)';
  }
}