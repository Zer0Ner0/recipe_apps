import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/notification.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/notification/notification_card.dart';
import '../widgets/notification/notification_tabs.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedTabIndex = 0;
  int _selectedNavIndex = 2; // Notifications tab is selected

  final List<AppNotification> _notifications = [
    AppNotification(
      title: 'New Recipe Alert!',
      description: 'Try out our new Mediterranean salad recipe!',
      timeAgo: '10 mins ago',
      type: NotificationType.newRecipe,
      isRead: false,
    ),
    AppNotification(
      title: 'Recipe Saved!',
      description: 'Spaghetti Carbonara saved to your favorites.',
      timeAgo: '1 day ago',
      type: NotificationType.saveRecipe,
      isRead: false,
    ),
    AppNotification(
      title: 'Weekly Digest',
      description: 'Top 5 recipes this week are here!',
      timeAgo: '1 day ago',
      type: NotificationType.newRecipe,
      isRead: true,
    ),
  ];

  List<AppNotification> get filteredNotifications {
    switch (_selectedTabIndex) {
      case 1:
        return _notifications.where((n) => n.isRead).toList(); // Read
      case 2:
        return _notifications.where((n) => !n.isRead).toList(); // Unread
      default:
        return _notifications; // All
    }
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/saved');
        break;
      case 2:
        // Already on notifications screen
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralWhite,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: const Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    color: AppColors.labelColor,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Tabs
            NotificationTabs(
              selectedIndex: _selectedTabIndex,
              onTabSelected: _onTabSelected,
            ),

            // Notifications content
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: _buildNotificationContent(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedNavIndex,
        onItemTapped: _onNavItemTapped,
      ),
    );
  }

  Widget _buildNotificationContent() {
    final today =
        filteredNotifications.where((n) => n.timeAgo.contains('min')).toList();
    final yesterday =
        filteredNotifications.where((n) => n.timeAgo.contains('day')).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (today.isNotEmpty) ...[
          _buildSectionTitle('Today'),
          const SizedBox(height: 10),
          ...today.map((n) => NotificationCard(
                title: n.title,
                description: n.description,
                timeAgo: n.timeAgo,
                type: n.type,
                hasUnreadDot: !n.isRead,
                onTap: () {
                  setState(() {
                    n.isRead = true;
                  });
                },
              )),
          const SizedBox(height: 20),
        ],
        if (yesterday.isNotEmpty) ...[
          _buildSectionTitle('Yesterday'),
          const SizedBox(height: 10),
          ...yesterday.map((n) => NotificationCard(
                title: n.title,
                description: n.description,
                timeAgo: n.timeAgo,
                type: n.type,
                hasUnreadDot: !n.isRead,
                onTap: () {
                  setState(() {
                    n.isRead = true;
                  });
                },
              )),
        ],
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.neutralBlack,
          fontFamily: 'Poppins',
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
