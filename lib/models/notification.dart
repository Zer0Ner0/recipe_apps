enum NotificationType { newRecipe, saveRecipe }

class AppNotification {
  final String title;
  final String description;
  final String timeAgo;
  final NotificationType type;
  bool isRead;

  AppNotification({
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.type,
    this.isRead = false,
  });
}
