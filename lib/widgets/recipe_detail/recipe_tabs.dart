import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class RecipeTabs extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  const RecipeTabs({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      color: AppColors.white,
      child: Row(
        children: [
          // Procedure Tab
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(0),
              child: Container(
                height: 33,
                decoration: BoxDecoration(
                  color: selectedTab == 0 ? AppColors.primaryGreen : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Procedure',
                    style: TextStyle(
                      color: selectedTab == 0 ? AppColors.white : AppColors.primaryGreen80,
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Ingredient Tab
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(1),
              child: Container(
                height: 33,
                decoration: BoxDecoration(
                  color: selectedTab == 1 ? AppColors.primaryGreen : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Ingredient',
                    style: TextStyle(
                      color: selectedTab == 1 ? AppColors.white : AppColors.primaryGreen80,
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
