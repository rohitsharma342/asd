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
    'Soups'
  ];

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      id: '1',
      name: 'Margherita Pizza',
      description: 'Classic pizza with tomato sauce, mozzarella, and basil',
      price: 12.99,
      category: 'Main Course',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: '2',
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with caesar dressing and croutons',
      price: 8.99,
      category: 'Salads',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: false,
    ),
    MenuItemModel(
      id: '3',
      name: 'Chocolate Cake',
      description: 'Rich chocolate cake with chocolate frosting',
      price: 6.99,
      category: 'Desserts',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: true,
    ),
  ];

  static List<OrderModel> orders = [];
}
