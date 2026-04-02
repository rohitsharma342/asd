import 'package:flutter/material.dart';
import '../models/menu_item_model.dart';
import '../data/static_data.dart';

class MenuProvider with ChangeNotifier {
  List<MenuItemModel> _menuItems = [];
  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _isLoading = false;

  List<MenuItemModel> get menuItems {
    List<MenuItemModel> filtered = _menuItems;
    
    if (_selectedCategory != 'All') {
      filtered = filtered.where((item) => item.category == _selectedCategory).toList();
    }
    
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((item) =>
        item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        item.description.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    
    return filtered;
  }

  List<MenuItemModel> get trendingItems =>
    _menuItems.where((item) => item.isTrending).toList();

  List<String> get categories => StaticData.categories;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;

  MenuProvider() {
    loadMenuItems();
  }

  Future<void> loadMenuItems() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));
    _menuItems = List.from(StaticData.menuItems);
    
    _isLoading = false;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addMenuItem(MenuItemModel item) {
    _menuItems.add(item);
    StaticData.menuItems.add(item);
    notifyListeners();
  }

  void updateMenuItem(MenuItemModel item) {
    final index = _menuItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _menuItems[index] = item;
      final staticIndex = StaticData.menuItems.indexWhere((i) => i.id == item.id);
      if (staticIndex != -1) {
        StaticData.menuItems[staticIndex] = item;
      }
      notifyListeners();
    }
  }

  void deleteMenuItem(String id) {
    _menuItems.removeWhere((item) => item.id == id);
    StaticData.menuItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
