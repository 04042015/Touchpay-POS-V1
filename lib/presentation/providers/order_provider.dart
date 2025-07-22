import 'package:flutter/material.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/menu_item.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];
  Order? _currentOrder;
  List<OrderItem> _currentOrderItems = [];
  bool _isLoading = false;
  String? _errorMessage;
  double _taxRate = 0.10; // 10% tax

  // Getters
  List<Order> get orders => _orders;
  Order? get currentOrder => _currentOrder;
  List<OrderItem> get currentOrderItems => _currentOrderItems;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  double get taxRate => _taxRate;

  // Calculate totals for current order
  double get subtotal {
    return _currentOrderItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double get taxAmount {
    return subtotal * _taxRate;
  }

  double get totalAmount {
    return subtotal + taxAmount;
  }

  int get totalItemsInCart {
    return _currentOrderItems.fold(0, (sum, item) => sum + item.quantity);
  }

  // Load orders
  Future<void> loadOrders() async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // Sample orders data
      _orders = [
        Order(
          id: '1',
          orderNumber: 'ORDER-001',
          tableId: '1',
          status: 'completed',
          items: const [],
          subtotal: 45000,
          taxAmount: 4500,
          discountAmount: 0,
          totalAmount: 49500,
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          createdBy: '1',
        ),
        Order(
          id: '2',
          orderNumber: 'ORDER-002',
          tableId: '2',
          status: 'pending',
          items: const [],
          subtotal: 30000,
          taxAmount: 3000,
          discountAmount: 0,
          totalAmount: 33000,
          createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
          createdBy: '1',
        ),
      ];
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to load orders: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Start new order
  void startNewOrder({String? tableId, String? customerId}) {
    _currentOrder = null;
    _currentOrderItems.clear();
    notifyListeners();
  }

  // Add item to current order
  void addItemToOrder(MenuItem menuItem, {int quantity = 1, String? notes}) {
    // Check if item already exists in order
    final existingItemIndex = _currentOrderItems.indexWhere(
      (item) => item.menuItemId == menuItem.id
    );

    if (existingItemIndex != -1) {
      // Update existing item quantity
      final existingItem = _currentOrderItems[existingItemIndex];
      final newQuantity = existingItem.quantity + quantity;
      final newTotalPrice = newQuantity * menuItem.price;
      
      _currentOrderItems[existingItemIndex] = OrderItem(
        id: existingItem.id,
        menuItemId: menuItem.id,
        menuItemName: menuItem.name,
        unitPrice: menuItem.price,
        quantity: newQuantity,
        totalPrice: newTotalPrice,
        notes: notes ?? existingItem.notes,
      );
    } else {
      // Add new item
      final orderItem = OrderItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        menuItemId: menuItem.id,
        menuItemName: menuItem.name,
        unitPrice: menuItem.price,
        quantity: quantity,
        totalPrice: quantity * menuItem.price,
        notes: notes,
      );
      
      _currentOrderItems.add(orderItem);
    }
    
    notifyListeners();
  }

  // Remove item from current order
  void removeItemFromOrder(String orderItemId) {
    _currentOrderItems.removeWhere((item) => item.id == orderItemId);
    notifyListeners();
  }

  // Update item quantity
  void updateItemQuantity(String orderItemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItemFromOrder(orderItemId);
      return;
    }

    final itemIndex = _currentOrderItems.indexWhere((item) => item.id == orderItemId);
    if (itemIndex != -1) {
      final item = _currentOrderItems[itemIndex];
      final newTotalPrice = newQuantity * item.unitPrice;
      
      _currentOrderItems[itemIndex] = OrderItem(
        id: item.id,
        menuItemId: item.menuItemId,
        menuItemName: item.menuItemName,
        unitPrice: item.unitPrice,
        quantity: newQuantity,
        totalPrice: newTotalPrice,
        notes: item.notes,
      );
      
      notifyListeners();
    }
  }

  // Clear current order
  void clearCurrentOrder() {
    _currentOrderItems.clear();
    _currentOrder = null;
    notifyListeners();
  }

  // Save order
  Future<void> saveOrder({
    String? tableId,
    String? customerId,
    String? notes,
    required String createdBy,
  }) async {
    if (_currentOrderItems.isEmpty) {
      _errorMessage = 'Cannot save empty order';
      notifyListeners();
      return;
    }

    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      final orderNumber = 'ORDER-${DateTime.now().millisecondsSinceEpoch}';
      final newOrder = Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        orderNumber: orderNumber,
        tableId: tableId,
        customerId: customerId,
        status: 'pending',
        items: List.from(_currentOrderItems),
        subtotal: subtotal,
        taxAmount: taxAmount,
        discountAmount: 0,
        totalAmount: totalAmount,
        notes: notes,
        createdAt: DateTime.now(),
        createdBy: createdBy,
      );
      
      _orders.insert(0, newOrder);
      _currentOrder = newOrder;
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to save order: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update order status
  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final orderIndex = _orders.indexWhere((order) => order.id == orderId);
      if (orderIndex != -1) {
        final order = _orders[orderIndex];
        _orders[orderIndex] = Order(
          id: order.id,
          orderNumber: order.orderNumber,
          tableId: order.tableId,
          customerId: order.customerId,
          status: newStatus,
          items: order.items,
          subtotal: order.subtotal,
          taxAmount: order.taxAmount,
          discountAmount: order.discountAmount,
          totalAmount: order.totalAmount,
          notes: order.notes,
          createdAt: order.createdAt,
          updatedAt: DateTime.now(),
          createdBy: order.createdBy,
        );
      }
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update order status: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Cancel order
  Future<void> cancelOrder(String orderId) async {
    await updateOrderStatus(orderId, 'cancelled');
  }

  // Complete order
  Future<void> completeOrder(String orderId) async {
    await updateOrderStatus(orderId, 'completed');
  }

  // Get orders by status
  List<Order> getOrdersByStatus(String status) {
    return _orders.where((order) => order.status == status).toList();
  }

  // Get orders by table
  List<Order> getOrdersByTable(String tableId) {
    return _orders.where((order) => order.tableId == tableId).toList();
  }

  // Get order by ID
  Order? getOrderById(String id) {
    try {
      return _orders.firstWhere((order) => order.id == id);
    } catch (e) {
      return null;
    }
  }

  // Set tax rate
  void setTaxRate(double rate) {
    _taxRate = rate;
    notifyListeners();
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