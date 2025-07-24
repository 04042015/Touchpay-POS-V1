class AppRoutes {
  // Authentication Routes
  static const String splash = '/';
  static const String login = '/login';
  static const String setup = '/setup';

  // Main App Routes
  static const String dashboard = '/dashboard';
  static const String pos = '/pos';

  // Menu Management Routes
  static const String menuManagement = '/menu-management';
  static const String addMenuItem = '/add-menu-item';
  static const String editMenuItem = '/edit-menu-item';

  // Category Management Routes
  static const String categoryManagement = '/category-management';
  static const String addCategory = '/add-category';
  static const String editCategory = '/edit-category';

  // Table Management Routes
  static const String tableManagement = '/table-management';
  static const String addTable = '/add-table';
  static const String editTable = '/edit-table';

  // Order Management Routes
  static const String orderManagement = '/order-management';
  static const String createOrder = '/create-order';
  static const String orderDetail = '/order-detail';
  static const String editOrder = '/edit-order';

  // Transaction Routes
  static const String transactionHistory = '/transaction-history';
  static const String payment = '/payment';
  static const String receipt = '/receipt';

  // Report Routes
  static const String reports = '/reports';
  static const String salesReport = '/sales-report';
  static const String inventoryReport = '/inventory-report';

  // Settings Routes
  static const String settings = '/settings';
  static const String restaurantInfo = '/restaurant-info';
  static const String userManagement = '/user-management';
  static const String taxSettings = '/tax-settings';
  static const String printerSettings = '/printer-settings';

  // Utility Routes
  static const String profile = '/profile';
  static const String about = '/about';
  static const String help = '/help';

  // Error Routes
  static const String notFound = '/not-found';
  static const String error = '/error';
}