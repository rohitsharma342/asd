import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/theme.dart';
import '../config/routes.dart';
import '../providers/auth_provider.dart';
import '../providers/menu_provider.dart';
import '../providers/reservation_provider.dart';
import '../providers/order_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/reservation_card.dart';
import '../widgets/order_card.dart';
import '../widgets/category_tab.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;
  int _notificationCount = 3;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).loadOrders();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWeb = size.width > 900;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: isWeb ? _buildWebLayout(context) : _buildMobileLayout(context),
      ),
      bottomNavigationBar: isWeb ? null : _buildBottomNavigationBar(authProvider),
      floatingActionButton: _currentIndex == 0
          ? Consumer<CartProvider>(
              builder: (context, cartProvider, _) {
                if (cartProvider.isEmpty) return const SizedBox.shrink();
                return FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.orderPlacement);
                  },
                  backgroundColor: AppTheme.primaryColor,
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text(
                    'Cart (${cartProvider.itemCount})',
                    style: const TextStyle(color: Colors.white),
                  ),
                ).animate().scale(delay: 300.ms);
              },
            )
          : null,
    );
  }

  Widget _buildBottomNavigationBar(AuthProvider authProvider) {
    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today_outlined),
        activeIcon: Icon(Icons.calendar_today),
        label: 'Reservations',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.receipt_long_outlined),
        activeIcon: Icon(Icons.receipt_long),
        label: 'Orders',
      ),
    ];

    if (authProvider.user?.isStaff == true) {
      items.add(
        const BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu_outlined),
          activeIcon: Icon(Icons.restaurant_menu),
          label: 'Menu',
        ),
      );
    }

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: items,
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    switch (_currentIndex) {
      case 0:
        return _buildHomeTab(context);
      case 1:
        return _buildReservationsTab(context);
      case 2:
        return _buildOrdersTab(context);
      case 3:
        if (authProvider.user?.isStaff == true) {
          return _buildMenuManagementTab(context);
        }
        return _buildHomeTab(context);
      default:
        return _buildHomeTab(context);
    }
  }

  Widget _buildWebLayout(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          labelType: NavigationRailLabelType.all,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_today_outlined),
              selectedIcon: Icon(Icons.calendar_today),
              label: Text('Reservations'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(Icons.receipt_long),
              label: Text('Orders'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.restaurant_menu_outlined),
              selectedIcon: Icon(Icons.restaurant_menu),
              label: Text('Menu'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: _buildMobileLayout(context),
        ),
      ],
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _buildHeader(context),
        ),
        SliverToBoxAdapter(
          child: _buildSearchBar(context),
        ),
        SliverToBoxAdapter(
          child: _buildCategories(context),
        ),
        SliverToBoxAdapter(
          child: _buildTrendingSection(context),
        ),
        SliverToBoxAdapter(
          child: _buildMenuSection(context),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ${authProvider.user?.name.split(' ').first ?? 'Guest'}!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'What would you like today?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideX(begin: -0.1, end: 0),
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _notificationCount = 0;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No new notifications')),
                      );
                    },
                    icon: const Icon(Icons.notifications_outlined),
                    iconSize: 28,
                  ),
                  if (_notificationCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppTheme.errorColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$_notificationCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.profile);
                },
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                  backgroundImage: authProvider.user?.profileImage != null
                      ? CachedNetworkImageProvider(authProvider.user!.profileImage!)
                      : null,
                  child: authProvider.user?.profileImage == null
                      ? const Icon(Icons.person, color: AppTheme.primaryColor)
                      : null,
                ),
              ),
            ],
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideX(begin: 0.1, end: 0),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          Provider.of<MenuProvider>(context, listen: false).setSearchQuery(value);
        },
        decoration: InputDecoration(
          hintText: 'Search for dishes...',
          prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondary),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    Provider.of<MenuProvider>(context, listen: false).setSearchQuery('');
                  },
                )
              : null,
        ),
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildCategories(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menuProvider, _) {
        return Container(
          height: 50,
          margin: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: menuProvider.categories.length,
            itemBuilder: (context, index) {
              final category = menuProvider.categories[index];
              final isSelected = category == menuProvider.selectedCategory;
              
              return CategoryTab(
                label: category,
                isSelected: isSelected,
                onTap: () => menuProvider.setCategory(category),
              ).animate().fadeIn(delay: Duration(milliseconds: 100 * index));
            },
          ),
        );
      },
    );
  }

  Widget _buildTrendingSection(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menuProvider, _) {
        final trendingItems = menuProvider.trendingItems;
        
        if (trendingItems.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Now 🔥',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: trendingItems.length,
                itemBuilder: (context, index) {
                  final item = trendingItems[index];
                  return Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 16),
                    child: MenuItemCard(
                      menuItem: item,
                      isCompact: true,
                    ),
                  ).animate().fadeIn(delay: Duration(milliseconds: 100 * index));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menuProvider, _) {
        final items = menuProvider.menuItems;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Our Menu',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            if (menuProvider.isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (items.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        size: 64,
                        color: AppTheme.textSecondary.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No items found',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return MenuItemCard(menuItem: items[index])
                      .animate()
                      .fadeIn(delay: Duration(milliseconds: 50 * index));
                },
              ),
            const SizedBox(height: 100),
          ],
        );
      },
    );
  }

  Widget _buildReservationsTab(BuildContext context) {
    return Consumer<ReservationProvider>(
      builder: (context, reservationProvider, _) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                title: const Text('My Reservations'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.reservation);
                    },
                  ),
                ],
              ),
              if (reservationProvider.isLoading)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (reservationProvider.reservations.isEmpty)
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 80,
                          color: AppTheme.textSecondary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No reservations yet',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppTheme.textSecondary,
                              ),
                        ),
                        const SizedBox(height: 8),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.reservation);
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Make a Reservation'),
                        ),
                      ],
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final reservation = reservationProvider.reservations[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ReservationCard(reservation: reservation)
                              .animate()
                              .fadeIn(delay: Duration(milliseconds: 100 * index)),
                        );
                      },
                      childCount: reservationProvider.reservations.length,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOrdersTab(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, _) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: RefreshIndicator(
            onRefresh: () => orderProvider.refreshOrders(),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  title: const Text('My Orders'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.orderPlacement);
                      },
                    ),
                  ],
                ),
                if (orderProvider.isLoading)
                  SliverFillRemaining(
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  )
                else if (orderProvider.error != null)
                  SliverFillRemaining(
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 80,
                              color: AppTheme.errorColor.withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Something went wrong',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.textSecondary,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            TextButton.icon(
                              onPressed: () {
                                orderProvider.refreshOrders();
                              },
                              icon: const Icon(Icons.refresh),
                              label: const Text('Try Again'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else if (orderProvider.orders.isEmpty)
                  SliverFillRemaining(
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.receipt_long_outlined,
                              size: 80,
                              color: AppTheme.textSecondary.withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No orders yet',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.textSecondary,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  _currentIndex = 0;
                                });
                              },
                              icon: const Icon(Icons.restaurant_menu),
                              label: const Text('Browse Menu'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final order = orderProvider.orders[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: OrderCard(order: order)
                                .animate()
                                .fadeIn(delay: Duration(milliseconds: 100 * index)),
                          );
                        },
                        childCount: orderProvider.orders.length,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuManagementTab(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.menuManagement);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.restaurant_menu,
              size: 80,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Staff Menu Management',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.menuManagement);
              },
              icon: const Icon(Icons.edit),
              label: const Text('Manage Menu'),
            ),
          ],
        ),
      ),
    );
  }
}