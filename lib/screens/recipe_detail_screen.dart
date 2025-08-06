import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/ingredient.dart';
import '../models/recipe_step.dart';
import '../widgets/recipe_detail/ingredient_item.dart';
import '../widgets/recipe_detail/procedure_step_item.dart';
import '../widgets/recipe_detail/recipe_tabs.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int selectedTab = 1;

  final List<Ingredient> ingredients = [
    Ingredient(name: 'Tomatos', amount: '500g', image: 'images/salad.jpg'),
    Ingredient(name: 'Cabbage', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Taco', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Slice Bread', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Green onion', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Omelette', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Hot Dog', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Oninon', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Lettuce', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Spinach', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Red & Green Chilli', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Fries', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Chicken', amount: '300g', image: 'images/salad.jpg'),
    Ingredient(name: 'Burger', amount: '300g', image: 'images/salad.jpg'),
  ];

  final List<RecipeStep> recipeSteps = List.generate(
    10,
    (index) => RecipeStep(
      stepNumber: index + 1,
      description: 'Lorem Ipsum tempor incididunt ut labore et dolore, in voluptate velit esse cillum dolore eu fugiat nulla pariatur?'
          '${index == 1 ? '\nTempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?' : ''}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildHeader(),
            _buildRecipeCard(screenHeight),
            _buildCreatorProfile(),
            RecipeTabs(
              selectedTab: selectedTab,
              onTabChanged: (index) {
                setState(() => selectedTab = index);
              },
            ),
            _buildRecipeInfo(),
            Expanded(
              child: selectedTab == 0
                  ? _buildProcedureContent()
                  : _buildIngredientsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: AppColors.labelColor, size: 20),
          ),
          const Icon(Icons.more_horiz, color: AppColors.labelColor, size: 24),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(double screenHeight) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/salad.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                    ),
                  ),
                ),
                Positioned(
                  left: 134,
                  top: 51,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.neutralGray4,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(Icons.play_arrow, color: AppColors.primaryGreen80, size: 24),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryYellow20,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: AppColors.star, size: 8),
                        SizedBox(width: 3),
                        Text('4.0', style: TextStyle(color: AppColors.neutralBlack, fontSize: 8, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 60,
                  child: Row(
                    children: const [
                      Icon(Icons.access_time, color: AppColors.neutralGray4, size: 17),
                      SizedBox(width: 5),
                      Text('20 min', style: TextStyle(color: AppColors.neutralGray4, fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.bookmark_border, color: AppColors.primaryGreen80, size: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Spicy chicken burger with French fries',
                  style: TextStyle(color: AppColors.labelColor, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 10),
              Text('13k Reviews', style: TextStyle(color: AppColors.neutralGray3, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorProfile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(40)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'images/avatar.png',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.person, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Laura wilson', style: TextStyle(color: AppColors.labelColor, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.primaryGreen80, size: 11),
                        SizedBox(width: 3),
                        Text('Lagos, Nigeria', style: TextStyle(color: AppColors.neutralGray3, fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(color: AppColors.primaryGreen, borderRadius: BorderRadius.circular(10)),
            child: const Text('Follow', style: TextStyle(color: AppColors.white, fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: const Row(
        children: [
          Row(
            children: [
              Icon(Icons.restaurant_menu, color: AppColors.neutralGray3, size: 17),
              SizedBox(width: 5),
              Text('1 serve', style: TextStyle(color: AppColors.neutralGray3, fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
            ],
          ),
          Spacer(),
          Text('10 Steps', style: TextStyle(color: AppColors.neutralGray3, fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _buildIngredientsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ingredients.length,
        itemBuilder: (context, index) => IngredientItem(ingredient: ingredients[index]),
      ),
    );
  }

  Widget _buildProcedureContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: recipeSteps.length,
        itemBuilder: (context, index) => ProcedureStepItem(step: recipeSteps[index]),
      ),
    );
  }
}
