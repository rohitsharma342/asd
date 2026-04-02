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
      name: 'Margherita Pizza',
      description: 'Classic pizza with tomato sauce, mozzarella, and basil',
      price: 12.99,
      category: 'Main Course',
      imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400',
      isTrending: true,
      isAvailable: true,
    ),
    MenuItemModel(
      id: '2',
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with Caesar dressing and croutons',
      price: 8.99,
      category: 'Salads',
      imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400',
      isTrending: false,
      isAvailable: true,
    ),
    MenuItemModel(
      id: '3',
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with a molten center',
      price: 6.99,
      category: 'Desserts',
      imageUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400',
      isTrending: true,
      isAvailable: true,
    ),
    MenuItemModel(
      id: '4',
      name: 'Fresh Orange Juice',
      description: 'Freshly squeezed orange juice',
      price: 4.99,
      category: 'Beverages',
      imageUrl: 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=400',
      isTrending: false,
      isAvailable: true,
    ),
  ];

  static List<OrderModel> orders = [];
}
