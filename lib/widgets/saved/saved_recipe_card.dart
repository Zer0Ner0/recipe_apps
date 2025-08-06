import 'package:flutter/material.dart';
import '../../models/recipe.dart';
import '../../constants/colors.dart';

class SavedRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const SavedRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxWidth * 0.45;
        return Container(
          width: double.infinity,
          height: cardHeight,
          margin: const EdgeInsets.only(bottom: 20),
          child: Stack(
            children: [
              // Background image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: recipe.image.startsWith('http')
                    ? Image.network(
                        recipe.image,
                        width: double.infinity,
                        height: cardHeight,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _fallbackImage(),
                      )
                    : Image.asset(
                        recipe.image,
                        width: double.infinity,
                        height: cardHeight,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _fallbackImage(),
                      ),
              ),

              // Gradient overlay
              Container(
                width: double.infinity,
                height: cardHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, AppColors.neutralBlack],
                  ),
                ),
              ),

              // Rating badge
              Positioned(
                top: 10,
                right: 37,
                child: _buildRatingBadge(),
              ),

              // Recipe title
              Positioned(
                left: 10,
                bottom: 36,
                child: SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              // Author
              Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  recipe.author ?? 'By Chef',
                  style: const TextStyle(
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutralGray4,
                  ),
                ),
              ),

              // Time badge
              Positioned(
                right: 60,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: CustomPaint(painter: TimerIconPainter()),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        recipe.time,
                        style: const TextStyle(
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.neutralGray4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bookmark icon
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CustomPaint(painter: BookmarkIconPainter()),
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

  Widget _fallbackImage() {
    return Container(
      color: AppColors.neutralGray4,
      child: const Icon(Icons.fastfood, size: 50),
    );
  }

  Widget _buildRatingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.secondaryYellow20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: AppColors.star, size: 8),
          const SizedBox(width: 3),
          Text(
            recipe.rating,
            style: const TextStyle(
              fontSize: 8,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: AppColors.neutralBlack,
            ),
          ),
        ],
      ),
    );
  }
}


class TimerIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.neutralGray4
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 1;

    // Draw circle
    canvas.drawCircle(center, radius, paint);

    // Draw clock hands
    paint.style = PaintingStyle.fill;

    // Hour hand (pointing up)
    canvas.drawLine(
      center,
      Offset(center.dx, center.dy - radius * 0.5),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BookmarkIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryGreen80
      ..style = PaintingStyle.fill;

    final path = Path();

    // Create bookmark shape
    path.moveTo(size.width * 0.2, size.height * 0.1);
    path.lineTo(size.width * 0.8, size.height * 0.1);
    path.lineTo(size.width * 0.8, size.height * 0.9);
    path.lineTo(size.width * 0.5, size.height * 0.7);
    path.lineTo(size.width * 0.2, size.height * 0.9);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
