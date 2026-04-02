import '../models/menu_item_model.dart';
import '../models/reservation_model.dart';
import '../models/order_model.dart';
import '../models/cart_item_model.dart';

class StaticData {
  static const List<String> categories = [
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
      name: 'Bruschetta',
      description: 'Grilled bread topped with fresh tomatoes, garlic, and basil',
      price: 8.99,
      imageUrl: 'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=400',
      category: 'Appetizers',
      isTrending: true,
      rating: 4.7,
    ),
    MenuItemModel(
      id: '2',
      name: 'Caesar Salad',
      description: 'Crisp romaine lettuce with parmesan, croutons, and Caesar dressing',
      price: 12.99,
      imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400',
      category: 'Appetizers',
      rating: 4.5,
    ),
    MenuItemModel(
      id: '3',
      name: 'Grilled Salmon',
      description: 'Fresh Atlantic salmon with lemon butter sauce and seasonal vegetables',
      price: 28.99,
      imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
      category: 'Main Course',
      isTrending: true,
      rating: 4.9,
    ),
    MenuItemModel(
      id: '4',
      name: 'Filet Mignon',
      description: '8oz premium beef tenderloin with red wine reduction',
      price: 45.99,
      imageUrl: 'https://images.unsplash.com/photo-1558030006-450675393462?w=400',
      category: 'Main Course',
      isTrending: true,
      rating: 4.8,
    ),
    MenuItemModel(
      id: '5',
      name: 'Pasta Carbonara',
      description: 'Classic Italian pasta with pancetta, eggs, and parmesan',
      price: 18.99,
      imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400',
      category: 'Main Course',
      rating: 4.6,
    ),
    MenuItemModel(
      id: '6',
      name: 'Tiramisu',
      description: 'Traditional Italian dessert with espresso-soaked ladyfingers',
      price: 9.99,
      imageUrl: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400',
      category: 'Desserts',
      isTrending: true,
      rating: 4.8,
    ),
    MenuItemModel(
      id: '7',
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with molten center served with vanilla ice cream',
      price: 11.99,
      imageUrl: 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=400',
      category: 'Desserts',
      rating: 4.7,
    ),
    MenuItemModel(
      id: '8',
      name: 'Espresso',
      description: 'Rich and bold Italian espresso',
      price: 3.99,
      imageUrl: 'https://images.unsplash.com/photo-1510707577719-ae7c14805e3a?w=400',
      category: 'Beverages',
      rating: 4.5,
    ),
    MenuItemModel(
      id: '9',
      name: 'Fresh Lemonade',
      description: 'House-made lemonade with fresh mint',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=400',
      category: 'Beverages',
      rating: 4.6,
    ),
    MenuItemModel(
      id: '10',
      name: "Chef's Special Risotto",
      description: 'Creamy arborio rice with wild mushrooms and truffle oil',
      price: 24.99,
      imageUrl: 'https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=400',
      category: 'Specials',
      isTrending: true,
      rating: 4.9,
    ),
  ];

  static List<ReservationModel> reservations = [
    ReservationModel(
      id: '1',
      userId: 'user1',
      date: DateTime.now().add(const Duration(days: 2)),
      time: '7:00 PM',
      guests: 4,
      status: 'confirmed',
    ),
    ReservationModel(
      id: '2',
      userId: 'user1',
      date: DateTime.now().add(const Duration(days: 5)),
      time: '8:30 PM',
      guests: 2,
      status: 'pending',
    ),
  ];

  static List<OrderModel> orders = [
    OrderModel(
      id: '1',
      userId: 'user1',
      items: [
        CartItemModel(menuItem: menuItems[0], quantity: 2),
        CartItemModel(menuItem: menuItems[3], quantity: 1),
      ],
      totalAmount: 63.97,
      status: 'completed',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    OrderModel(
      id: '2',
      userId: 'user1',
      items: [
        CartItemModel(menuItem: menuItems[2], quantity: 1),
        CartItemModel(menuItem: menuItems[5], quantity: 2),
      ],
      totalAmount: 48.97,
      status: 'preparing',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];

  static const List<String> timeSlots = [
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
    '7:30 PM',
    '8:00 PM',
    '8:30 PM',
    '9:00 PM',
  ];
}