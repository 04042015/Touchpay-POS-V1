import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  Category? _selectedCategory;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<Category> get categories => _categories;
  Category? get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Load categories
  Future<void> loadCategories() async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // Sample categories data
      _categories = [
        const Category(
          id: '1',
          name: 'Makanan Utama',
          description: 'Menu makanan utama seperti nasi, mie, dan hidangan berkuah',
          sortOrder: 1,
          isActive: true,
          createdAt: null,
        ),
        const Category(
          id: '2',
          name: 'Minuman',
          description: 'Berbagai minuman segar, kopi, teh, dan jus',
          sortOrder: 2,
          isActive: true,
          createdAt: null,
        ),
        const Category(
          id: '3',
          name: 'Cemilan',
          description: 'Aneka cemilan dan makanan ringan',
          sortOrder: 3,
          isActive: true,
          createdAt: null,
        ),
        const Category(
          id: '4',
          name: 'Dessert',
          description: 'Makanan penutup dan pencuci mulut',
          sortOrder: 4,
          isActive: true,
          createdAt: null,
        ),
      ];
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to load categories: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Add new category
  Future<void> addCategory(Category category) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Check if category name already exists
      final existingCategory = _categories.any((c) => 
        c.name.toLowerCase() == category.name.toLowerCase());
      if (existingCategory) {
        _errorMessage = 'Category "${category.name}" already exists';
        return;
      }
      
      _categories.add(category);
      _categories.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
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
      
      final index = _categories.indexWhere((c) => c.id == category.id);
      if (index != -1) {
        // Check if category name conflicts with another category
        final conflictingCategory = _categories.any((c) => 
          c.id != category.id && 
          c.name.toLowerCase() == category.name.toLowerCase());
        if (conflictingCategory) {
          _errorMessage = 'Category "${category.name}" already exists';
          return;
        }
        
        _categories[index] = category;
        _categories.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
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
      
      _categories.removeWhere((c) => c.id == id);
      if (_selectedCategory?.id == id) {
        _selectedCategory = null;
      }
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to delete category: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Select category
  void selectCategory(Category? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Get active categories
  List<Category> get activeCategories {
    return _categories.where((category) => category.isActive).toList();
  }

  // Get category by ID
  Category? getCategoryById(String id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search categories
  List<Category> searchCategories(String query) {
    if (query.isEmpty) return _categories;
    
    final lowerQuery = query.toLowerCase();
    return _categories.where((category) => 
      category.name.toLowerCase().contains(lowerQuery) ||
      category.description.toLowerCase().contains(lowerQuery)
    ).toList();
  }

  // Reorder categories
  Future<void> reorderCategories(int oldIndex, int newIndex) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      
      final category = _categories.removeAt(oldIndex);
      _categories.insert(newIndex, category);
      
      // Update sort orders
      for (int i = 0; i < _categories.length; i++) {
        final updatedCategory = Category(
          id: _categories[i].id,
          name: _categories[i].name,
          description: _categories[i].description,
          image: _categories[i].image,
          isActive: _categories[i].isActive,
          sortOrder: i + 1,
          createdAt: _categories[i].createdAt,
          updatedAt: DateTime.now(),
        );
        _categories[i] = updatedCategory;
      }
      
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to reorder categories: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  // Toggle category active status
  Future<void> toggleCategoryStatus(String id) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      final index = _categories.indexWhere((c) => c.id == id);
      if (index != -1) {
        final category = _categories[index];
        _categories[index] = Category(
          id: category.id,
          name: category.name,
          description: category.description,
          image: category.image,
          isActive: !category.isActive,
          sortOrder: category.sortOrder,
          createdAt: category.createdAt,
          updatedAt: DateTime.now(),
        );
      }
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Failed to toggle category status: ${error.toString()}';
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