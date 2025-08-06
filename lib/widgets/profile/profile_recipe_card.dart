import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ProfileRecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String creator;
  final String rating;
  final String time;
  final bool hasTimeIcon;

  const ProfileRecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.creator,
    required this.rating,
    required this.time,
    required this.hasTimeIcon,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width - 60;

    return SizedBox(
      width: cardWidth,
      height: 150,
      child: Stack(
        children: [
          Container(
            width: cardWidth,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: cardWidth,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.secondaryYellow20,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 8, color: Color(0xFFFFAD30)),
                  const SizedBox(width: 3),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutralBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 64,
            child: SizedBox(
              width: cardWidth - 120,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutralWhite,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              creator,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: AppColors.neutralGray4,
              ),
            ),
          ),
          Positioned(
            right: 104,
            bottom: 10,
            child: Row(
              children: [
                if (hasTimeIcon)
                  Icon(Icons.access_time,
                      size: 17, color: AppColors.neutralGray4),
                if (hasTimeIcon) const SizedBox(width: 5),
                Text(
                  time,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutralGray4,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.neutralWhite,
              ),
              child: const Icon(Icons.bookmark_border,
                  size: 16, color: AppColors.primaryGreen80),
            ),
          ),
        ],
      ),
    );
  }
}
