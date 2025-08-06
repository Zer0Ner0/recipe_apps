import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/recipe.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/saved/saved_recipe_card.dart';

class SavedRecipesScreen extends StatefulWidget {
  const SavedRecipesScreen({super.key});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  final List<Recipe> savedRecipes = [
    Recipe(
      id: 10001,
      title: 'Traditional spare ribs baked',
      time: '20 min',
      rating: '4.0',
      image:
          'https://api.builder.io/api/v1/image/assets/TEMP/4c9cea759cf079aaaf0441d55b08fc42491f6b9c?width=630',
      author: 'By Chef John',
    ),
    Recipe(
      id: 10002,
      title: 'Spice roasted chicken with flavored rice',
      time: '20 min',
      rating: '4.0',
      image:
          'https://api.builder.io/api/v1/image/assets/TEMP/c39ccf1363b6faf486819ca71ee8913f2390ce56?width=630',
      author: 'By Mark Kelvin',
    ),
    Recipe(
      id: 10003,
      title: 'Spicy fried rice mix chicken bali',
      time: '20 min',
      rating: '4.0',
      image:
          'https://api.builder.io/api/v1/image/assets/TEMP/bb39b056d056bc89de77dc0286babdb0a14abcff?width=630',
      author: 'By Spicy Nelly',
    ),
    Recipe(
      id: 10004,
      title: 'Lamb chops with fruity couscous and mint',
      time: '20 min',
      rating: '3.0',
      image:
          'https://api.builder.io/api/v1/image/assets/TEMP/805beafba33a1a64361a2887250711828cdfd2f0?width=630',
      author: 'By Spicy Nelly',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                _buildHeader(constraints),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ...savedRecipes.map((recipe) => SavedRecipeCard(recipe: recipe)),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/notifications');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
            case 4:
              Navigator.pushNamed(context, '/add');
              break;
          }
        },
      ),
    );
  }

  Widget _buildHeader(BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      height: constraints.maxHeight * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Center(
        child: Text(
          'Saved recipes',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppColors.labelColor,
          ),
        ),
      ),
    );
  }
}
