import '../models/menu_item_model.dart';
import '../models/order_model.dart';

class StaticData {
  static List<String> categories = [
    'All',
    'Appetizers',
    'Main Course',
    'Desserts',
    'Beverages',
    'Specials',
  ];

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      id: '1',
      name: 'Classic Burger',
      description: 'Juicy beef patty with fresh vegetables',
      price: 12.99,
      category: 'Main Course',
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: '2',
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with Caesar dressing',
      price: 8.99,
      category: 'Appetizers',
      imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1',
      isAvailable: true,
      isTrending: false,
    ),
    MenuItemModel(
      id: '3',
      name: 'Chocolate Cake',
      description: 'Rich chocolate layer cake',
      price: 6.99,
      category: 'Desserts',
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: '4',
      name: 'Fresh Lemonade',
      description: 'Homemade lemonade with mint',
      price: 3.99,
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1523677011781-c91d1bbe2f9c',
      isAvailable: true,
      isTrending: false,
    ),
  ];

  static List<OrderModel> orders = [];
}
