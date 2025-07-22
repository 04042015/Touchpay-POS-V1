import 'package:equatable/equatable.dart';

class RestaurantSettings extends Equatable {
  final String id;
  final String restaurantName;
  final String address;
  final String phone;
  final String email;
  final double taxRate;
  final String currency;
  final String receiptFooter;
  final String printerName;
  final bool printerEnabled;
  final bool autoBackup;
  final int backupInterval; // hours
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RestaurantSettings({
    required this.id,
    required this.restaurantName,
    required this.address,
    required this.phone,
    required this.email,
    required this.taxRate,
    required this.currency,
    required this.receiptFooter,
    required this.printerName,
    required this.printerEnabled,
    required this.autoBackup,
    required this.backupInterval,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurantName': restaurantName,
      'address': address,
      'phone': phone,
      'email': email,
      'taxRate': taxRate,
      'currency': currency,
      'receiptFooter': receiptFooter,
      'printerName': printerName,
      'printerEnabled': printerEnabled,
      'autoBackup': autoBackup,
      'backupInterval': backupInterval,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        restaurantName,
        address,
        phone,
        email,
        taxRate,
        currency,
        receiptFooter,
        printerName,
        printerEnabled,
        autoBackup,
        backupInterval,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'RestaurantSettings(id: $id, name: $restaurantName)';
  }
}