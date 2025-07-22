import 'package:flutter/material.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/order.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = [];
  Transaction? _currentTransaction;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<Transaction> get transactions => _transactions;
  Transaction? get currentTransaction => _currentTransaction;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Load transactions
  Future<void> loadTransactions() async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // Sample transactions data
      _transactions = [
        Transaction(
          id: '1',
          transactionNumber: 'TXN-001',
          orderId: '1',
          amount: 49500,
          paymentMethod: 'cash',
          status: 'completed',
          paidAmount: 50000,
          changeAmount: 500,
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          createdBy: '1',
        ),
        Transaction(
          id: '2',
          transactionNumber: 'TXN-002',
          orderId: '2',
          amount: 33000,
          paymentMethod: 'card',
          status: 'completed',
          paidAmount: 33000,
          changeAmount: 0,
          createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
          createdBy: '1',
        ),
        Transaction(
          id: '3',
          transactionNumber: 'TXN-003',
          orderId: '3',
          amount: 75000,
          paymentMethod: 'digital',
          status: 'pending',
          paidAmount: 0,
          changeAmount: 0,
          createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
          createdBy: '1',
        ),
      ];
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to load transactions: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Process payment
  Future<Transaction?> processPayment({
    required Order order,
    required String paymentMethod,
    required double paidAmount,
    required String createdBy,
    String? notes,
  }) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      
      final changeAmount = paidAmount >= order.totalAmount 
          ? paidAmount - order.totalAmount 
          : 0;
      
      if (paidAmount < order.totalAmount && paymentMethod == 'cash') {
        _errorMessage = 'Insufficient payment amount';
        return null;
      }
      
      final transactionNumber = 'TXN-${DateTime.now().millisecondsSinceEpoch}';
      final transaction = Transaction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        transactionNumber: transactionNumber,
        orderId: order.id,
        amount: order.totalAmount,
        paymentMethod: paymentMethod,
        status: 'completed',
        paidAmount: paidAmount,
        changeAmount: changeAmount,
        notes: notes,
        createdAt: DateTime.now(),
        createdBy: createdBy,
      );
      
      _transactions.insert(0, transaction);
      _currentTransaction = transaction;
      _errorMessage = null;
      
      return transaction;
    } catch (error) {
      _errorMessage = 'Payment processing failed: ${error.toString()}';
      return null;
    } finally {
      _setLoading(false);
    }
  }

  // Cancel transaction
  Future<void> cancelTransaction(String transactionId) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final index = _transactions.indexWhere((t) => t.id == transactionId);
      if (index != -1) {
        final transaction = _transactions[index];
        _transactions[index] = Transaction(
          id: transaction.id,
          transactionNumber: transaction.transactionNumber,
          orderId: transaction.orderId,
          amount: transaction.amount,
          paymentMethod: transaction.paymentMethod,
          status: 'cancelled',
          paidAmount: transaction.paidAmount,
          changeAmount: transaction.changeAmount,
          notes: transaction.notes,
          createdAt: transaction.createdAt,
          updatedAt: DateTime.now(),
          createdBy: transaction.createdBy,
        );
      }
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to cancel transaction: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Refund transaction
  Future<void> refundTransaction(String transactionId, double refundAmount) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final index = _transactions.indexWhere((t) => t.id == transactionId);
      if (index != -1) {
        final transaction = _transactions[index];
        
        if (refundAmount > transaction.amount) {
          _errorMessage = 'Refund amount cannot exceed transaction amount';
          return;
        }
        
        _transactions[index] = Transaction(
          id: transaction.id,
          transactionNumber: transaction.transactionNumber,
          orderId: transaction.orderId,
          amount: transaction.amount,
          paymentMethod: transaction.paymentMethod,
          status: refundAmount == transaction.amount ? 'refunded' : 'partial_refund',
          paidAmount: transaction.paidAmount,
          changeAmount: transaction.changeAmount,
          refundAmount: refundAmount,
          notes: transaction.notes,
          createdAt: transaction.createdAt,
          updatedAt: DateTime.now(),
          createdBy: transaction.createdBy,
        );
      }
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to process refund: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Get transactions by date range
  List<Transaction> getTransactionsByDateRange(DateTime startDate, DateTime endDate) {
    return _transactions.where((transaction) {
      final transactionDate = transaction.createdAt;
      return transactionDate.isAfter(startDate.subtract(const Duration(days: 1))) &&
             transactionDate.isBefore(endDate.add(const Duration(days: 1)));
    }).toList();
  }

  // Get transactions by payment method
  List<Transaction> getTransactionsByPaymentMethod(String paymentMethod) {
    return _transactions.where((t) => t.paymentMethod == paymentMethod).toList();
  }

  // Get transactions by status
  List<Transaction> getTransactionsByStatus(String status) {
    return _transactions.where((t) => t.status == status).toList();
  }

  // Get transaction by ID
  Transaction? getTransactionById(String id) {
    try {
      return _transactions.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get daily sales summary
  Map<String, dynamic> getDailySalesSummary(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    
    final dailyTransactions = _transactions.where((t) =>
      t.createdAt.isAfter(startOfDay) && 
      t.createdAt.isBefore(endOfDay) &&
      t.status == 'completed'
    ).toList();
    
    final totalSales = dailyTransactions.fold<double>(
      0.0, (sum, t) => sum + t.amount);
    
    final totalTransactions = dailyTransactions.length;
    
    final paymentMethodBreakdown = <String, double>{};
    for (final transaction in dailyTransactions) {
      paymentMethodBreakdown[transaction.paymentMethod] = 
        (paymentMethodBreakdown[transaction.paymentMethod] ?? 0) + transaction.amount;
    }
    
    return {
      'date': date,
      'totalSales': totalSales,
      'totalTransactions': totalTransactions,
      'averageTransaction': totalTransactions > 0 ? totalSales / totalTransactions : 0,
      'paymentMethodBreakdown': paymentMethodBreakdown,
      'transactions': dailyTransactions,
    };
  }

  // Get monthly sales summary
  Map<String, dynamic> getMonthlySalesSummary(int year, int month) {
    final startOfMonth = DateTime(year, month, 1);
    final endOfMonth = DateTime(year, month + 1, 1);
    
    final monthlyTransactions = _transactions.where((t) =>
      t.createdAt.isAfter(startOfMonth.subtract(const Duration(days: 1))) && 
      t.createdAt.isBefore(endOfMonth) &&
      t.status == 'completed'
    ).toList();
    
    final totalSales = monthlyTransactions.fold<double>(
      0.0, (sum, t) => sum + t.amount);
    
    return {
      'year': year,
      'month': month,
      'totalSales': totalSales,
      'totalTransactions': monthlyTransactions.length,
      'transactions': monthlyTransactions,
    };
  }

  // Search transactions
  List<Transaction> searchTransactions(String query) {
    if (query.isEmpty) return _transactions;
    
    final lowerQuery = query.toLowerCase();
    return _transactions.where((transaction) => 
      transaction.transactionNumber.toLowerCase().contains(lowerQuery) ||
      transaction.paymentMethod.toLowerCase().contains(lowerQuery) ||
      transaction.status.toLowerCase().contains(lowerQuery)
    ).toList();
  }

  // Clear current transaction
  void clearCurrentTransaction() {
    _currentTransaction = null;
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