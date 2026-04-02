import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../models/cart_item_model.dart';
import '../data/static_data.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  bool _isLoading = false;

  List<OrderModel> get orders => _orders;
  bool get isLoading => _isLoading;

  OrderProvider() {
    loadOrders();
  }

  Future<void> loadOrders() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));
    _orders = List.from(StaticData.orders);
    
    _isLoading = false;
    notifyListeners();
  }

  Future<OrderModel> createOrder(List<CartItemModel> items, double total, {String? notes}) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    final order = OrderModel(
      id: 'order_${DateTime.now().millisecondsSinceEpoch}',
      userId: 'user1',
      items: items,
      totalAmount: total,
      status: 'pending',
      createdAt: DateTime.now(),
      notes: notes,
    );

    _orders.insert(0, order);
    StaticData.orders.insert(0, order);
    
    _isLoading = false;
    notifyListeners();
    return order;
  }

  void updateOrderStatus(String id, String status) {
    final index = _orders.indexWhere((o) => o.id == id);
    if (index != -1) {
      _orders[index] = _orders[index].copyWith(status: status);
      notifyListeners();
    }
  }
}