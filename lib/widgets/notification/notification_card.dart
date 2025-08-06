import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/notification.dart';
import 'notification_icons.dart';


class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeAgo;
  final NotificationType type;
  final bool hasUnreadDot;

  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.type,
    this.hasUnreadDot = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.neutralGray4.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Main content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.labelColor,
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Description
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.neutralGray3,
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Time ago
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      color: AppColors.neutralGray3,
                      fontFamily: 'Poppins',
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Right: Icon and unread dot
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryYellow20,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: type == NotificationType.newRecipe
                        ? const DocumentIcon(size: 16)
                        : const HeartIcon(size: 16),
                  ),
                ),
                if (hasUnreadDot)
                  Positioned(
                    top: -3,
                    right: -3,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryOrange,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.neutralWhite,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
