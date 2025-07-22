class AppConstants {
  // App Information
  static const String appName = 'POS System';
  static const String appVersion = '1.0.0';
  
  // Database Constants
  static const String dbName = 'pos_system_db';
  static const int dbVersion = 1;
  
  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double cardBorderRadius = 8.0;
  
  // Grid Layouts
  static const int menuGridCrossAxisCount = 4;
  static const int tableGridCrossAxisCount = 6;
  static const double gridAspectRatio = 1.2;
  
  // Business Constants
  static const double defaultTaxRate = 0.10;
  static const String defaultCurrency = 'IDR';
  static const String currencySymbol = 'Rp';
  
  // Receipt Settings
  static const int receiptWidth = 58; // mm
  static const String receiptHeader = 'STRUK PEMBELIAN';
  
  // User Roles
  static const String adminRole = 'admin';
  static const String cashierRole = 'cashier';
  
  // Order Status
  static const String orderStatusPending = 'pending';
  static const String orderStatusCompleted = 'completed';
  static const String orderStatusCancelled = 'cancelled';
  
  // Payment Methods
  static const String paymentCash = 'cash';
  static const String paymentCard = 'card';
  static const String paymentDigital = 'digital';
}