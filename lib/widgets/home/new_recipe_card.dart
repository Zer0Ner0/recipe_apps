import 'package:flutter/material.dart';
import '../../models/recipe.dart';
import '../../constants/colors.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe-detail');
      },
      child: SizedBox(
        width: 251,
        child: Stack(
        children: [
          // Background card
          Container(
            margin: const EdgeInsets.only(top: 32),
            height: 95,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
          // Recipe image
          Positioned(
            top: 0,
            right: 10,
            child: Container(
              width: 80,
              height: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 19,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                  child: recipe.image.startsWith('http')
                      ? Image.network(
                          recipe.image,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.fastfood),
                        )
                      : Image.asset(
                          recipe.image,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.fastfood),
                        ),
              ),
            ),
          ),
          // Content
          Positioned(
            left: 9,
            top: 42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Static 5-star rating
                const Row(
                  children: [
                    Icon(Icons.star, color: AppColors.star, size: 11),
                    Icon(Icons.star, color: AppColors.star, size: 11),
                    Icon(Icons.star, color: AppColors.star, size: 11),
                    Icon(Icons.star, color: AppColors.star, size: 11),
                    Icon(Icons.star, color: AppColors.star, size: 11),
                  ],
                ),
                const SizedBox(height: 8),
                // Title
                SizedBox(
                  width: 139,
                  child: Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                // Author + Time
                Row(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.border,
                          child: Icon(Icons.person, size: 14, color: AppColors.white),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'By ${recipe.author ?? "Anonymous"}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: AppColors.textLight, size: 14),
                        const SizedBox(width: 5),
                        Text(
                          recipe.time,
                          style: const TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
