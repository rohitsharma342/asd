import '../models/menu_item_model.dart';
import '../models/order_model.dart';

class StaticData {
  static final List<String> categories = [
    'All',
    'Appetizers',
    'Main Course',
    'Desserts',
    'Beverages',
    'Salads',
  ];

  static final List<MenuItemModel> menuItems = [
    MenuItemModel(
      id: '1',
      name: 'Grilled Salmon',
      description: 'Fresh Atlantic salmon with herbs',
      price: 24.99,
      category: 'Main Course',
      imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: '2',
      name: 'Caesar Salad',
      description: 'Classic Caesar with parmesan',
      price: 12.99,
      category: 'Salads',
      imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1',
      isAvailable: true,
      isTrending: false,
    ),
    MenuItemModel(
      id: '3',
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with molten center',
      price: 8.99,
      category: 'Desserts',
      imageUrl: 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51',
      isAvailable: true,
      isTrending: true,
    ),
  ];

  static final List<OrderModel> orders = [];
}
