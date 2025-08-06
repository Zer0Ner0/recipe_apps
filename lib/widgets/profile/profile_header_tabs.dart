import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          const Spacer(),
          const Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.labelColor,
            ),
          ),
          const Spacer(),
          const SizedBox(
            width: 24,
            height: 24,
            child:
                Icon(Icons.more_horiz, color: AppColors.neutralBlack, size: 24),
          ),
        ],
      ),
    );
  }
}

class ProfileTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const ProfileTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 13),
      color: AppColors.neutralWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTab('Recipe', 0),
          const SizedBox(width: 7),
          _buildTab('Videos', 1),
          const SizedBox(width: 7),
          _buildTab('Tag', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        width: 107,
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primaryGreen : Colors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: isSelected
                  ? AppColors.neutralWhite
                  : AppColors.primaryGreen80,
            ),
          ),
        ),
      ),
    );
  }
}
