import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (email == 'test@test.com' && password == 'password123') {
      _user = UserModel(
        id: 'user1',
        name: 'John Doe',
        email: email,
        profileImage: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200',
        isStaff: false,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } else if (email == 'staff@test.com' && password == 'password123') {
      _user = UserModel(
        id: 'staff1',
        name: 'Staff Member',
        email: email,
        profileImage: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
        isStaff: true,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _errorMessage = 'Invalid email or password';
    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> signup(String name, String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _user = UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
    );
    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> updateProfile(String name, String email) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    if (_user != null) {
      _user = _user!.copyWith(name: name, email: email);
    }
    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}