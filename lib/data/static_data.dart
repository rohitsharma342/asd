import '../models/order_model.dart';
import '../models/menu_item_model.dart';
import '../models/reservation_model.dart';
import '../models/cart_item_model.dart';
import '../models/user_model.dart';

class StaticData {
  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      id: 'menu_1',
      name: 'Classic Burger',
      description: 'Juicy beef patty with fresh lettuce, tomato, and our special sauce',
      price: 12.99,
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500',
      category: 'Main Course',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: 'menu_2',
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with parmesan cheese and croutons',
      price: 9.99,
      imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500',
      category: 'Appetizers',
      isAvailable: true,
      isTrending: false,
    ),
    MenuItemModel(
      id: 'menu_3',
      name: 'Margherita Pizza',
      description: 'Classic Italian pizza with fresh mozzarella and basil',
      price: 14.99,
      imageUrl: 'https://images.unsplash.com/photo-1604382355076-af4b0eb60143?w=500',
      category: 'Main Course',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: 'menu_4',
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with a molten center',
      price: 7.99,
      imageUrl: 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=500',
      category: 'Desserts',
      isAvailable: true,
      isTrending: true,
    ),
    MenuItemModel(
      id: 'menu_5',
      name: 'Fresh Lemonade',
      description: 'Refreshing homemade lemonade with mint',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=500',
      category: 'Beverages',
      isAvailable: true,
      isTrending: false,
    ),
  ];

  static List<OrderModel> orders = [];

  static List<ReservationModel> reservations = [];

  static List<String> categories = [
    'All',
    'Appetizers',
    'Main Course',
    'Desserts',
    'Beverages',
  ];

  static UserModel? currentUser;
}