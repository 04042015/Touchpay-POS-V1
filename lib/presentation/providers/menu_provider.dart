import 'package:flutter/material.dart';
import '../../domain/entities/menu_item.dart';
import '../../domain/entities/category.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuItem> _menuItems = [];
  List<Category> _categories = [];
  bool _isLoading = false;
  String? _errorMessage;
  MenuItem? _selectedMenuItem;

  // Getters
  List<MenuItem> get menuItems => _menuItems;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  MenuItem? get selectedMenuItem => _selectedMenuItem;

  // Get menu items by category
  List<MenuItem> getMenuItemsByCategory(String categoryId) {
    return _menuItems.where((item) => item.categoryId == categoryId).toList();
  }

  // Initialize with sample data
  Future<void> loadMenuItems() async {
    _setLoading(true);
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Sample categories
      _categories = [
        const Category(
          id: '1',
          name: 'Makanan Utama',
          description: 'Menu makanan utama',
          image: null,
          isActive: true,
          sortOrder: 1,
        ),
        const Category(
          id: '2', 
          name: 'Minuman',
          description: 'Menu minuman segar',
          image: null,
          isActive: true,
          sortOrder: 2,
        ),
        const Category(
          id: '3',
          name: 'Cemilan',
          description: 'Cemilan dan snack',
          image: null,
          isActive: true,
          sortOrder: 3,
        ),
      ];

      // Sample menu items
      _menuItems = [
        const MenuItem(
          id: '1',
          name: 'Nasi Goreng Spesial',
          description: 'Nasi goreng dengan telur, ayam, dan sayuran',
          price: 25000,
          categoryId: '1',
          isAvailable: true,
          stockQuantity: 50,
        ),
        const MenuItem(
          id: '2',
          name: 'Mie Ayam',
          description: 'Mie ayam dengan pangsit dan bakso',
          price: 20000,
          categoryId: '1',
          isAvailable: true,
          stockQuantity: 30,
        ),
        const MenuItem(
          id: '3',
          name: 'Gado-gado',
          description: 'Salad sayuran dengan bumbu kacang',
          price: 18000,
          categoryId: '1',
          isAvailable: true,
          stockQuantity: 25,
        ),
        const MenuItem(
          id: '4',
          name: 'Es Teh Manis',
          description: 'Teh manis dingin segar',
          price: 5000,
          categoryId: '2',
          isAvailable: true,
          stockQuantity: 100,
        ),
        const MenuItem(
          id: '5',
          name: 'Jus Jeruk',
          description: 'Jus jeruk segar tanpa gula',
          price: 12000,
          categoryId: '2',
          isAvailable: true,
          stockQuantity: 40,
        ),
        const MenuItem(
          id: '6',
          name: 'Kopi Hitam',
          description: 'Kopi hitam tubruk tradisional',
          price: 8000,
          categoryId: '2',
          isAvailable: true,
          stockQuantity: 60,
        ),
        const MenuItem(
          id: '7',
          name: 'Keripik Singkong',
          description: 'Keripik singkong renyah',
          price: 10000,
          categoryId: '3',
          isAvailable: true,
          stockQuantity: 35,
        ),
        const MenuItem(
          id: '8',
          name: 'Pisang Goreng',
          description: 'Pisang goreng crispy',
          price: 15000,
          categoryId: '3',
          isAvailable: true,
          stockQuantity: 20,
        ),
      ];

      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to load menu items: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Add new menu item
  Future<void> addMenuItem(MenuItem menuItem) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _menuItems.add(menuItem);
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to add menu item: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update menu item
  Future<void> updateMenuItem(MenuItem menuItem) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final index = _menuItems.indexWhere((item) => item.id == menuItem.id);
      if (index != -1) {
        _menuItems[index] = menuItem;
      }
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update menu item: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Delete menu item
  Future<void> deleteMenuItem(String id) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _menuItems.removeWhere((item) => item.id == id);
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to delete menu item: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Add new category
  Future<void> addCategory(Category category) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _categories.add(category);
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to add category: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Update category
  Future<void> updateCategory(Category category) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final index = _categories.indexWhere((cat) => cat.id == category.id);
      if (index != -1) {
        _categories[index] = category;
      }
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to update category: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Delete category
  Future<void> deleteCategory(String id) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _categories.removeWhere((cat) => cat.id == id);
      // Also remove menu items in this category
      _menuItems.removeWhere((item) => item.categoryId == id);
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to delete category: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Select menu item
  void selectMenuItem(MenuItem? menuItem) {
    _selectedMenuItem = menuItem;
    notifyListeners();
  }

  // Search menu items
  List<MenuItem> searchMenuItems(String query) {
    if (query.isEmpty) return _menuItems;
    return _menuItems.where((item) => 
      item.name.toLowerCase().contains(query.toLowerCase()) ||
      item.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Get category by ID
  Category? getCategoryById(String id) {
    try {
      return _categories.firstWhere((cat) => cat.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get menu item by ID
  MenuItem? getMenuItemById(String id) {
    try {
      return _menuItems.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
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