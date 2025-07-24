import 'package:equatable/equatable.dart';
import 'order_item.dart';

class Order extends Equatable {
  final String id;
  final String orderNumber;
  final String? tableId;
  final String? customerId;
  final String status;
  final List<OrderItem> items;
  final double subtotal;
  final double taxAmount;
  final double discountAmount;
  final double totalAmount;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String createdBy;

  const Order({
    required this.id,
    required this.orderNumber,
    this.tableId,
    this.customerId,
    required this.status,
    required this.items,
    required this.subtotal,
    required this.taxAmount,
    required this.discountAmount,
    required this.totalAmount,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
        id,
        orderNumber,
        tableId,
        customerId,
        status,
        items,
        subtotal,
        taxAmount,
        discountAmount,
        totalAmount,
        notes,
        createdAt,
        updatedAt,
        createdBy,
      ];

  @override
  String toString() {
    return 'Order(id: $id, orderNumber: $orderNumber, total: $totalAmount)';
  }
}