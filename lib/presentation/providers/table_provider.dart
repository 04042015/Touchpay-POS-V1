import 'package:flutter/material.dart';
import '../../domain/entities/table.dart';

class TableProvider extends ChangeNotifier {
  List<RestaurantTable> _tables = [];
  RestaurantTable? _selectedTable;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<RestaurantTable> get tables => _tables;
  RestaurantTable? get selectedTable => _selectedTable;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Get tables by status
  List<RestaurantTable> getTablesByStatus(String status) {
    return _tables.where((table) => table.status == status).toList();
  }

  // Load tables
  Future<void> loadTables() async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // Sample tables data
      _tables = [
        const RestaurantTable(
          id: '1',
          number: 1,
          capacity: 4,
          status: 'available',
          location: 'Indoor',
          isActive: true,
        ),
        const RestaurantTable(
          id: '2',
          number: 2,
          capacity: 2,
          status: 'occupied',
          location: 'Indoor',
          isActive: true,
        ),
        const RestaurantTable(
          id: '3',
          number: 3,
          capacity: 6,
          status: 'available',
          location: 'Outdoor',
          isActive: true,
        ),
        const RestaurantTable(
          id: '4',
          number: 4,
          capacity: 4,
          status: 'reserved',
          location: 'Indoor',
          isActive: true,
        ),
        const RestaurantTable(
          id: '5',
          number: 5,
          capacity: 8,
          status: 'available',
          location: 'VIP',
          isActive: true,
        ),
        const RestaurantTable(
          id: '6',
          number: 6,
          capacity: 2,
          status: 'occupied',
          location: 'Indoor',
          isActive: true,
        ),
        const RestaurantTable(
          id: '7',
          number: 7,
          capacity: 4,
          status: 'available',
          location: 'Outdoor',
          isActive: true,
        ),
        const RestaurantTable(
          id: '8',
          number: 8,
          capacity: 6,
          status: 'available',
          location: 'Indoor',
          isActive: true,
        ),
      ];
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to load tables: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Add new table
  Future<void> addTable(RestaurantTable table) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Check if table number already exists
      final existingTable = _tables.any((t) => t.number == table.number);
      if (existingTable) {
        _errorMessage = 'Table number ${table.number} already exists';
        return;
      }
      
      _tables.add(table);
      _tables.sort((a, b) => a.number.compareTo(b.number));
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to add table: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update table
  Future<void> updateTable(RestaurantTable table) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final index = _tables.indexWhere((t) => t.id == table.id);
      if (index != -1) {
        // Check if table number conflicts with another table
        final conflictingTable = _tables.any((t) => 
          t.id != table.id && t.number == table.number);
        if (conflictingTable) {
          _errorMessage = 'Table number ${table.number} already exists';
          return;
        }
        
        _tables[index] = table;
        _tables.sort((a, b) => a.number.compareTo(b.number));
      }
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update table: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Delete table
  Future<void> deleteTable(String id) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final table = _tables.firstWhere((t) => t.id == id);
      if (table.status == 'occupied') {
        _errorMessage = 'Cannot delete occupied table';
        return;
      }
      
      _tables.removeWhere((t) => t.id == id);
      if (_selectedTable?.id == id) {
        _selectedTable = null;
      }
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to delete table: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update table status
  Future<void> updateTableStatus(String id, String newStatus) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final index = _tables.indexWhere((t) => t.id == id);
      if (index != -1) {
        final table = _tables[index];
        _tables[index] = RestaurantTable(
          id: table.id,
          number: table.number,
          capacity: table.capacity,
          status: newStatus,
          location: table.location,
          description: table.description,
          isActive: table.isActive,
          createdAt: table.createdAt,
          updatedAt: DateTime.now(),
        );
      }
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update table status: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Select table
  void selectTable(RestaurantTable? table) {
    _selectedTable = table;
    notifyListeners();
  }

  // Occupy table
  Future<void> occupyTable(String id) async {
    await updateTableStatus(id, 'occupied');
  }

  // Free table
  Future<void> freeTable(String id) async {
    await updateTableStatus(id, 'available');
  }

  // Reserve table
  Future<void> reserveTable(String id) async {
    await updateTableStatus(id, 'reserved');
  }

  // Get available tables
  List<RestaurantTable> get availableTables {
    return _tables.where((table) => table.status == 'available').toList();
  }

  // Get occupied tables
  List<RestaurantTable> get occupiedTables {
    return _tables.where((table) => table.status == 'occupied').toList();
  }

  // Get reserved tables
  List<RestaurantTable> get reservedTables {
    return _tables.where((table) => table.status == 'reserved').toList();
  }

  // Get table by ID
  RestaurantTable? getTableById(String id) {
    try {
      return _tables.firstWhere((table) => table.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get table by number
  RestaurantTable? getTableByNumber(int number) {
    try {
      return _tables.firstWhere((table) => table.number == number);
    } catch (e) {
      return null;
    }
  }

  // Search tables
  List<RestaurantTable> searchTables(String query) {
    if (query.isEmpty) return _tables;
    
    final lowerQuery = query.toLowerCase();
    return _tables.where((table) => 
      table.number.toString().contains(query) ||
      table.location.toLowerCase().contains(lowerQuery) ||
      table.status.toLowerCase().contains(lowerQuery)
    ).toList();
  }

  // Get tables count by status
  Map<String, int> getTablesCountByStatus() {
    final Map<String, int> counts = {
      'available': 0,
      'occupied': 0,
      'reserved': 0,
    };
    
    for (final table in _tables) {
      if (counts.containsKey(table.status)) {
        counts[table.status] = counts[table.status]! + 1;
      }
    }
    
    return counts;
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