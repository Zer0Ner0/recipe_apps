import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/profile/profile_recipe_card.dart';
import '../widgets/profile/profile_header_tabs.dart';
import '../widgets/profile/profile_avatar_stats.dart';
import '../widgets/profile/profile_bio_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Profile tab selected
  int _selectedTabIndex = 0; // Recipe tab selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/saved');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/notifications');
        break;
      case 3:
        // Already on profile screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralWhite,
      body: Column(
        children: [
          const SizedBox(height: 44),
          const ProfileHeader(),
          const SizedBox(height: 37),
          const ProfileAvatarStats(),
          const SizedBox(height: 25),
          const ProfileBioSection(),
          const SizedBox(height: 15),
          ProfileTabs(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  ProfileRecipeCard(
                    imageUrl:
                        'https://api.builder.io/api/v1/image/assets/TEMP/4c9cea759cf079aaaf0441d55b08fc42491f6b9c?width=630',
                    title: 'Traditional spare ribs baked',
                    creator: 'By Chef John',
                    rating: '4.0',
                    time: '20 min',
                    hasTimeIcon: true,
                  ),
                  SizedBox(height: 20),
                  ProfileRecipeCard(
                    imageUrl:
                        'https://api.builder.io/api/v1/image/assets/TEMP/c39ccf1363b6faf486819ca71ee8913f2390ce56?width=630',
                    title: 'spice roasted chicken with flavored rice',
                    creator: 'By Mark Kelvin',
                    rating: '4.0',
                    time: '20 min',
                    hasTimeIcon: false,
                  ),
                  SizedBox(height: 20),
                  ProfileRecipeCard(
                    imageUrl:
                        'https://api.builder.io/api/v1/image/assets/TEMP/250368f757c123e5260a0cd8cf29f61d2738590b?width=630',
                    title: 'Spicy fried rice mix chicken bali',
                    creator: 'By Spicy Nelly',
                    rating: '4.0',
                    time: '20 min',
                    hasTimeIcon: false,
                  ),
                  SizedBox(height: 20),
                  ProfileRecipeCard(
                    imageUrl:
                        'https://api.builder.io/api/v1/image/assets/TEMP/ad33659c33381eac40061641b81f19d65a13ad9f?width=630',
                    title: 'Lamb chops with fruity couscous and mint',
                    creator: 'By Spicy Nelly',
                    rating: '3.0',
                    time: '20 min',
                    hasTimeIcon: false,
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
