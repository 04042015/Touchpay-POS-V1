class ApiEndpoints {
  // Base URL - update this when backend is ready
  static const String baseUrl = 'https://api.possystem.com/v1';
  
  // Auth Endpoints
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String verifyToken = '/auth/verify';
  
  // User Endpoints
  static const String users = '/users';
  static const String userProfile = '/users/profile';
  static const String updateProfile = '/users/profile';
  
  // Menu Endpoints
  static const String menuItems = '/menu-items';
  static const String menuItem = '/menu-items/{id}';
  static const String menuCategories = '/categories';
  static const String category = '/categories/{id}';
  
  // Order Endpoints
  static const String orders = '/orders';
  static const String order = '/orders/{id}';
  static const String orderItems = '/orders/{id}/items';
  
  // Transaction Endpoints
  static const String transactions = '/transactions';
  static const String transaction = '/transactions/{id}';
  static const String transactionHistory = '/transactions/history';
  
  // Table Endpoints
  static const String tables = '/tables';
  static const String table = '/tables/{id}';
  static const String tableStatus = '/tables/{id}/status';
  
  // Report Endpoints
  static const String salesReport = '/reports/sales';
  static const String inventoryReport = '/reports/inventory';
  static const String popularItems = '/reports/popular-items';
  
  // Settings Endpoints
  static const String settings = '/settings';
  static const String taxSettings = '/settings/tax';
  static const String printerSettings = '/settings/printer';
  
  // File Upload
  static const String uploadImage = '/upload/image';
  static const String uploadReceipt = '/upload/receipt';
  
  // Sync Endpoints (for offline-first approach)
  static const String syncData = '/sync';
  static const String syncStatus = '/sync/status';
  
  // Health Check
  static const String health = '/health';
}