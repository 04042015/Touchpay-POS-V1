import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Authentication Methods
  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      // TODO: Implement login logic with repository
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Mock user for now
      _currentUser = const User(
        id: '1',
        name: 'Admin User',
        email: 'admin@example.com',
        role: 'admin',
      );
      
      _isLoggedIn = true;
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Login failed: ${error.toString()}';
      _currentUser = null;
      _isLoggedIn = false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      // TODO: Implement logout logic with repository
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      _currentUser = null;
      _isLoggedIn = false;
      _errorMessage = null;
    } catch (error) {
      _errorMessage = 'Logout failed: ${error.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> checkAuthStatus() async {
    _setLoading(true);
    try {
      // TODO: Implement auth status check with repository
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      // For now, assume user is not logged in
      _isLoggedIn = false;
      _currentUser = null;
    } catch (error) {
      _errorMessage = 'Auth check failed: ${error.toString()}';
      _isLoggedIn = false;
      _currentUser = null;
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