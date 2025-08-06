import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class NotificationTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const NotificationTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 13),
      color: AppColors.neutralWhite,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTab("All", 0, constraints),
              _buildTab("Read", 1, constraints),
              _buildTab("Unread", 2, constraints),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTab(String label, int index, BoxConstraints constraints) {
    final isSelected = selectedIndex == index;
    final double tabWidth = (constraints.maxWidth - 40) / 3;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        width: tabWidth,
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primaryGreen : Colors.transparent,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? AppColors.neutralWhite
                  : AppColors.primaryGreen80,
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
