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
      name: 'Margherita Pizza',
      description: 'Classic pizza with tomato sauce, mozzarella, and fresh basil',
      price: 12.99,
      category: 'Main Course',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: '2',
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with Caesar dressing and croutons',
      price: 8.99,
      category: 'Appetizers',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: false,
    ),
    MenuItemModel(
      id: '3',
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with a molten center',
      price: 6.99,
      category: 'Desserts',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: '4',
      name: 'Fresh Orange Juice',
      description: 'Freshly squeezed orange juice',
      price: 4.99,
      category: 'Beverages',
      imageUrl: 'https://via.placeholder.com/300x200',
      isAvailable: true,
      isTrending: false,
    ),
  ];

  static List<OrderModel> orders = [];
}
