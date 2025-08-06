import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = MediaQuery.of(context).size.height;
        final barHeight = screenHeight * 0.12;
        final fabHeight = screenHeight * 0.07;

        return SizedBox(
          height: barHeight,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: barHeight - 14,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(Icons.home, 0),
                      _buildNavItem(Icons.bookmark, 1),
                      SizedBox(width: 48), // Space for FAB
                      _buildNavItem(Icons.notifications_outlined, 2),
                      _buildNavItem(Icons.person_outline, 3),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    height: fabHeight,
                    width: fabHeight,
                    child: FloatingActionButton(
                      heroTag: 'fab_home',
                      onPressed: () {},
                      backgroundColor: AppColors.green,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.add, size: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isActive = index == selectedIndex;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SizedBox(
        width: 24,
        height: 24,
        child: Icon(
          icon,
          color: isActive ? AppColors.primaryGreen : AppColors.neutralGray4,
          size: 24,
        ),
      ),
    );
  }
}

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 8);
    path.lineTo(133.125, 8);
    path.cubicTo(142.872, 8, 151.129, 15.1439, 155.145, 24.0252);
    path.cubicTo(160.344, 35.5251, 170.228, 41, 188, 41);
    path.cubicTo(205.772, 41, 215.656, 35.5251, 220.855, 24.0252);
    path.cubicTo(224.871, 15.1439, 233.128, 8, 242.875, 8);
    path.lineTo(size.width, 8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
