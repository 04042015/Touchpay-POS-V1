class StorageKeys {
  // Authentication
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userInfo = 'user_info';
  static const String isLoggedIn = 'is_logged_in';
  static const String lastLoginDate = 'last_login_date';
  
  // User Settings
  static const String userRole = 'user_role';
  static const String userName = 'user_name';
  static const String userEmail = 'user_email';
  static const String userPreferences = 'user_preferences';
  
  // App Settings
  static const String themeMode = 'theme_mode';
  static const String language = 'language';
  static const String firstTimeUser = 'first_time_user';
  static const String appVersion = 'app_version';
  
  // Business Settings
  static const String restaurantInfo = 'restaurant_info';
  static const String taxRate = 'tax_rate';
  static const String currency = 'currency';
  static const String printerSettings = 'printer_settings';
  static const String receiptTemplate = 'receipt_template';
  
  // Data Storage
  static const String menuItems = 'menu_items';
  static const String categories = 'categories';
  static const String tables = 'tables';
  static const String orders = 'orders';
  static const String transactions = 'transactions';
  
  // Cache Keys
  static const String lastSyncDate = 'last_sync_date';
  static const String offlineData = 'offline_data';
  static const String pendingSync = 'pending_sync';
  static const String cacheExpiry = 'cache_expiry';
  
  // Backup & Restore
  static const String backupData = 'backup_data';
  static const String lastBackupDate = 'last_backup_date';
  static const String autoBackupEnabled = 'auto_backup_enabled';
  
  // Analytics & Reporting
  static const String salesHistory = 'sales_history';
  static const String popularItems = 'popular_items';
  static const String reportFilters = 'report_filters';
  
  // App State
  static const String activeOrder = 'active_order';
  static const String selectedTable = 'selected_table';
  static const String cartItems = 'cart_items';
  static const String lastUsedSettings = 'last_used_settings';
}