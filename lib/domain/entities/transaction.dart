import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final String transactionNumber;
  final String orderId;
  final double amount;
  final String paymentMethod; // cash, card, digital
  final String status; // completed, pending, cancelled, refunded, partial_refund
  final double paidAmount;
  final double changeAmount;
  final double refundAmount;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String createdBy;

  const Transaction({
    required this.id,
    required this.transactionNumber,
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
    required this.status,
    required this.paidAmount,
    required this.changeAmount,
    this.refundAmount = 0,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
        id,
        transactionNumber,
        orderId,
        amount,
        paymentMethod,
        status,
        paidAmount,
        changeAmount,
        refundAmount,
        notes,
        createdAt,
        updatedAt,
        createdBy,
      ];

  @override
  String toString() {
    return 'Transaction(id: $id, number: $transactionNumber, amount: $amount)';
  }
}