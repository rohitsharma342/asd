import '../models/menu_item_model.dart';
import '../models/order_model.dart';

class StaticData {
  static List<String> categories = [
    'All',
    'Appetizers',
    'Main Course',
    'Desserts',
    'Beverages',
    'Salads',
  ];

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      id: '1',
      name: 'Classic Burger',
      description: 'Juicy beef patty with fresh vegetables',
      price: 12.99,
      category: 'Main Course',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: '2',
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with parmesan',
      price: 8.99,
      category: 'Salads',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: false,
    ),
    MenuItemModel(
      id: '3',
      name: 'Chocolate Cake',
      description: 'Rich chocolate cake with ganache',
      price: 6.99,
      category: 'Desserts',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: true,
    ),
  ];

  static List<OrderModel> orders = [];
}
