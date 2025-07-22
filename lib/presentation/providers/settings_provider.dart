import 'package:flutter/material.dart';
import '../../domain/entities/settings.dart';

class SettingsProvider extends ChangeNotifier {
  RestaurantSettings _settings = const RestaurantSettings(
    id: '1',
    restaurantName: 'Restoran Sederhana',
    address: 'Jl. Contoh No. 123, Jakarta',
    phone: '021-12345678',
    email: 'info@restoransederhana.com',
    taxRate: 0.10,
    currency: 'IDR',
    receiptFooter: 'Terima kasih atas kunjungan Anda',
    printerName: '',
    printerEnabled: false,
    autoBackup: true,
    backupInterval: 24,
  );
  
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  RestaurantSettings get settings => _settings;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Load settings
  Future<void> loadSettings() async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // In real app, load from local storage or API
      // For now, we keep the default settings
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to load settings: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update restaurant info
  Future<void> updateRestaurantInfo({
    required String name,
    required String address,
    required String phone,
    required String email,
  }) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      _settings = RestaurantSettings(
        id: _settings.id,
        restaurantName: name,
        address: address,
        phone: phone,
        email: email,
        taxRate: _settings.taxRate,
        currency: _settings.currency,
        receiptFooter: _settings.receiptFooter,
        printerName: _settings.printerName,
        printerEnabled: _settings.printerEnabled,
        autoBackup: _settings.autoBackup,
        backupInterval: _settings.backupInterval,
        updatedAt: DateTime.now(),
      );
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update restaurant info: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update tax rate
  Future<void> updateTaxRate(double taxRate) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      _settings = RestaurantSettings(
        id: _settings.id,
        restaurantName: _settings.restaurantName,
        address: _settings.address,
        phone: _settings.phone,
        email: _settings.email,
        taxRate: taxRate,
        currency: _settings.currency,
        receiptFooter: _settings.receiptFooter,
        printerName: _settings.printerName,
        printerEnabled: _settings.printerEnabled,
        autoBackup: _settings.autoBackup,
        backupInterval: _settings.backupInterval,
        updatedAt: DateTime.now(),
      );
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update tax rate: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update receipt settings
  Future<void> updateReceiptSettings({
    required String receiptFooter,
  }) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      _settings = RestaurantSettings(
        id: _settings.id,
        restaurantName: _settings.restaurantName,
        address: _settings.address,
        phone: _settings.phone,
        email: _settings.email,
        taxRate: _settings.taxRate,
        currency: _settings.currency,
        receiptFooter: receiptFooter,
        printerName: _settings.printerName,
        printerEnabled: _settings.printerEnabled,
        autoBackup: _settings.autoBackup,
        backupInterval: _settings.backupInterval,
        updatedAt: DateTime.now(),
      );
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update receipt settings: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update printer settings
  Future<void> updatePrinterSettings({
    required String printerName,
    required bool printerEnabled,
  }) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      _settings = RestaurantSettings(
        id: _settings.id,
        restaurantName: _settings.restaurantName,
        address: _settings.address,
        phone: _settings.phone,
        email: _settings.email,
        taxRate: _settings.taxRate,
        currency: _settings.currency,
        receiptFooter: _settings.receiptFooter,
        printerName: printerName,
        printerEnabled: printerEnabled,
        autoBackup: _settings.autoBackup,
        backupInterval: _settings.backupInterval,
        updatedAt: DateTime.now(),
      );
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update printer settings: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update backup settings
  Future<void> updateBackupSettings({
    required bool autoBackup,
    required int backupInterval,
  }) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      _settings = RestaurantSettings(
        id: _settings.id,
        restaurantName: _settings.restaurantName,
        address: _settings.address,
        phone: _settings.phone,
        email: _settings.email,
        taxRate: _settings.taxRate,
        currency: _settings.currency,
        receiptFooter: _settings.receiptFooter,
        printerName: _settings.printerName,
        printerEnabled: _settings.printerEnabled,
        autoBackup: autoBackup,
        backupInterval: backupInterval,
        updatedAt: DateTime.now(),
      );
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update backup settings: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Export data
  Future<String?> exportData() async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      
      // In real app, this would generate actual export data
      final exportData = {
        'restaurant': _settings.toJson(),
        'exportDate': DateTime.now().toIso8601String(),
        'version': '1.0.0',
      };
      
      _errorMessage = null;
      return exportData.toString();
    } catch (error) {
      _errorMessage = 'Failed to export data: ${error.toString()}';
      return null;
    } finally {
      _setLoading(false);
    }
  }

  // Import data
  Future<bool> importData(String data) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      
      // In real app, this would parse and import actual data
      // For now, just simulate success
      
      _errorMessage = null;
      return true;
    } catch (error) {
      _errorMessage = 'Failed to import data: ${error.toString()}';
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Reset to default settings
  Future<void> resetToDefaults() async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      _settings = const RestaurantSettings(
        id: '1',
        restaurantName: 'Restoran Sederhana',
        address: 'Jl. Contoh No. 123, Jakarta',
        phone: '021-12345678',
        email: 'info@restoransederhana.com',
        taxRate: 0.10,
        currency: 'IDR',
        receiptFooter: 'Terima kasih atas kunjungan Anda',
        printerName: '',
        printerEnabled: false,
        autoBackup: true,
        backupInterval: 24,
        updatedAt: null,
      );
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to reset settings: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}